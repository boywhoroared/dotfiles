# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
for file in ~/.{path,bash_prompt,env,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Make sure terminals adjust lines after they (the terminals) have been resized
shopt -s checkwinsize

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
# for option in autocd globstar; do
#     shopt -s "$option" 2> /dev/null
# done

# Use vi mode
set -o vi

# Local config
# can be used for other settings you don’t want to commit.
[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local
