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
alias dotfiles='/usr/bin/git --git-dir=$HOME --work-tree=$HOME'
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

## Project aliasses

alias repos='cd ~/Documents/Repositories/ && clear && ls'
alias eagenda='cd ~/Documents/Repositories/eagenda/e-agenda-frontend/ && clear'
alias ppi='cd ~/Documents/Repositories/PPI/ && clear'
alias fsma='cd ~/Documents/Repositories/FSMA/codebase/fsma && clear'
alias wikifin='cd ~/Documents/Repositories/FSMA/codebase/wikifin && clear'
alias pyur='cd ~/Documents/Repositories/pÿur/backend && nvm use v12 && java8 && clear && alias delete-modules="fd -gHI -t d -d 2 'node_modules' ./frontend -X rm -rf"'
alias mothership='cd ~/Documents/Repositories/Mothership && clear'

## Adobe Suite
alias psd='open -a /Applications/Adobe\ Photoshop\ 2020/Adobe\ Photoshop\ 2020.app'
alias ai='open -a /Applications/Adobe\ Illustrator\ 2020/Adobe\ Illustrator.app'
alias xd='open -a /Applications/Adobe\ XD/Adobe\ XD.app'
alias ind='open -a /Applications/Adobe\ InDesign\ 2020/Adobe\ InDesign\ 2020.app'

## Regular programs
alias safari='open -a safari'
alias idea='open -a "IntelliJ IDEA.app"'


## Kittens
alias img='kitty +kitten icat'

set -x JAVA_8_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_211.jdk/Contents/Home
set -x JAVA_11_HOME /Library/Java/JavaVirtualMachines/jdk-11.0.6.jdk/Contents/Home
set -x JAVA_OPEN11_HOME /Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home
set -x JAVA_15_HOME /Library/Java/JavaVirtualMachines/jdk-15.0.1.jdk/Contents/Home
set -x JAVA_OPENLATEST_HOME /Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home

function java8
  set -g -x JAVA_HOME $JAVA_8_HOME
end

function java11
  set -g -x JAVA_HOME $JAVA_11_HOME
end

function javaOpen11
  set -g -x JAVA_HOME $JAVA_OPEN11_HOME
end

function java15
  set -g -x JAVA_HOME $JAVA_15_HOME
end

function javaOpenLatest
  set -g -x JAVA_HOME $JAVA_OPENLATEST_HOME
end

# default to Java 11
java11

set -g -x fish_greeting ''

fish_vi_key_bindings

randomColorscript

function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

starship init fish | source
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
