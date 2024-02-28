eval "$(/opt/homebrew/bin/brew shellenv)"

alias fishedit='vim ~/.config/fish/config.fish' # edit fish config
alias shtop='sudo htop' # run `htop` with root rights
alias clear="clear && banner"
alias grep='grep --color=auto' # colorize `grep` output
alias less='less -R'
alias g='git'
alias pr="~/bin/pr-maker"
alias project-setup="~/TerminalApplications/ProjectCreator"
alias config="cd ~/.config && clear && ls"
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias dotfilesNoTrack='dotfiles config --local status.showUntrackedFiles no'

alias weather-full='curl wttr.in' # print weather for current location (https://github.com/chubin/wttr.in)
alias weather="curl 'nl.wttr.in?format=4'"

alias viewLF='find . -flags uchg'
alias unlockFiles='find . -flags uchg -exec chflags nouchg {} \;'

alias prcs='top -F -R -o cpu'

alias printTime='date +"%T"'

alias vim="nvim"

alias ls='lsd -1'

alias ll='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias lt='lsd --tree'

# confirm before overwriting something
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

## Design aliasses
alias design='cd ~/Documents/Design/ && clear'
alias personal-design='cd ~/Documents/Design/Personal/ && clear'

set -g -x fish_greeting ''
set --export --prepend PATH "/usr/local/bin"

fish_vi_key_bindings

banner

[ -f $(brew --prefix)/share/autojump/autojump.fish ]; and source $(brew --prefix)/share/autojump/autojump.fish

starship init fish | source

set --export --prepend PATH "/Users/nicovandenhove/.composer/vendor/bin"

zoxide init fish --cmd cd | source
