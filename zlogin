
# Makes color constants available
autoload -U colors
colors

# Enable colored output from ls, etc
export CLICOLOR=1

# Expand functions in the prompt
setopt prompt_subst

# Init rbenv
eval "$(rbenv init - --no-rehash)"