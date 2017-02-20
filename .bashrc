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
alias gilm='git log --decorate --oneline --author="Igor Mykhaylyuk" --graph --no-merges'
    # add <branch_name> to see commits of specified branch
    # add -<number> to see last <number> commits
    # use --grep="<text>" to see commits with specified text
    # --stat option displays the number of insertions and deletions to each file
    # gil -- <file_name> to see commits to specified file or files
    # -S"<text>" to see commit with specified added or removed text
    # gil master..feature to see commits which exist in feature branch but not exist in master
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
alias gifb='git fetch origin $branch'
alias gpr='git pull --rebase origin $(git symbolic-ref HEAD 2> /dev/null | cut -b 12-)'
alias grp='git rp'
# rebase
alias grbi='git rbi'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbs='git rebase --skip'
# cherry-pick
alias gcp='git cp'
alias gcpa='git cp --abort'
alias gcpc='git cp --continue'
alias gcpq='git cp --quit'
# reset
alias gci='git clean -dfx' # remove whole ignored files and untracked
alias gcu='git clean -df' # remove whole untracked files
alias grh='git reset --hard HEAD'
alias grs='git reset --soft HEAD'
alias grst='git reset HEAD $path'
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
