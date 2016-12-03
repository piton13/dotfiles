# This is comments for the file
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

alias la='ls -la'
alias pr='cd -' # returns to the previous working directory
alias "...=cd ../.."
alias "....=cd ../../.."
alias ".....=cd ../../../.."
alias "......=cd ../../../../.."

alias gba='git branch -a'
alias gbr='git branch -r'
alias gbl='git branch -l'
alias gbnm='git branch --no-merged'
alias gbm='git branch --merged'
alias gdif='git dif'
alias gs='git status'
alias gco='git co $1'
alias gif='git fetch'
alias gil='git log --decorate --oneline'
alias gst='git stash'
alias gust='git stash pop'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbs='git rebase --skip'
alias grh='git reset --hard HEAD'
alias grs='git reset --soft HEAD'
alias gcu='git clean -fd'
alias gci='git clean -fdx'
alias gpr='git pull --rebase origin pos_develop'
alias grp='git rp'
alias bp='bower prune'
alias bi='bower install'

# some aliases for npm
alias ncc='npm cache clean'
alias ni='npm install'
alias np='npm prune'
alias nr='npm run'
alias ns='npm start'
# alias nt='node ./run_tests.js'
alias nt='npm test'
alias nta='karma start --single-run'

alias "c=clip"
alias "v=clip -o"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/c/Users/Igor_Mykhaylyuk/.sdkman"
[[ -s "/c/Users/Igor_Mykhaylyuk/.sdkman/bin/sdkman-init.sh" ]] && source "/c/Users/Igor_Mykhaylyuk/.sdkman/bin/sdkman-init.sh"
