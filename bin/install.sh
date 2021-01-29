nvim_dir=$HOME/.config/nvim
vscode_dir=$HOME/Library/Application\ Support/Code/User
zsh_dir=$HOME
zprezto_dir=$HOME/.zprezto/runcoms

function ensure_correct_directory {
	dir_contents=$(ls -a)
	has_vim_dir=$(echo $dir_contents | grep vim)
	has_vscode_dir=$(echo $dir_contents | grep vscode)
	has_zsh_dir=$(echo $dir_contents | grep zsh)
	if [[ -z $has_vim_dir || -z $has_vscode_dir || -z $has_zsh_dir ]]
	then
		echo "Must run install script from project root. Exiting."
		exit 1
	fi
}

ensure_correct_directory
cur_dir=$(pwd)

if [[ -d $nvim_dir ]]
then
	echo "Running neovim setup..."
	rm -f $nvim_dir/init.vim
	ln -s $cur_dir/vim/init.vim $nvim_dir/
else
	echo "Skipping neovim config installation. No neovim directory found at '$nvim_dir'..."
fi

if [[ -d $vscode_dir ]] 
then
	echo "Running vscode setup..."
	rm -f $vscode_dir/keybindings.json $vscode_dir/settings.json
	ln -s $cur_dir/vscode/keybindings.json "$vscode_dir/keybindings.json"
	ln -s $cur_dir/vscode/settings.json "$vscode_dir/settings.json"
else
	echo "Skipping VS Code config installation. No VS Code directory found at '$vscode_dir'..."
fi

if [[ -f "$zsh_dir/.zshrc" ]] 
then
	echo "Running zsh setup..."
	rm -f $zsh_dir/.zshrc
	ln -s $cur_dir/zsh/zshrc $zsh_dir/.zshrc
else
	echo "Skipping zsh config installation. No existing .zshrc file found at '$zsh_dir'..."
fi

if [[ -d $zprezto_dir ]] 
then
	echo "Running zprezto setup..."
	rm -f $zprezto_dir/zpreztorc
	ln -s $cur_dir/zsh/zpreztorc $zprezto_dir/zpreztorc
else
	echo "Skipping zprezto config installation. No zprezto directory found at '$zprezto_dir'..."
fi

