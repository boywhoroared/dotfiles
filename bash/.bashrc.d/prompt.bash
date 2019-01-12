# Frontend to controlling prompt
prompt() {

    # What's done next depends on the first argument to the function
    case $1 in

        # Turn complex, colored PS1 and debugging PS4 prompts on
        on)
            # Set up pre-prompt command
            PROMPT_COMMAND='history -a'

            # If Bash 4.0 is available, trim very long paths in prompt
            if ((BASH_VERSINFO[0] >= 4)) ; then
                PROMPT_DIRTRIM=4
            fi

            # Basic prompt shape depends on whether we're in SSH or not
            PS1=
            if [[ -n $SSH_CLIENT || -n $SSH_CONNECTION ]] ; then
                PS1=$PS1'\h:'
            fi
            PS1=$PS1'\w'

            # Add sub-commands; VCS, job, and return status checks
            PS1=$PS1'$(ret=$?;prompt vcs;prompt job;prompt ret)'

            # Add a helpful prefix if this shell appears to be exotic
            case ${SHELL##*/} in
                (bash) ;;
                (*) PS1=bash:$PS1 ;;
            esac

            # Add prefix and suffix
            PS1='${PROMPT_PREFIX}'$PS1'${PROMPT_SUFFIX}'

            # Add terminating "$" or "#" sign
            PS1=$PS1'\$'

            # Declare variables to contain terminal control strings
            local format reset

            # Disregard output and error from these tput(1) calls
            {
                # Count available colors
                local -i colors
                colors=$(tput colors || tput Co)

                # Prepare reset code
                reset=$(tput sgr0 || tput me)

                # Check if we have non-bold bright green available
                if ((colors >= 16)) ; then
                    format=$(
                        pc=${PROMPT_COLOR:-10}
                        tput setaf "$pc" ||
                        tput setaf "$pc" 0 0 ||
                        tput AF "$pc" ||
                        tput AF "$pc" 0 0
                    )

                # If we have only eight colors, use bold green
                elif ((colors >= 8)) ; then
                    format=$(
                        pc=${PROMPT_COLOR:-2}
                        tput setaf "$pc" || tput AF "$pc"
                        tput bold || tput md
                    )

                # Otherwise, we just try bold
                else
                    format=$(tput bold || tput md)
                fi

            } >/dev/null 2>&1

            # String it all together
            PS1='\['"$format"'\]'"$PS1"'\['"$reset"'\] '
            PS2='> '
            PS3='? '
            PS4='+<$?> ${BASH_SOURCE:-$BASH}:${FUNCNAME[0]}:$LINENO:'
            ;;

        # Revert to simple inexpensive prompts
        off)
            unset -v PROMPT_COMMAND PROMPT_DIRTRIM
            PS1='$ '
            PS2='> '
            PS3='? '
            PS4='+ '
            if [[ -n $SSH_CLIENT || -n $SSH_CONNECTION ]] ; then
                PS1=$(hostname -s)'$ '
            fi
            ;;

        # Git prompt function
        git)

            # Wrap as compound command; we don't want to see output from any of
            # these git(1) calls
            {
                # Bail if we're not in a work tree--or, implicitly, if we don't
                # have git(1).
                [[ $(git rev-parse --is-inside-work-tree) == true ]] ||
                    return

                # Refresh index so e.g. git-diff-files(1) is accurate
                git update-index --refresh

                # Find a local branch, remote branch, or tag (annotated or
                # not), or failing all of that just show the short commit ID,
                # in that order of preference; if none of that works, bail out
                local name
                name=$(
                    git symbolic-ref --quiet HEAD ||
                    git describe --tags --exact-match HEAD ||
                    git rev-parse --short HEAD
                ) || return
                name=${name#refs/*/}
                [[ -n $name ]] || return

                # Check various files in .git to flag processes
                local proc
                if [[ -d .git/rebase-merge || -d .git/rebase-apply ]] ; then
                    proc=${proc:+"$proc",}'REBASE'
                fi
                if [[ -f .git/MERGE_HEAD ]] ; then
                    proc=${proc:+"$proc",}'MERGE'
                fi
                if [[ -f .git/CHERRY_PICK_HEAD ]] ; then
                    proc=${proc:+"$proc",}'PICK'
                fi
                if [[ -f .git/REVERT_HEAD ]] ; then
                    proc=${proc:+"$proc",}'REVERT'
                fi
                if [[ -f .git/BISECT_LOG ]] ; then
                    proc=${proc:+"$proc",}'BISECT'
                fi

                # Collect symbols representing repository state
                local state

                # Upstream HEAD has commits after local HEAD; we're "behind"
                if (($(git rev-list --count 'HEAD..@{u}'))) ; then
                    state=${state}'<'
                fi

                # Local HEAD has commits after upstream HEAD; we're "ahead"
                if (($(git rev-list --count '@{u}..HEAD'))) ; then
                    state=${state}'>'
                fi

                # Tracked files are modified
                if ! git diff-files --no-ext-diff --quiet ; then
                    state=${state}'!'
                fi

                # Changes are staged
                if ! git diff-index --cached --no-ext-diff --quiet HEAD ; then
                    state=${state}'+'
                fi

                # There are some untracked and unignored files
                if git ls-files --directory --error-unmatch \
                        --exclude-standard --no-empty-directory \
                        --others -- ':/*' ; then
                    state=${state}'?'
                fi

                # There are stashed changes
                if git rev-parse --quiet --verify refs/stash ; then
                    state=${state}'^'
                fi

            } >/dev/null 2>&1

            # For some reason, five commands in the above block seem to stick
            # around as jobs after this command is over; I don't know why, but
            # this clears it; might be a bug
            jobs >/dev/null

            # Print the status in brackets; add a git: prefix only if there
            # might be another VCS prompt (because PROMPT_VCS is set)
            printf '(%s%s%s%s)' \
                "${PROMPT_VCS:+git:}" \
                "${name//\\/\\\\}" \
                "${proc:+:"${proc//\\/\\\\}"}" \
                "${state//\\/\\\\}"
            ;;

        # Subversion prompt function
        svn)
            # Determine the repository URL and root directory
            local key value url root
            while [[ -z $url || -z $root ]] && IFS=: read -r key value ; do
                case $key in
                    'URL') url=${value## } ;;
                    'Repository Root') root=${value## } ;;
                esac
            done < <(svn info 2>/dev/null)

            # Exit if we couldn't get either--or, implicitly, if we don't have
            # svn(1).
            [[ -n $url ]] || return
            [[ -n $root ]] || return

            # Remove the root from the URL to get what's hopefully the branch
            # name, removing leading slashes and the 'branches' prefix, and any
            # trailing content after a slash
            local branch
            branch=${url/"$root"}
            branch=${branch#/}
            branch=${branch#branches/}
            branch=${branch%%/*}
            branch=${branch:-unknown}

            # Parse the output of svn status to determine working copy state
            local symbol
            local -i modified untracked
            while ((!modified || !untracked)) && read -r symbol _ ; do
                case $symbol in
                    *\?*) untracked=1 ;;
                    *) modified=1 ;;
                esac
            done < <(svn status 2>/dev/null)

            # Add appropriate state flags
            local state
            if ((modified)) ; then
                state=${state}'!'
            fi
            if ((untracked)) ; then
                state=${state}'?'
            fi

            # Print the state in brackets with an svn: prefix
            printf '(svn:%s%s)' \
                "${branch//\\/\\\\}" \
                "${state//\\/\\\\}"
            ;;

        # VCS wrapper prompt function; print the first relevant prompt, if any
        vcs)
            local vcs
            for vcs in "${PROMPT_VCS[@]:-git}" ; do
                prompt "$vcs" && return
            done
            ;;

        # Show return status of previous command in angle brackets, if not zero
        ret)
            # shellcheck disable=SC2154
            ((ret)) || return
            printf '<%u>' "${ret//\\/\\\\}"
            ;;

        # Show the count of background jobs in curly brackets, if not zero
        job)
            local -i jobc
            while read -r ; do
                ((jobc++))
            done < <(jobs -p)
            ((jobc)) || return
            printf '{%u}' "${jobc//\\/\\\\}"
            ;;

        # No argument given, print prompt strings and vars
        '')
            declare -p PS1 PS2 PS3 PS4
            ;;

        # Print error
        *)
            printf '%s: Unknown command %s\n' "${FUNCNAME[0]}" "$1" >&2
            return 2
            ;;
    esac
}

# Default to a full-featured prompt, but use PROMPT_MODE if that's set
prompt "${PROMPT_MODE:-on}"
