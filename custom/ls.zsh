LS_PATH='gls'

## Colorize the ls output ##
alias ls="$LS_PATH --color=auto"

## Use a long listing format ##
alias ll="$LS_PATH -la"

## Show hidden files ##
alias l.="$LS_PATH -d .* --color=auto"

export LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:\
pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:\
*.tar=01;31:*.tgz=01;31:*.zip=01;31:*.gz=01;31:*.deb=01;31:\
*.jpg=01;35:*.gif=01;35:*.png=01;35:\
*.md=00;35:*.py=00;33:\
*.yaml=00;36:*.toml=00;36:*.cfg=00;36:*.conf=00;36:\
*Dockerfile=00;38;5;69;146;223"
