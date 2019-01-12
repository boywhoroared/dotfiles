# If we can read ~/.oldpwd, make its contents our OLDPWD
if [ -r "${OLDPWD_FILE:-$HOME/.oldpwd}" ] ; then
    read -r OLDPWD < "${OLDPWD_FILE:-$HOME/.oldpwd}"
    export OLDPWD
fi

