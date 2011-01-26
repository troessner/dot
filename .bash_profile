function prompt {
  local GRAY="\[\033[1;30m\]"
  local LIGHT_GRAY="\[\033[0;37m\]"
  local CYAN="\[\033[0;36m\]"
  local LIGHT_CYAN="\[\033[1;36m\]"
  local NO_COLOUR="\[\033[0m\]"
  local BLUE="\[\033[0;34m\]"
  local LIGHT_BLUE="\[\033[1;34m\]"
  local RED="\[\033[0;31m\]"
  local LIGHT_RED="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local PURPLE="\[\033[0;35m\]"
  local LIGHT_PURPLE="\[\033[1;35m\]"
  local BROWN="\[\033[0;33m\]"
  local YELLOW="\[\033[1;33m\]"
  local BLACK="\[\033[0;30m\]"
  local WHITE="\[\033[1;37m\]"
  local RED="\[\033[31;31m\]"

  PS1="$LIGHT_GRAY{-$RED\u$LIGHT_GRAY-|-$GREEN\h$LIGHT_GRAY-} => [$LIGHT_BLUE\w$LIGHT_GRAY]
  $LIGHT_BLUE( $ ) $GREEN"
}
prompt

export GEM_PATH=/var/lib/gems/1.8/bin/
export PATH=$GEM_PATH:$PATH
export PATH=/usr/local/sphinx/bin:$PATH
export JDK_HOME=/usr/lib/jvm/java-6-sun
export JAVA_HOME=/usr/lib/jvm/java-6-sun
export GRAILS_HOME=/opt/grails-1.3.4/
export PATH=$PATH:$GRAILS_HOME/bin

export EDITOR=vi

source ~/.alias

HISTSIZE=3000

ssh-add ~/.ssh/private_github/private_github
ssh-add ~/.ssh/source_repo/source_repo

cd /var/www/
