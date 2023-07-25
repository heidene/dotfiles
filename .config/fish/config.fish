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

function start-dev-env
  pushd /Users/nicovandenhove/Code/Acolad/Sligro/dev
  docker-compose up -d
  popd
end

function stop-dev-env
  if test (docker ps | grep -c aem-sligro) > 0
    pushd /Users/nicovandenhove/Code/Acolad/Sligro/dev
    docker-compose down
    popd
  end
end

function sligro-dev-env
  if test (docker ps | grep -c aem-sligro) = 0
    start-dev-env
  end
  docker exec -it aem-sligro zsh
end

function start-api-services
  docker exec -t aem-sligro zsh -c "cd api-services && ./runall.sh"
end

function start-bff
  docker exec -t aem-sligro zsh -c "cd webshop-bff && ./runall.sh"
end

function sligro-dev
  cd /Users/nicovandenhove/Code/Acolad/Sligro ;; volta install node@16 ;; sdk u java 8.0.352-librca ;; sdk u maven 3.8.7
end

function merge-env
  ~/TerminalApplications/merge-env.sh $argv
end

function merge-env-in-folder
  eval $argv[2..-1]
  merge-env .env.base .env.$argv[1]
end

function set-environment
  set -l environment (string lower $argv[1])
  merge-env-in-folder $environment (cd assortmentmodule)
  merge-env-in-folder $environment (cd ../cart)
  
# merge-env-in-folder $environment (cd ../contentsearch)
  merge-env-in-folder $environment (cd ../list)
  merge-env-in-folder $environment (cd ../order)
  merge-env-in-folder $environment (cd ../product)
  merge-env-in-folder $environment (cd ../productoverview)
  merge-env-in-folder $environment (cd ../user)
end

function swap-api-env
  pushd /Users/nicovandenhove/Code/Acolad/Sligro/api-services/packages
  switch $argv[1]
    case tst
      set-environment $argv[1]
    case acc
      set-environment $argv[1]
    case prd
      set-environment $argv[1]
    case local
      set-environment $argv[1]
    case '*'
      echo No shuch environment as: $argv[1]
  end
  popd
end

set -g -x fish_greeting ''
set --export --prepend PATH "/usr/local/bin"

fish_vi_key_bindings

randomColorscript

[ -f $(brew --prefix)/share/autojump/autojump.fish ]; and source $(brew --prefix)/share/autojump/autojump.fish

starship init fish | source

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/nicovandenhove/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
