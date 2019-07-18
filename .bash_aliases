export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
BASH_THEME="honukai"
# to add colors for status line
export TERM=xterm-256color

stty -ixon # to have possibility search forward in history

# append to the history file, don't overwrite it
shopt -s histappend
# to update bash history in realtime
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

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

# sh scripts aliases
alias sh_names='$CONFIGS/get_file_names.sh'
alias sh_clean='$CONFIGS/clean_temp_files.sh'
check_safe_regexps() {
	node $DROPBOX/Development/nodejs-trainings/safe-regexps.js $1
}
check_libuv() {
	UV_THREADPOOL_SIZE=$1 node $DROPBOX/Development/nodejs-trainings/threadpools_in_nodejs.js
}

DROPBOX='/mnt/c/Users/Igor_Mykhaylyuk/OneDrive/'
TRAININGS='/mnt/c/Users/Igor_Mykhaylyuk/projects/trainings/'
CONFIGS="/mnt/c/Users/Igor_Mykhaylyuk/OneDrive/Development/config-files"
CONFIG="/mnt/c/Users/Igor_Mykhaylyuk/OneDrive/Development/config-files/CONFIG.js"
CONFIG_DEFAULT="/mnt/c/Users/Igor_Mykhaylyuk/OneDrive/Development/config-files/CONFIG_DEFAULT.js"
CAR="/mnt/c/Users/Igor_Mykhaylyuk/projects/ctc-car"
# KAFKA_URL="d9lcajkafk02.labcorp.ad.ctc:9092"
KAFKA_URL="localhost:9092"
# ZOOKEEPER_URL="d9lcajzokp01.labcorp.ad.ctc:2181"
ZOOKEEPER_URL="localhost:2181"
# TOPIC_PREFIX="CTR_IM_"
TOPIC_PREFIX="CTR_"
# KAFKA_HOME="$HOME/kafka_2.12-2.2.0"
KAFKA_HOME="$HOME/kafka_2.11-1.1.0"
DOCKER_KAFKA_HOME="/opt/kafka_2.11-0.10.1.0/bin"
DOCKER_KAFKA_URL="localhost:9092"
DOCKER_ZOOKEEPER_URL="localhost:2181"
# alias cdp='cd ~/projects/ecommerce/pos_ui'
alias mtt='cd $TRAININGS'
alias mtdb='cd $DROPBOX'
alias mtc='cd $CONFIGS'
# alias mtp='cd ~/projects/refactor-evolution/ecommerce/pos_ui'
alias mtp='cd $CAR'
alias mtd='cd $CAR/app-data'
alias mtds='cd $CAR/cds.api.data-storage'
alias mtra='cd $CAR/cds.api.reservation'
alias mtac='cd $CAR/cds.common.api-client'
alias mtdc='cd $CAR/cds.delta-calculator'

# usefull aliases for gcp commands
alias gcpci='gcloud components install $1'
alias gcpcr='gcloud components remove $1'
alias gcpcu='gcloud components update'

# aws aliases
alias aws_login="okta-aws default sts get-caller-identity"
alias aws_kin_ls="aws kinesis list-streams --profile=dev"

# Docker configs
export DOCKER_HOST=tcp://127.0.0.1:2375

