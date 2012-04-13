SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

#Git completation on bash terminal
source ~/.git-completion.bash

# Git configuration
source ${DIR}/profile/.git_profile

# PS1 configuration
source ${DIR}/profile/.ps1_profile

# RbEnv configuration
source ${DIR}/profile/.rbenv_profile

#Melhorias para o IRB
export IRBRC="~/.ruby-console/_irbrc"

#Export the path variable.
export PATH=${PATH}

# Export VIM dir
#export VIMRUNTIME="$DIR/dotvim/"
#export VIM="$DIR/dotvim/"
