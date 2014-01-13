alias start_mysql="launchctl start homebrew.mxcl.mysql"
alias start_pg="launchctl start homebrew.mxcl.postgresql"
alias start_mongo="launchctl start homebrew.mxcl.mongodb"

alias stop_mysql="launchctl stop homebrew.mxcl.mysql"
alias stop_pg="launchctl stop homebrew.mxcl.postgresql"
alias stop_mongo="launchctl stop homebrew.mxcl.mongodb"

#cmdline stuff
pman () {
  man -t "${1}" | open -f -a /Applications/Preview.app
}
tman () {
  MANWIDTH=160 MANPAGER='col -bx' man $@ | mate
}
bman () {
  man "${1}" | bcat
}
encrypt () {
  openssl aes-256-ecb -salt -in $1 -out $1.enc
}
decrypt () {
  openssl aes-256-ecb -salt -in $1.enc -out $1 -d
}

#git autocomplete
source ~/.git_complete

#PS1 controls terminal display behaviour, originally \h:\W \u\$
export PS1='\W\[\033[1;36m\]`\__git_ps1`\[\033[0m\]\$ '

alias clear="cat /dev/null >"

#ruby tools
alias cuke="bundle exec cucumber"
alias bling="CUCUMBER_FORMAT='pretty' bundle exec cucumber"
alias be="bundle exec"
alias gst="git st"
alias rails="bundle exec rails"
alias rr='git ls-files -mo --exclude-standard | grep _spec\.rb$ | xargs bundle exec rspec'
alias rc='rvm-prompt v p g'

export EDITOR='mvim -v'
export NODE_PATH='/usr/local/lib/node'
export PATH=./bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH

alias vim='mvim -v'
alias ta='tmux attach -t'
alias tls='tmux ls'
alias tn='tmux new -s'
alias ts='tmuxinator start'
alias to='tmuxinator open'

export FLEX_HOME=/usr/local/flex/current/

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#rvm
export rvm_path=$HOME/.rvm
[[ -s "$rvm_path/scripts/rvm" ]] && source "$rvm_path/scripts/rvm"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
rvm use default

#tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
