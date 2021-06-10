
## FZF

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

## 20190320 - Powerline go
function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go -error $?)"
}

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi



## Docker based functions

yq() {
  podman run --rm -i -v "${PWD}":/workdir mikefarah/yq "$@"
}

npm() {
  podman run --rm -i -v "${PWD}":/usr/src/app -w /usr/src/app node npm "$@"
}

yarn() {
  podman run --rm -i -v "${PWD}":/usr/src/app -w /usr/src/app node yarn "$@"
}

## zoxide - installed from github - musl -v0.5
eval "$(zoxide init bash)"


## Search_for: 
## Dependencies: needs fzf and rg & vim-fetch plugin.Install it with vim-plug

sf() {
  command -v rg >/dev/null 2>&1 || { echo >&2 "require rg but it's not installed.  Aborting."; return -1; }  
  command -v fzf >/dev/null 2>&1 || { echo >&2 "require fzf but it's not installed.  Aborting."; return -1; }  
  if [ "$#" -lt 1 ]; then echo "Supply string to search for!"; return 1; fi
  printf -v search "%q" "$*"
  include="txt,tsx,vim,ts,yml,yaml,js,json,php,md,styl,pug,jade,html,config,py,cpp,c,go,hs,rb,conf,fa,lst,graphql,tf"
  exclude="output,.config,.git,node_modules,vendor,build/,yarn.lock,*.sty,*.bst,*.coffee,dist"
  rg_command='rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always" -g "*.{'$include'}" -g "!{'$exclude'}/*"'
  files=`eval $rg_command $search | fzf --ansi --multi --reverse | awk -F ':' '{print $1":"$2":"$3}'`
  [[ -n "$files" ]] && ${EDITOR:-vim} $files
}
