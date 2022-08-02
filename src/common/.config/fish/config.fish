if status is-interactive
  fish_add_path $HOME/bin
  fish_add_path $HOME/.local/bin
  fish_add_path $HOME/.ep/bin

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

  if type -q direnv
    direnv hook fish | source
  end

  if type -q thefuck
    # for speed up
    # thefuck --alias | source
    function fuck -d "Correct your previous console command"
      set -l fucked_up_command $history[1]
      env TF_SHELL=fish TF_ALIAS=fuck PYTHONIOENCODING=utf-8 thefuck $fucked_up_command THEFUCK_ARGUMENT_PLACEHOLDER $argv | read -l unfucked_command
      if [ "$unfucked_command" != "" ]
        eval $unfucked_command
        builtin history delete --exact --case-sensitive -- $fucked_up_command
        builtin history merge
      end
    end
  end


  if type -q fzf
    function fzf_git_switch
      git switch (string replace remotes/origin/ '' (git branch -a | fzf | tr -d ' *' ))
    end
    # Use `fish_key_reader`
    bind \u222B 'fzf_git_switch' # alt + b
  end
end
