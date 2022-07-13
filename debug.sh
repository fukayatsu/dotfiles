docker build -t dotfiles-debug .
docker run --entrypoint=bash --rm -it --mount type=bind,src=$(pwd),dst=/workspaces/dotfiles dotfiles-debug
