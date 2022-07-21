if type -q direnv
  direnv hook fish | source
end

if status is-interactive
  # Commands to run in interactive sessions can go here

  if type -q /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
  end

  # https://asdf-vm.com/guide/getting-started.html
  if type -q ~/.asdf/bin/asdf
    source ~/.asdf/asdf.fish
    mkdir -p ~/.config/fish/completions; and ln -sf ~/.asdf/completions/asdf.fish ~/.config/fish/completions
  end

  if type -q anyenv
    source (anyenv init -|psub)
  end

  if type -q rbenv
    rbenv init - fish | source
  end
end
