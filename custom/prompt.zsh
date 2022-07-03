autoload -U add-zsh-hook
autoload -Uz vcs_info  # TODO: figure out Uz vs U

setopt promptsubst

PROMPT_PATH_MAX_LENGTH=30
PROMPT_DEFAULT_END=❯
PROMPT_SUCCESS_COLOR='%F{70}'
PROMPT_FAILURE_COLOR='%F{1}'
PROMPT_VCS_INFO_COLOR='%F{241}'

# Add hook for calling vcs_info before each command.
add-zsh-hook precmd vcs_info

# Set vcs_info parameters.
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*:*' nvcsformats "%~" ""  # non-vcs
zstyle ':vcs_info:*:*' formats "%S" "%r/%s/%b %u%c"  # normal vcs
zstyle ':vcs_info:*:*' actionformats "%S" "%r/%s/%b %u%c (%a)"  # vcs action e.g. rebase

# See `Expansion of Prompt Sequences` in `man zshmisc`
PROMPT="%(0?.$PROMPT_SUCCESS_COLOR.$PROMPT_FAILURE_COLOR)\
${SSH_TTY:+[%n@%m]}%b%$PROMPT_PATH_MAX_LENGTH<..<"\
'${vcs_info_msg_0_%%.}'"$PROMPT_DEFAULT_END"'%b%f '
RPROMPT="$PROMPT_VCS_INFO_COLOR"'$vcs_info_msg_1_%f'
