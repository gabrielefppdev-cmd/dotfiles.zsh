# Installs this config's dependencies if they're missing. Safe to run any number of times.
export ZSH="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/oh-my-zsh"

() {
  # target directory, then repository (order matters: oh-my-zsh first)
  local -a deps=(
    "$ZSH"                                       https://github.com/ohmyzsh/ohmyzsh
    "$ZSH/custom/plugins/zsh-autosuggestions"    https://github.com/zsh-users/zsh-autosuggestions
    "$ZSH/custom/plugins/zsh-syntax-highlighting" https://github.com/zsh-users/zsh-syntax-highlighting
    "$ZSH/custom/themes/powerlevel10k"           https://github.com/romkatv/powerlevel10k
  )
  local dir url
  for dir url in $deps; do
    [[ -d $dir ]] || git clone --quiet --depth=1 "$url" "$dir"
  done
}