# usefull aliases for docker-compose commands
dcompose_up () {
	docker-compose -f $1 up
}
dcompose_down () {
	docker-compose -f $1 down
}
# usefull aliases for docker commands
alias dcls='docker ps -a'
alias dclsa='docker container ls --all'
alias dcl='docker container logs $container_name'
alias dcm='move_to_container $1'
move_to_container() {
	docker exec -it $1 /bin/bash
}
alias dcp='docker port $container_name'
alias dcr='docker run -d -P --rm --name $container_name $image'
alias dcrm='docker container rm $container_name'
alias dcrma='docker container prune'
alias dcs='docker stop $container_name'
alias drk='docker run -p 2181:2181 -p 9092:9092 --env ADVERTISED_HOST=127.0.0.1 --env ADVERTISED_PORT=9092 --net car-network --name kafka spotify/kafka'
alias drdb='docker run -P -d -e MYSQL_ROOT_PASSWORD=qwerty --name mysqldb mysql:8.0.15'
alias drdbm='docker run -p 27017:27017 --name mongodb mongo'
alias dib='docker build -t $image .'
alias dils='docker images'
alias dirm='docker rmi $image'
alias dis='docker search $image'
# alias 'dk-sc'="docker exec -it kafka /opt/kafka_2.11-0.10.1.0/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic $1"
# alias 'dk-sp'="docker exec -it kafka /opt/kafka_2.11-0.10.1.0/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic $1"
dt_consumer() {
	docker exec -it kafka $DOCKER_KAFKA_HOME/kafka-console-consumer.sh --bootstrap-server $DOCKER_KAFKA_URL --topic $1
}
dt_producer() {
	docker exec -it kafka $DOCKER_KAFKA_HOME/kafka-console-producer.sh --broker-list $DOCKER_KAFKA_URL --topic $1
}
dt_info() {
	docker exec -it kafka $DOCKER_KAFKA_HOME/kafka-topics.sh --describe --zookeeper $DOCKER_ZOOKEEPER_URL --topic $1
}
dt_count() {
	docker exec -it kafka $DOCKER_KAFKA_HOME/kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list $DOCKER_KAFKA_URL --topic $1 --time -1 --offsets 1 
}
dt_counta() {
	docker exec -it kafka $DOCKER_KAFKA_HOME/kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list $DOCKER_KAFKA_URL --topic $1 --time -1 --offsets 1 | awk -F  ":" '{sum += $3} END {print sum}'
}
dt_create() {
	docker exec -it kafka $DOCKER_KAFKA_HOME/kafka-topics.sh --create --zookeeper $DOCKER_ZOOKEEPER_URL --replication-factor 1 --partitions $2 --topic $1 
}
kt_create() {
	$KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper $ZOOKEEPER_URL --replication-factor 1 --partitions $2 --topic $1 
}
dt_increase() {
	docker exec -it kafka $DOCKER_KAFKA_HOME/kafka-topics.sh --alter --zookeeper $DOCKER_ZOOKEEPER_URL --topic $1 --partitions $2
}
dt_get_first() {
	docker exec -it kafka $DOCKER_KAFKA_HOME/kafka-console-consumer.sh --bootstrap-server $DOCKER_KAFKA_URL --topic $1 --from-beginning --max-messages 1
	# docker exec -it kafka $DOCKER_KAFKA_HOME/kafka-simple-consumer-shell.sh --broker-list $DOCKER_KAFKA_URL --topic $1 --partition $2 --offset $3
}
dt_get_last() {
	docker exec -it kafka $DOCKER_KAFKA_HOME/kafka-simple-consumer-shell.sh --broker-list $DOCKER_KAFKA_URL --topic $1 --partition $2 --offset $3
}
dg_info() {
	docker exec -it kafka $DOCKER_KAFKA_HOME/kafka-consumer-groups.sh --bootstrap-server $DOCKER_KAFKA_URL --group $1 --describe
}
docker_kafka_subscribe_consumer() {
  # echo Consumer is listening $TOPIC_PREFIX $1 $2
  printf "The consumer is listening %s topic \n\n" $TOPIC_PREFIX$1_$2 
  docker exec -it kafka /opt/kafka_2.11-0.10.1.0/bin/kafka-console-consumer.sh --bootstrap-server $DOCKER_KAFKA_URL --topic $TOPIC_PREFIX$1_$2
}
dkscd() {
  docker_kafka_subscribe_consumer $1 Data
}
dkscc() {
  docker_kafka_subscribe_consumer $1 Changes
}
alias 'car-fifcd'="cd $CAR/cds.file-ingestion/ && runfilefcd"
runfilefcd() { # to run file ingestion
  npm run cli -- -t $1 -i $CAR/app-data/$2 -c $CONFIG_DEFAULT
}

alias 'runac'="cd $CAR && NODE_ENV=development ./run_api.sh -c $CONFIG_DEFAULT"
alias 'runcc'="cd $CAR && NODE_ENV=development ./run.sh -c $CONFIG_DEFAULT"

# usefull alias for git commands
# info
alias gil='git log --decorate --oneline'
alias gilm='git log --decorate --oneline --author="Igor Mykhaylyuk" --graph --no-merges'
alias gilac='git shortlog -s -n'
    # add <branch_name> to see commits of specified branch
    # add -<number> to see last <number> commits
    # use --grep="<text>" to see commits with specified text
    # --stat option displays the number of insertions and deletions to each file
    # --aftre="2017-01-13"
    # --until="2017-01-13" - to see commits in specified time range
    # gil -- <file_name> to see commits to specified file or files
    # -S"<text>" to see commit with specified added or removed text
    # gil master..feature to see commits which exist in feature branch but not exist in master
