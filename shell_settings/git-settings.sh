alias gpr="git pull --rebase"
alias gcm="git checkout master"
alias gcmf="git checkout --force master"
alias gst="git status"

function cleanup_branches {
  git branch --merged | grep -v \"\*\" | grep -vw master | xargs -n 1 git branch -d
  git remote prune origin
}

# Run once on startup
function _git_config_useful_defaults {
  git config --global push.default simple
  git config --global color.ui true
  git config --global core.editor vim
  git config --global user.name 'Bheeshmar Redheendran'
  git config --global user.email 'bheeshmar@gmail.com'
}

# Prompt
MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"
WHITE="\[\033[0;0m\]"
GIT_PS1_SHOWDIRTYSTATE=true
export LS_OPTIONS='--color=auto'
export CLICOLOR=1
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

export PS1=$LIGHT_GRAY"\t"'$(
    if [[ $(__git_ps1) =~ \*\)$ ]]
    # a file has been modified but not added
    then echo "'$YELLOW'"$(__git_ps1 " (%s)")
    elif [[ $(__git_ps1) =~ \+\)$ ]]
    # a file has been added, but not commited
    then echo "'$MAGENTA'"$(__git_ps1 " (%s)")
    # the state is clean, changes are commited
    else echo "'$CYAN'"$(__git_ps1 " (%s)")
    fi)'$GREEN" \W"$WHITE": "
