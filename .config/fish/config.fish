eval "$(/opt/homebrew/bin/brew shellenv)"
alias colorscript="~/TerminalApplications/shell-color-scripts/colorscript.sh"
alias randomColorscript="colorscript random"

alias fishedit='vim ~/.config/fish/config.fish' # edit fish config
alias shtop='sudo htop' # run `htop` with root rights
alias clear="clear && randomColorscript"
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
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias stash='git stash'
alias commit='git commit -m'
alias amend='git commit --amend'
alias fetch='git fetch'
alias merge='git merge'
alias pull='git pull origin'
alias push='git push origin'
alias force-push='git push --force'
alias state='git status'
alias tag='git tag'
alias newtag='git tag -a'
alias lg='git lg'
alias refresh='git reset --hard && git clean -f -d'

function emacs --wraps emacs --description 'alias emacs=nohup emacs > /dev/null 2>&1&'
    nohup emacs > /dev/null 2>&1&
end

function notification --argument-names title notification
  set notif 'display notification "'$notification'" with title "'$title'"'
  osascript -e $notif;
end

## Design aliasses
alias design='cd ~/Documents/Design/ && clear'
alias personal-design='cd ~/Documents/Design/Personal/ && clear'

## Adobe Suite
alias psd='open -a /Applications/Adobe\ Photoshop\ 2020/Adobe\ Photoshop\ 2020.app'
alias ai='open -a /Applications/Adobe\ Illustrator\ 2020/Adobe\ Illustrator.app'
alias xd='open -a /Applications/Adobe\ XD/Adobe\ XD.app'
alias ind='open -a /Applications/Adobe\ InDesign\ 2020/Adobe\ InDesign\ 2020.app'

## Regular programs
alias safari='open -a safari'

## Kittens
alias img='kitty +kitten icat'

## Sligro Alliasses
function goToAEMProvisioning
  pushd /Users/$USER/Code/Acolad/Sligro/aem-provisioning
  eval $argv
  popd
end

function vm-status
 goToAEMProvisioning ./vm/scripts/vm-status.sh 
end
function vm-prepare
  goToAEMProvisioning ./vm/scripts/vm-prepare.sh $argv
end
function vm-launch
  goToAEMProvisioning ./vm/scripts/vm-launch.sh $argv
end
function vm-ssh
  goToAEMProvisioning ./vm/scripts/vm-ssh.sh $argv
end
function vm-provision
  goToAEMProvisioning ./vm/scripts/vm-provision.sh $argv
end
function vm-shutdown
  goToAEMProvisioning ./vm/scripts/vm-shutdown.sh $argv
end
function vm-destroy
  goToAEMProvisioning ./vm/scripts/vm-destroy.sh $argv
end

set -g -x fish_greeting ''
set --export --prepend PATH "/usr/local/bin"

fish_vi_key_bindings

randomColorscript

[ -f $(brew --prefix)/share/autojump/autojump.fish ]; and source $(brew --prefix)/share/autojump/autojump.fish

starship init fish | source

set --export --prepend PATH "/Users/nicovandenhove/.composer/vendor/bin"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/nicovandenhove/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
