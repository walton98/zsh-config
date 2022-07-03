ZSH_CUSTOM_DIR="$HOME/.zsh/custom"
ZSH_PLUGIN_DIR="$HOME/.zsh/plugins"

extras=(
  ls  # pre-requisite for completion
  completion
  git
  kubectl
  package-manager
  prompt
  neovim
  smk
)
# TODO: ripgrep (auto-installed on Mac)

for extra in ${extras[@]}; do
  source $ZSH_CUSTOM_DIR/${extra}.zsh
done


pull_packages
source_packages