alias gdif='git dif'
alias gs='git status'
# commiting
alias gcia='git cia'
gcm() {
	git ci -am "DPCE-$1: $2"
}
# bisecting
alias gbis='git bisect start'
alias gbib='git bisect bad'
alias gbig='git bisect good'
alias gbir='git bisect reset'
# branch info
alias gba='git branch -a'
alias gbl='git branch -l'
alias gbr='git branch -r'
alias gbm='git branch --merged'
alias gbnm='git branch --no-merged'
# branch operations
alias gmb='git branch -m $(git symbolic-ref HEAD 2> /dev/null | cut -b 12-) $newbranch'
alias gcpd='git co pos_develop'
alias gcld='git co loy_develop'
alias gcob='git co $branch'
alias gcnb='git co -b $branch'
# remote operations
alias gif='git fetch'
alias gifb='git fetch origin $branch'
alias gpr='git pull --rebase origin $(git symbolic-ref HEAD 2> /dev/null | cut -b 12-)'
alias grp='git rp'
alias grpf='git push -f origin $(git symbolic-ref HEAD 2> /dev/null | cut -b 12-)'
alias grb='git branch -D $branch'
alias grrb='git push origin :$(git symbolic-ref HEAD 2> /dev/null | cut -b 12-)'
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
alias grl='git reset --hard HEAD~1'
alias grs='git reset --soft HEAD'
alias grst='git reset HEAD $path'
# stash
alias gst='git stash'
alias gstm='git stash save $message'
alias gsta='git stash apply stash@\{$number\}'
alias gstl='git stash list'
alias gust='git stash pop'
# gerrit
alias ggr='git review franchise'

alias reslint='eslint . -c $CAR/.eslintrc.json'
alias rfeslint='eslint . --fix -c $CAR/.eslintrc.json'

# SOME ALIASES FOR NPM
alias ncl='npm config list'
alias ncc='npm cache clean'
alias nci='np && ncc && ni'
alias ni='npm install --no-package-lock'
alias nif='rm -rf ./node_modules && npm install --no-package-lock'
alias nl='npm list --depth=${1:-0}' # linux command
alias nlg='npm list -g --depth=${1:-0}' # linux command
alias np='npm prune'
alias nu='npm update'
alias nr='npm run'
alias ns='npm start'
alias nsc='NODE_ENV=development npm start -- -c $CONFIG'
alias nscd='npm start -- -c $CONFIG_DEFAULT'
alias nsbr='npm start -- --log --mock'
alias nd='npm run dev'
alias nt='npm test'
alias nv='npm run validate'
alias nvf='npm run lintfix'
alias nvd='npm version'
# alias nt='node ./run_tests.js'
alias nta='karma start --single-run'
alias nld='npm link'
alias nla='npm link $1'
alias nlls='ls -l node_modules | grep ^l'
alias nrld='npm uninstall'
alias nrla='npm uninstall --no-save some-dependency && ni'

alias "c=clip"
alias "v=clip -o"


alias addhosts="$CONFIGS/add-hosts.sh"
# alias addhosts="cd /mnt/c/Users/Igor_Mykhaylyuk/!new_data/Dropbox/Development/config-files && ./add-hosts.sh"

# Kafka aliases
alias 'car-zookeeper-start'="$KAFKA_HOME/bin/zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties"
alias 'car-kafka-start'="$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties"
alias 'k-ct'="$KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper $ZOOKEEPER_URL --replication-factor 1 --partitions 1 --topic $topic"
# alias 'k-rt'="$KAFKA_HOME/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic $topic"
# alias 'k-dt'="$KAFKA_HOME/bin/kafka-run-class.sh kafka.admin.TopicCommand --zookeeper localhost:2181 --delete --topic $topic"
alias 'k-dd'="$KAFKA_HOME/bin/kafka-topics.sh --zookeeper $ZOOKEEPER_URL --delete --topic $topic"
alias 'k-rt'="cd $KAFKA_HOME/bin && sudo ./zookeeper-shell.sh $ZOOKEEPER_URL rmr /brokers/topics/$1"
krt() {
	cd $KAFKA_HOME/bin && ./zookeeper-shell.sh $ZOOKEEPER_URL rmr /brokers/topics/$1
}

# Producers:
alias 'k-sp'="$KAFKA_HOME/bin/kafka-console-producer.sh --broker-list $KAFKA_URL --topic $topic"
kafka_subscribe_producer() {
	$KAFKA_HOME/bin/kafka-console-producer.sh --broker-list $KAFKA_URL --topic $TOPIC_PREFIX$1_$2
}
kspd() {
	kafka_subscribe_producer $1 Data
}
kspk() {
	kafka_subscribe_producer $1 Keys
}
kspc() {
	kafka_subscribe_producer $1 Changes
}

