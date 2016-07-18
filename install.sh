#!/bin/sh

# Fail fast
set -o nounset
set -o errexit
set -o pipefail

###
# Usage
###
usage() {

  cat <<HELP
  usage:
  install [ --verbose ]

  optional parameters:
  --verbose    print some progress output to stdout
HELP
}

###
# Read parameters from command line
# and set variables
###
_read_parameters() {

  while ((${#})) ; do
    case "${1}" in
      --verbose)
        VERBOSE=1
        ;;
      --help)
        usage
        exit 0
        ;;

      *)
        echo "Unkown parameter '${1}'"
        exit 1
        ;;
    esac
  done
}

###
# Helper functions
###

#### Simple log if verbose
log() {
  if [[ $VERBOSE -eq 1 ]]; then
    echo "$@"
  fi
}

#### Simple link function, with backup if file exists
_link_file() {
  local src="${1}"
  local dest="${2}"
  local timestamp=$(date +%s)

  log "teste"
  # Check file exists, and do a backup if exists
  if [ -e "${dest}" ] || [ -L "${dest}" ]
  then
    log "${dest} exists, moving to ${dest}.backup.${timestamp}"
    mv "${dest}" "${dest}.backup.${timestamp}"
  fi

  ln -s "${src}" "${dest}"
}

#### Link files from $(pwd) to ~/
_link_dotfile() {
  local src="$(PWD)/${1}"
  local dest="~/${2}"
  _link_file src dest
}

###
# link all file to ~/
###
_link_files() {
  for file in ".gitignore" ".gitconfig"; do
    _link_dotfile "git/${file}" "${file}"
  done

  # Ruby
  _link_dotfile "ruby/.gemrc" ".gemrc"

  # Tmux
  _link_dotfile "tmux/.tmux.conf" ".tmux.conf"

  # iTerm
  _link_dotfile "iterm/com.googlecode.iterm2.plist" "com.googlecode.iterm2.plist"
}

###
# Main function
###
_main() {
  VERBOSE=0
  echo "teste"

  if [[ "${1:-}" =~ ^-h|--help$  ]]
  then
    usage
  else
    _read_parameters
    _link_files
  fi
}

###
# Call Main function
###
_main "${@:-}"
