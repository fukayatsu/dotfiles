if [ "$(which fish)" = "$(echo $SHELL)" ]; then
  echo "Shell is $SHELL"
else
  sudo sh -c "which fish >> /etc/shells"
  chsh -s $(which fish)
fi
