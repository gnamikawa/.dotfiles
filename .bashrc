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

function resource {
	source "$HOME/.bashrc"
}
