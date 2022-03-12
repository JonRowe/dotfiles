alias cls='printf "\033c"'

export ITB="/Users/jon/Library/Application\ Support/IntoTheBreach/profile_Omega"
alias backupITB="pushd $ITB > /dev/null; cp *.lua bak/; popd > /dev/null"
alias restoreITB="pushd $ITB > /dev/null; cp bak/* .; popd;"

export FTL="/Users/jon/Library/Application\ Support/fasterthanlight/"
alias backupFTL="pushd $FTL > /dev/null; cp *.sav bak; popd > /dev/null"
alias restoreFTL="pushd $FTL > /dev/null; cp bak/* .; popd;"

#cmdline stuff
alias pretty_json='python -m json.tool'
pman () {
  man -t "${1}" | open -f -a /Applications/Preview.app
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
alias clear="cat /dev/null >"
alias less='less -r'

# postgres
PSQL=`which psql`
auto_psql () {
  if [ -e "./config/database.yml" ] && [ $# -eq 0 ]
  then
    DB=`ruby -ryaml -e "puts YAML.load_file('./config/database.yml')[ENV.fetch('RACK_ENV','development')]['database']"`
    $PSQL $DB $@
  elif [ -e '.database' ]
  then
    $PSQL `cat .database` $@
  else
    $PSQL $@
  fi
}
alias pg_ctl="/Users/jon/.asdf/installs/postgres/13.5/bin/pg_ctl -D /Users/jon/.asdf/installs/postgres/13.5/data -l  /Users/jon/.asdf/installs/postgres/13.5/logs/logfile $@"

start_redis () {
  redis_version="$(ls ~/.asdf/installs/redis | sort | tail -n 1)"
  ~/.asdf/installs/redis/$redis_version/bin/redis-server ~/.asdf/installs/redis/$redis_version/redis.conf
}

# ruby tools
alias bundle="bundler"
alias cuke="bundler exec cucumber"
alias bling="CUCUMBER_FORMAT='pretty' bundler exec cucumber"
alias be="bundler exec"
alias rails="bundler exec rails"
alias rr='git ls-files -mo --exclude-standard | exists | grep _spec\.rb$ | xargs bundle exec rspec'
alias ro='bundler exec rspec --only-failures'
alias rn='bundler exec rspec --next-failure'
alias rc='rvm-prompt v p g'

# elixir tools
alias ism="iex -S mix"
alias ismp="iex -S mix phx.start"
alias mta="mix cmd mix test"
alias mtr='git ls-files -mo --exclude-standard | exists | grep _test\.exs$ | xargs mix test '
alias mto="mix test --failed"
alias mg="mix deps.get"
alias mdg="mix deps.get"
alias mdu="mix deps.update"
alias mf="mix format"
alias mfa="git ls-files -mo --exclude-standard | exists | grep '\.exs\?$' | xargs mix format"
alias mfc="git diff --cached --name-only | exists | grep '\.exs\?$' | xargs mix format"
export ERL_AFLAGS="-kernel shell_history enabled"
export KERL_BUILD_DOCS="yes"
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
  elif [ "${1}" = "all" ]
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

export EDITOR='vim -v'
export PATH=./bin:~/.dotfiles/bin/:/usr/local/bin:/usr/local/sbin:$PATH

alias ta='tmux attach -t'
alias tls='tmux ls'
alias tn='tmux new -s'
alias ts='tmuxinator start'
alias to='tmuxinator open'
alias rc='rvm current'

alias brb='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine'

alias kill_nord="sudo kill -9 \$(ps aux | grep '^root.*nord' | sed -E 's/root[^0-9]*([0-9]+).*/\1/')"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# RSpec
export USE_GIT_REPOS=1

# Homebrew
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK="skip"

#tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
