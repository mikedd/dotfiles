prompt_kubecontext() {
  if [[ $(kubectl config current-context) == *"testing"* ]]; then
        prompt_segment green black "(`kubectl config current-context`)"
  elif [[ $(kubectl config current-context) == *"staging"* ]]; then
        prompt_segment yellow black "(`kubectl config current-context`)"
  elif [[ $(kubectl config current-context) == *"production"* ]]; then
        prompt_segment red yellow "(`kubectl config current-context`)"
  fi
}

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

PROMPT='${ret_status} %{$fg[green]%}${PWD/#$HOME/~}%{$reset_color%} %{$fg[magenta]%}$(kubectl config current-context)%{$reset_color%} $(git_prompt_info) '
