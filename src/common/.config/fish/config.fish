if status is-interactive
  # Commands to run in interactive sessions can go here
  eval (/opt/homebrew/bin/brew shellenv)
  source (anyenv init -|psub)
  rbenv init - fish | source
end
