# cd
alias ..='cd ..'
alias ...='.. && ..'
alias ....='... && ..'

# ls
alias ls="ls -Fa"
alias l="ls -lAh"
alias ll="ls -l"
alias la='ls -A'

# git
alias g='git'
alias gs='git status'
alias gl='git log'
alias gup='git fetch && git rebase'
alias gp='git push'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdv='git diff -w "$@" | vim -R -'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gcp='git cherry-pick'

# so rake doesn't choke on zsh square brackets
alias rake='noglob rake'

# bundler
alias bx='bundle exec'

# Development nav shortcuts
alias ws='cd ~/Workspace'
alias dotfiles='ws && cd dotfiles'
alias tm='ws && cd tome'
alias sio='ws && cd species-io'
alias xs='ws && cd xenoseed'
alias aq='ws && cd aquarium-community'
