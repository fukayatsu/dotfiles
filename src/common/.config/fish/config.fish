if type -q direnv
  direnv hook fish | source
end

if status is-interactive
  # Commands to run in interactive sessions can go here

  if type -q /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
  end

  if type -q anyenv
    source (anyenv init -|psub)
  end

  if type -q rbenv
    rbenv init - fish | source
  end
end
