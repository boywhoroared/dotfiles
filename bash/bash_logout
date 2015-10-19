# Ensure we're using at least version 2.05. Weird arithmetic syntax needed here
# due to leading zeroes and trailing letters in some 2.x version numbers (e.g.
# 2.05a).
if ! [ -n "$BASH_VERSINFO" ] ; then
    return
elif ((BASH_VERSINFO[0] == 2)) && \
     ((10#${BASH_VERSINFO[1]%%[![:digit:]]*} < 5)) ; then
    return
fi

# Clear console if possible when logging out
if ((SHLVL == 1)) ; then
    clear_console -q 2>/dev/null
fi

# Write PWD to a file if set
printf '%s\n' "$PWD" > "${OLDPWD_FILE:-$HOME/.oldpwd}"

