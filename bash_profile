# the accepted practice is to source .bashrc in .bash_profile.
# you should not source .bash_profile from .bashrc
# http://www.gnu.org/software/bash/manual/bashref.html#Bash-Startup-Files

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
