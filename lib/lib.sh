function __current_dir ()
{
  SOURCE="${BASH_SOURCE[0]}"
  while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  printf "${DIR}"
}

function __modules_dir ()
{
  printf $(__current_dir)/../modules_enabled/
}

function __load_modules ()
{
  MODULES=$(__current_dir)/../modules_enabled/**/*_module
  for m in $MODULES
  do
    CURRENT_MODULE="$( dirname $m )"
    source $m
  done
}
function __load_modules_path ()
{
  PATHS=$(__current_dir)/../modules_enabled/**/PATH
  for m in $PATHS
  do
    CURRENT_MODULE="$( dirname $m )"
    source $m > /dev/null 2>&1
  done
}
