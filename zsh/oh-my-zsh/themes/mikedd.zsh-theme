orange=202

typeset -A context
context=(
    dmo-ttc 161
    dmo-tte 161
    dmo-test-ttc 140
    dmo-test-tte 140
    tfm-test-ttc green
    tfm-test-tte green
    tfm-stage-ttc yellow
    tfm-stage-tte yellow
    tfm-prod-ttc red
    tfm-prod-tte red
    efs-ttc-dev  green
    efs-tte-dev  green
    efs-ttc-stage  yellow
    efs-tte-stage  yellow
    efs-ttc  magenta
    efs-tte  magenta
    dmo-ttc-bigoli-prod red
    dmo-tte-bigoli-prod red
    dmo-ttc-bigoli-test yellow
    dmo-tte-bigoli-test yellow
)

k8s_prompt() {
    local ctx
    local color
    ctx=$(kubectl config current-context)
    #ctx=$(cat ${HOME}/.kube_ctx)

    color=$context[$ctx]

    #print -n %{$fg[${color}]%}${ctx}%{$reset_color%}
    print -P "%F{$color}${ctx}%{$reset_color%}"
}

show_virtual_env(){
    if [ -n "$VIRTUAL_ENV" ]
    then
        venv=$(basename $VIRTUAL_ENV)
        print -n "%{$fg[magenta]%}(${venv})%{$reset_color%} "
    fi
}


local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

PROMPT='${ret_status} $(show_virtual_env)%{$fg[green]%}${PWD/#$HOME/~}%{$reset_color%} $(git_prompt_info) '
