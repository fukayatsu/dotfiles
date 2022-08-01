fish_add_path $HOME/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.ep/bin

if type -q direnv
  direnv hook fish | source
end

if status is-interactive
  # Commands to run in interactive sessions can go here
  alias be='bundle exec'
  alias da='direnv allow'

  # mkdir -p しつつ cd
  function mkcd
    if ! test (count $argv) -eq 1
      echo 'Pass only 1 arg'
      return 1
    end

    mkdir -p $argv[1]
    eval 'cd' $argv[1]
  end

  # mkdir -p しつつ touch
  function dtouch
    for arg in $argv
      echo (dirname $arg)
      mkdir -p (dirname $arg)
      touch $arg
    end
  end

  if type -q /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
  end

  # https://asdf-vm.com/guide/getting-started.html
  if type -q ~/.asdf/bin/asdf
    source ~/.asdf/asdf.fish
    mkdir -p ~/.config/fish/completions; and ln -sf ~/.asdf/completions/asdf.fish ~/.config/fish/completions
  end

  if type -q thefuck
    thefuck --alias | source
  end
end
