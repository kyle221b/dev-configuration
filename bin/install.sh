nvim_dir=$HOME/.config/nvim
zprezto_dir=$HOME/.zprezto/runcoms
karabiner_dir=$HOME/.config/karabiner

function ensure_correct_directory {
	dir_contents=$(ls -a)
	has_vim_dir=$(echo $dir_contents | grep vim)
	has_karabiner_dir=$(echo $dir_contents | grep karabiner)
	if [[ -z $has_vim_dir || -z $has_karabiner_dir ]]
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

if [[ -d $zprezto_dir ]] 
then
	echo "Running zprezto setup..."
	rm -f $zprezto_dir/zpreztorc
	ln -s $cur_dir/zsh/zpreztorc $zprezto_dir/zpreztorc
else
	echo "Skipping zprezto config installation. No zprezto directory found at '$zprezto_dir'..."
fi

echo "Running karabiner setup..."
rm -rf $karabiner_dir
ln -s $cur_dir/karabiner $HOME/.config
