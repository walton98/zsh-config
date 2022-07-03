packages=(
  "https://github.com/zsh-users/zsh-syntax-highlighting.git"
  "https://github.com/zsh-users/zsh-autosuggestions.git"
)

pull_packages() {
  for package_repo in ${packages[@]}; do
    package_name=$(basename $package_repo .git)
    directory="$ZSH_PLUGIN_DIR/$package_name"
    if [[ ! -e $directory ]]; then
      print -P "%F{red}$package_name not found, pulling new version.%f"
      git clone $package_repo $directory
    fi
  done
}

source_packages() {
  kubectl_completion
  source $ZSH_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh
  # must be loaded last, also needs include guard, see
  # https://github.com/zsh-users/zsh-syntax-highlighting/issues/625
  if ! type _zsh_highlight > /dev/null 2>&1; then
    source $ZSH_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  fi
}

reinstall_packages() {
  rm -rf $ZSH_PLUGIN_DIR && exec zsh
}
