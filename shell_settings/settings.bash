# Use vi keys
#set -o vi

# Append to history instead of overwriting
shopt -s histappend

# Update the history after every command
unset PROMPT_COMMAND
PROMPT_COMMAND='history -a'
PROMPT_COMMAND="$PROMPT_COMMAND; history -a"

# Use my inputrc
export INPUTRC=$MY_SHELL_SETTINGS/settings.inputrc

source $MY_SHELL_SETTINGS/git-settings.sh
