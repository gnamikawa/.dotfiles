# Define convinience functions for configuration scripts and directories
declare -A arr
arr=(
	["bashrc"]="$HOME/.bashrc"
	["configs"]="$HOME/.config"
	["nvim"]="$HOME/.config/nvim"
	["nixos"]="$HOME/repositories/system-nix"
	["dotfiles"]="$HOME/repositories/.dotfiles"
)
for key in "${!arr[@]}"; do
	value=${arr[$key]}
	if [[ -d $value ]]; then
		eval "function edit$key() { cd $value; nvim .; }"
	elif [[ -f $value ]]; then
		eval "function edit$key() { nvim $value; }"
	else
		echo "$key's value is not valid: $value. Skipping."
	fi
done

function resource {
	source "$HOME/.bashrc"
}
