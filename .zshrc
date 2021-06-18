# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# https://github.com/romkatv/powerlevel10k#manual
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -f /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme ]]; then
    # homebrew installs
    source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
else
    # for home-directory only (coder)
    source ~/powerlevel10k/powerlevel10k.zsh-theme
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Let pyenv manage python; https://opensource.com/article/19/5/python-3-default-mac
if command -v pyenv 1>/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# Let jenv manage Java: https://jenv.be
#    jenv add <path to jdk> (e.g. /Library/Java/JavaVirtualMachines/zulu-16.jdk/Contents/Home/)
#    jenv versions <-- what have added
#    jenv global <version> <--
#    jenv local <version> <-- (per directory)
#    jenv shell <version> <-- (per directory)
if command -v jenv 1>/dev/null 2>&1; then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi

# Setup fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# https://www.atlassian.com/git/tutorials/dotfiles; use config <regular git command> for dotfiles repo
# https://news.ycombinator.com/item?id=11071754
#   make sure alias below is set and .gitignore includes .cfg (or whatever folder will hold this)
#   then: git clone --bare <git-repo-url> $HOME/.cfg;
#         run config checkout (replacing/merging any conflicting files)
#         config config --local status.showUntrackedFiles no
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