# Consumers:
alias 'k-sc'="$KAFKA_HOME/bin/kafka-console-consumer.sh --bootstrap-server $KAFKA_URL --topic $1"
kafka_subscribe_consumer() {
	# echo Consumer is listening $TOPIC_PREFIX $1 $2
	printf "The consumer is listening %s topic \n\n" $TOPIC_PREFIX$1_$2 
	$KAFKA_HOME/bin/kafka-console-consumer.sh --bootstrap-server $KAFKA_URL --topic $TOPIC_PREFIX$1_$2 | jq
}
kscd() {
	kafka_subscribe_consumer $1 Data
}
ksck() {
	kafka_subscribe_consumer $1 Keys
}
kscc() {
	kafka_subscribe_consumer $1 Changes
}
# Topics Info:
alias 'k-ls'="$KAFKA_HOME/bin/kafka-topics.sh --list --zookeeper $ZOOKEEPER_URL"
alias 'k-tp'="$KAFKA_HOME/bin/kafka-topics.sh --describe --zookeeper $ZOOKEEPER_URL --topic $1"
alias 'k-mfb'="$KAFKA_HOME/bin/kafka-console-consumer.sh --bootstrap-server $KAFKA_URL --topic $1 --from-beginning --max-messages $2"
kmc() {
	result=$($KAFKA_HOME/bin/kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list $KAFKA_URL --topic $1 --time -1 --offsets 1 | awk -F  ":" '{sum += $3} END {print sum}')
	printf "$result \n"
}
kmca() {
	result=$($KAFKA_HOME/bin/kafka-consumer-groups.sh --bootstrap-server $KAFKA_URL --group $1 --describe)
	printf "$result \n"
}
kmfb() {
	k-sc $1 --from-beginning --max-messages $2
}
kmfe() {
	$KAFKA_HOME/bin/kafka-simple-consumer-shell.sh --broker-list $KAFKA_URL --topic $1 --partition $2 --offset $3
}
runfile() { # to run file ingestion
	npm run cli -- -t $1 -i $CAR/app-data/$1.txt
}
runfilec() { # to run file ingestion
	npm run cli -- -t $1 -i $CAR/app-data/$1.txt -c $CAR/app-data/CONFIG.js
}
runfilef() { # to run file ingestion
	npm run cli -- -t $1 -i $CAR/app-data/$2
}
runfilefc() { # to run file ingestion
	npm run cli -- -t $1 -i $CAR/app-data/$2 -c $CONFIG
}
runfiled() { # to run file ingestion
	node --inspect src -t $1 -o $CAR/cds.file-ingestion/$2 -i $CAR/app-data/$3
}
cptl() { # to run file ingestion
	cp /mnt/c/Users/Igor_Mykhaylyuk/projects/CTCO-CAR0/app-data/$1 $CAR/app-data/$1
}
cptw() { # to run file ingestion
	cp $CAR/app-data/$1 /mnt/c/Users/Igor_Mykhaylyuk/projects/CTCO-CAR0/app-data/$1
}
cpdtl() { # to run file ingestion
	cp -a /mnt/c/Users/Igor_Mykhaylyuk/projects/CTCO-CAR0/car0 ~/car0
}
cpdtw() { # to run file ingestion
	cp -a ~/car0 /mnt/c/Users/Igor_Mykhaylyuk/projects/CTCO-CAR0/car0
}
alias 'car-ds'="cd $CAR/data-storage-api/ && npm start"
alias 'car-dsc'="cd $CAR/data-storage-api/ && npm start -- -c $CAR/app-data/CONFIG.js"
alias 'car-dc'="cd $CAR/delta-calculator/ && npm start"
alias 'car-dcc'="cd $CAR/delta-calculator/ && npm start -- -c $CAR/app-data/CONFIG.js"
alias 'car-dd'="cd $CAR/delete-delta/ && npm start"
alias 'car-ddc'="cd $CAR/delete-delta/ && npm start -- -c $CAR/app-data/CONFIG.js"
alias 'car-fi'="cd $CAR/cds.file-ingestion/ && runfile"
alias 'car-fic'="cd $CAR/cds.file-ingestion/ && runfilec"
alias 'car-fif'="cd $CAR/cds.file-ingestion/ && runfilef"
alias 'car-fifc'="cd $CAR/cds.file-ingestion/ && runfilefc"
alias 'car-fid'="cd $CAR/cds.file-ingestion/ && runfiled"
alias 'car-cc'="cd $CAR/car-consumer/ && npm start"
alias 'car-ccc'="cd $CAR/car-consumer/ && npm start -- -c $CAR/app-data/CONFIG.js"
alias 'car-sd'="cd $CAR/soap-dispatcher/ && npm start"
alias 'car-sdc'="cd $CAR/soap-dispatcher/ && npm start -- -c $CAR/app-data/CONFIG.js"
# alias 'car-run-all'="car-ds && car-dc && car-run-all" # run-all should be the last command
