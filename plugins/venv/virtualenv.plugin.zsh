#virtualenvswitcher:current_dir_has_virtualenv_folder(){
#    echo "$(pwd)" | grep "$(dirname "$VIRTUAL_ENV")" > /dev/null 2>&1
#}
#virtualenvswitcher:source() {
#    local DOTPYVENV_DIR=".venv"
#
#    if [ -n "$VIRTUAL_ENV"  ]; then
#        virtualenvswitcher:current_dir_has_virtualenv_folder || deactivate
#    elif [ -f "${DOTPYVENV_DIR}/bin/activate" ]; then
#        source "${DOTPYVENV_DIR}/bin/activate"
#    fi
#}
#
#
#autoload -U add-zsh-hook
#add-zsh-hook chpwd virtualenvswitcher:source
