# This is comments for the file
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

alias la='ls -la'
alias pr='cd -' # returns to the previous working directory
alias "...=cd ../.."
alias "....=cd ../../.."
alias ".....=cd ../../../.."
alias "......=cd ../../../../.."

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# usefull alias for git commands
# info
alias gil='git log --decorate --oneline'
alias gdif='git dif'
alias gs='git status'
# branch info
alias gba='git branch -a'
alias gbl='git branch -l'
alias gbr='git branch -r'
alias gbm='git branch --merged'
alias gbnm='git branch --no-merged'
# remote operations
alias gif='git fetch'
alias gpr='git pull --rebase origin pos_develop'
alias grp='git rp'
# rebase
alias grbi='git rbi'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbs='git rebase --skip'
# reset
alias gci='git clean -dfx' # remove whole ignored files and untracked
alias gcu='git clean -df' # remove whole untracked files
alias grh='git reset --hard HEAD'
alias grs='git reset --soft HEAD'
# stash
alias gst='git stash'
alias gust='git stash pop'

# some aliases for npm
alias ncc='npm cache clean'
alias nci='np && ncc && ni'
alias ni='npm install'
alias nl='npm list --depth=${1:-0}'
alias np='npm prune'
alias nr='npm run'
alias ns='npm start'
alias nsbr='npm start -- --log --mock'
alias nt='npm test'
alias nv='npm run validate'
alias nvf='npm run lintfix'
alias nvd='npm version'
# alias nt='node ./run_tests.js'
alias nta='karma start --single-run'

alias "c=clip"
alias "v=clip -o"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/c/Users/Igor_Mykhaylyuk/.sdkman"
[[ -s "/c/Users/Igor_Mykhaylyuk/.sdkman/bin/sdkman-init.sh" ]] && source "/c/Users/Igor_Mykhaylyuk/.sdkman/bin/sdkman-init.sh"
