function __current_dir ()
{
  SOURCE="${BASH_SOURCE[0]}"
  while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  printf "${DIR}"
}

function __modules_dir ()
{
  printf $(__current_dir)/modules/
}

function __load_modules ()
{
  MODULES=$(__current_dir)/modules/**/*_module
  for m in $MODULES
  do
    CURRENT_MODULE="$( dirname $m )"
    source $m
  done
}
function __load_modules_path ()
{
  PATHS=$(__current_dir)/modules/**/PATH
  for m in $PATHS
  do
    CURRENT_MODULE="$( dirname $m )"
    source $m
  done
}
function __load_modules_ps1 ()
{
  _PS1=$(__current_dir)/modules/**/PS1
  for m in $_PS1
  do
    CURRENT_MODULE="$( dirname $m )"
    source $m
  done
}
