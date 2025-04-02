export REPODIR="$HOME/repositories/"

if [[ ! -d "$REPODIR" ]]; then
	mkdir "$REPODIR"
fi

declare -A editables
editables=(
	["bashrc"]="$HOME/.bashrc"
	["nixos"]="$HOME/repositories/system-nix"
	["dotfiles"]="$HOME/repositories/.dotfiles"
)

# Define convinience functions for configuration scripts and directories
for key in "${!editables[@]}"; do
	value=${editables[$key]}
	if [[ -d $value ]]; then
		eval "function edit$key() { $EDITOR .; }"
	elif [[ -f $value ]]; then
		eval "function edit$key() { $EDITOR $value; }"
	else
		echo "$key's value is not valid: $value. Skipping."
	fi
done

alias resource='source "$HOME/.bashrc"'

if [[ -d $HOME/repositories/ ]]; then
	alias editrepository='find $HOME/repositories/ -mindepth 1 -maxdepth 1 -type d -print | fzf | xargs -I{} nvim {}'
fi

if [[ -d $HOME/.config/ ]]; then
	alias editconfig='find $HOME/.config/ -mindepth 1 -maxdepth 1 -type d,l -print | fzf | xargs -I{} nvim {}'
fi

if nixos-version 1>/dev/null 2>/dev/null; then
	alias rebuildos='sudo nixos-rebuild switch --flake $HOME/repositories/system-nix/'
fi

function mkrepo {
	if [[ -z $1 ]]; then
		echo "Usage: mkrepo \$1"
		return 1
	fi

	REPOPATH="$(realpath "$REPODIR/$1")"

	if mkdir "$REPOPATH"; then
		cd "$REPOPATH" || exit 1
		git init
		touch "README.md"
		echo "$1" >>"README.md"
		git add .
		git commit -m "Initial Commit"
		cd - || exit 1
	else
		echo "Project already exists refusing to create project."
	fi
}

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
