autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' use-simple true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' enable git

precmd () {
  if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
    zstyle ':vcs_info:*' formats "  %b%c%u"
  } else {
    zstyle ':vcs_info:*' formats "  %b%F{green}%c%F{red}%u%F{yellow}?"
  }
  vcs_info
}

function ruby_version_info() {
  local ver=$(rbenv version-name)
  echo "[$ver]"
}

setopt prompt_subst
PROMPT='%F{248}%n@%m:%f %~%F{cyan}${vcs_info_msg_0_}%f '
RPROMPT='%F{160}$(ruby_version_info)%f | %F{248}%t%f'
