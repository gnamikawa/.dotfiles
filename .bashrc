declare -A editables
editables=(
	["bashrc"]="$HOME/.bashrc"
	["configs"]="$HOME/.config"
	["nvim"]="$HOME/.config/nvim"
	["nixos"]="$HOME/repositories/system-nix"
	["dotfiles"]="$HOME/repositories/.dotfiles"
)

# Define convinience functions for configuration scripts and directories
for key in "${!editables[@]}"; do
	value=${editables[$key]}
	if [[ -d $value ]]; then
		eval "function edit$key() { cd $value; $EDITOR .; }"
	elif [[ -f $value ]]; then
		eval "function edit$key() { nvim $value; }"
	else
		echo "$key's value is not valid: $value. Skipping."
	fi
done

alias resource='source "$HOME/.bashrc"'
if [[ -d $HOME/repositories/ ]]; then
	alias editrepository='find $HOME/repositories/ -mindepth 1 -maxdepth 1 -type d -print | fzf | xargs -I{} nvim {}'
fi
if nixos-version 1>/dev/null 2>/dev/null; then
	alias rebuildos='sudo nixos-rebuild switch --flake $HOME/repositories/system-nix/'
fi

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
