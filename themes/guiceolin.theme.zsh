#
# A theme based on Steve Losh's Extravagant Prompt with vcs_info integration.
#
# Authors:
#   Steve Losh <steve@stevelosh.com>
#   Bart Trojanowski <bart@jukie.net>
#   Brian Carper <brian@carper.ca>
#   steeef <steeef@gmail.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
# Screenshots:
#   http://i.imgur.com/HyRvv.png
#

autoload -Uz vcs_info
autoload -U add-zsh-hook

function theme_precmd() {

  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    branch_format="(%F{81}%b%f %u%c%F{161}?%f)"
  else
    branch_format="(%F{81}%b%f %u%c)"
  fi

  zstyle ':vcs_info:*:prompt:*' formats "${branch_format}"

  vcs_info 'prompt'
}

add-zsh-hook precmd theme_precmd

local action_format="(%F{yellow}%a%f)"
local unstaged_format="%F{166}~%f"
local staged_format="%F{118}+%f"

# Set vcs_info parameters.
zstyle ':vcs_info:*' enable bzr git hg svn
zstyle ':vcs_info:*:prompt:*' check-for-changes true
zstyle ':vcs_info:*:prompt:*' unstagedstr "${unstaged_format}"
zstyle ':vcs_info:*:prompt:*' stagedstr "${staged_format}"
zstyle ':vcs_info:*:prompt:*' actionformats "${branch_format}${action_format}"
zstyle ':vcs_info:*:prompt:*' nvcsformats   ""
setopt prompt_subst

PROMPT=""'%F{135}%n%f at %F{166}%m%f in %F{118}%~%f ${vcs_info_msg_0_}%F{022}
%F{015}$ '""
