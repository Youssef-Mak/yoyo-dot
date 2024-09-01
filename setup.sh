brew update
brew upgrade


brew install node
brew install tmux
brew install fd
brew install font-hack-nerd-font

git clone https://github.com/jeffreytse/zsh-vi-mode \
  $ZSH_CUSTOM/plugins/zsh-vi-mode

cp ./nonvimstuff/alacritty.toml ~/.config
cp ./nonvimstuff/.zshrc ~/
cp ./nonvimstuff/.tmux.conf ~/


