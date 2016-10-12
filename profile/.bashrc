export TERM=xterm-256color

#source ~/.bash-git-prompt/gitprompt.sh
GIT_PROMPT_ONLY_IN_REPO=1


# Powerline
powerline-daemon -q

#Not thrilled about anaconda2, might need to refactor later
source /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
