alias start_mysql="launchctl start homebrew.mxcl.mysql"
alias start_pg="launchctl start homebrew.mxcl.postgresql"
alias start_mongo="launchctl start homebrew.mxcl.mongodb"

alias stop_mysql="launchctl stop homebrew.mxcl.mysql"
alias stop_pg="launchctl stop homebrew.mxcl.postgresql"
alias stop_mongo="launchctl stop homebrew.mxcl.mongodb"
alias cls='printf "\033c"'

export ITB="/Users/jon/Library/Application\ Support/IntoTheBreach/profile_Omega"
alias backupITB="pushd $ITB > /dev/null; cp *.lua bak/; popd > /dev/null"
alias restoreITB="pushd $ITB > /dev/null; cp bak/* .; popd;"

#cmdline stuff
alias pretty_json='python -m json.tool'
pman () {
  man -t "${1}" | open -f -a /Applications/Preview.app
}
tman () {
  MANWIDTH=160 MANPAGER='col -bx' man $@ | mate
}
bman () {
  man "${1}" | bcat
}
exists () {
  while read var
  do
    if [ -f "./$var" ] || [ -f "$var" ]
    then
      echo "$var"
    fi
  done
}
encrypt () {
  openssl aes-256-ecb -salt -in $1 -out $1.enc
}
decrypt () {
  openssl aes-256-ecb -salt -in $1.enc -out $1 -d
}
auto_psql () {
  if [ -e "./config/database.yml" ] && [ $# -eq 0 ]
  then
    DB=`ruby -ryaml -e "puts YAML.load_file('./config/database.yml')[ENV.fetch('RACK_ENV','development')]['database']"`
    /usr/local/bin/psql $DB $@
  elif [ -e '.database' ]
  then
    /usr/local/bin/psql `cat .database` $@
  else
    /usr/local/bin/psql $@
  fi
}
alias psql=auto_psql

#git autocomplete
source ~/.git_complete

#PS1 controls terminal display behaviour, originally \h:\W \u\$
export PS1='\W\[\033[1;36m\]`\__git_ps1`\[\033[0m\]\$ '

alias clear="cat /dev/null >"
alias less='less -r'

# ruby tools
alias cuke="bundle exec cucumber"
alias bling="CUCUMBER_FORMAT='pretty' bundle exec cucumber"
alias be="bundle exec"
alias rails="bundle exec rails"
alias rr='git ls-files -mo --exclude-standard | exists | grep _spec\.rb$ | xargs bundle exec rspec'
alias ro='rspec --only-failures'
alias rn='rspec --next-failure'
alias rc='rvm-prompt v p g'

# elixir tools
alias ism="iex -S mix"
alias ismp="iex -S mix phx.start"
alias mta="mix cmd mix test"
alias mtr='git ls-files -mo --exclude-standard | exists | grep _test\.exs$ | xargs mix test '
alias mdg="mix deps.get"
alias mdu="mix deps.update"
alias mf="mix format"
alias mfa="git ls-files -mo --exclude-standard | exists | grep '\.exs\?$' | xargs mix format"
alias mfc="git diff --cached --name-only | exists | grep '\.exs\?$' | xargs mix format"
export ERL_AFLAGS="-kernel shell_history enabled"
mt() {
  if [ -e .current-app ]
  then
    pushd apps/`cat .current-app`; mix test $@; popd
  else
    mix test $@
  fi
}
mts () {
  if [ -z "${1}" ]
  then
    pushd apps/`cat .current-app`; mix test; popd
  elif [ "${1}" == "all" ]
  then
    rm .current-app
    mix test
  else
    echo "${1}" > .current-app
    pushd apps/${1}; mix test; popd
  fi
}

# git tools
alias gst="git st"

export EDITOR='mvim -v'
export NODE_PATH='/usr/local/lib/node'
export PATH=./bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH

alias vim='mvim -v'
alias ta='tmux attach -t'
alias tls='tmux ls'
alias tn='tmux new -s'
alias ts='tmuxinator start'
alias to='tmuxinator open'
alias rc='rvm current'

alias brb='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine'

export FLEX_HOME=/usr/local/flex/current/

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#rvm
export rvm_path=$HOME/.rvm
[[ -s "$rvm_path/scripts/rvm" ]] && source "$rvm_path/scripts/rvm"

export PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting

#tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
