# enable vi mode
set -o vi

# general aliases
alias ..='cd ..'
alias ws='cd /D/Code'
alias cnpm="npm --registry=https://registry.npm.taobao.org --cache=${HOME}/.npm/.cache/cnpm --disturl=https://npm.taobao.org/dist --userconfig=${HOME}/.cnpmrc"
alias n="npm"
alias conf="vim ~/.profile"
alias la='/bin/ls -ah --color'
alias ll='/bin/ls -lh --color'
alias ls='/bin/ls --color'
alias please='sudo'
alias pp='popd'
alias pu='pushd'
alias py="winpty python"
alias reload="source ~/.profile"
alias ta='tmux attach'
alias vi='vim'

# git aliases
alias g='git'
alias gc='git remote show | xargs -I{} git remote prune {} && git gc'
alias gd='git diff'
alias gpl='git pull'
alias gst='git status'
alias it='git'
alias lg='git logg'
alias qgit='git'

# python aliases
alias pm="python manage.py"
alias psi="python setup.py install"
alias bv="bumpversion"

# pipenv aliases
alias pv="pipenv"
alias pr="pipenv run"
alias pf="pipenv run fab"
alias pinv="pipenv run inv"
alias ppm="pipenv run python manage.py"

# vagrant aliases
alias vgst="vagrant global-status"
alias vr="vagrant"
alias vst="vagrant status"
alias vu="vagrant up"

# docker aliases from tcnksm/docker-alias
alias dc='docker-compose'
alias dm='docker-machine'
alias dl="docker ps -l -q"
alias dps="docker ps"
alias dpa="docker ps -a"
alias di="docker images"
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias dkd="docker run -d -P"
alias dki="docker run -i -t -P"
alias dex="docker exec -i -t"
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }
dstop() { docker stop $(docker ps -a -q); }
drm() { docker rm $1; }
drmf() { docker stop $1; docker rm $1; }
dri() { docker rmi $(docker images -q); }
dbu() { docker build -t=$1 .; }
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }

# kubectl aliases
alias k="kubectl"
alias kaf="kubectl apply -f"
alias kak="kubectl apply -k"
alias kc="kubectl config"
alias kcl="kubectl config get-contexts | cut -c1-16,64-100"
alias kcns="kubectl config set-context --current --namespace"
alias kcu="kubectl config use-context"
alias kd="kubectl describe"
alias kdel="kubectl delete"
alias ke="kubectl edit"
alias kex="kubectl exec -it"
alias kg="kubectl get"
alias kga="kubectl get all"
alias kgp="kubectl get pods"
alias kl="kubectl logs --tail=100"
alias km="kustomize"
alias kr="kubectl rollout"
alias krr="kubectl rollout restart"
alias krs="kubectl rollout status"
kpo() { kg po | grep $1 | head -n1 | cut -d" " -f1; }
kpm() { kex `kpo $1` pipenv run python manage.py shell; }

# --- --- --- #

# set path
export PATH=/c/codeenv/git/usr/bin:~/.virtualenvs/py35/Scripts:~/.lki/scripts:${PATH} LANG=en EDITOR=vim

# my aliases
alias gsh='ssh -t gate ssh -t'
alias gash='ssh -t agate ssh -l zaihui -t'
alias gush='ssh -t gate ssh -l ubuntu -t'
alias ush='ssh -t ga ssh -l ubuntu -t'
alias ish='ssh -t igate ssh -t'
alias stt='kcu stt && kex `kg po | grep celery-worker | head -n1 | cut -d" " -f1` pipenv run python manage.py shell'
alias stp='kcu stp && kex `kg po | grep celery-worker | head -n1 | cut -d" " -f1` pipenv run python manage.py shell'
alias gethost='ssh gate gethost'

fsh() {
  IMAGE=${1}
  ssh -t gate ssh -l zaihui -t f1 docker exec -e ENV_TEST=1 -it ${IMAGE:="forseti_uwsgi"} pipenv run python manage.py shell
}

alias sv="cd /c/code/aria2"
alias svf="cd /c/code/aria2/stdev-forseti-be"
alias svl="cd /c/code/github/LKI-lki.github.io"

