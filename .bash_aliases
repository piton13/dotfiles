export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
BASH_THEME="honukai"
# to add colors for status line
export TERM=xterm-256color

export SHELL_SCRIPTS_PATH="~/OneDrive/Development/shell-scripts-git"

stty -ixon # to have possibility search forward in history

# append to the history file, don't overwrite it
# shopt -s histappend
# to update bash history in realtime
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
# shopt -s checkwinsize

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
alias ls_size='du -sh * | grep -E "\dG"'
alias ls_size_sorted='du -hs * | sort -h'
alias ls_size_availabe='df -h'

# mac terminal
# see installed apps
alias see_apps='ls -la /Applications/'
# see all the apps
alias see_apps_all='sudo find / -iname "*.app"'

# chrome
alias run_chrome_withou_cors='open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir="/tmp/chrome_dev_test" --disable-web-security'

# sh scripts aliases
alias sh_names='$CONFIGS/get_file_names.sh'
alias sh_clean='$CONFIGS/clean_temp_files.sh'
check_safe_regexps() {
	node $DROPBOX/Development/nodejs-trainings/safe-regexps.js $1
}
check_libuv() {
	UV_THREADPOOL_SIZE=$1 node $DROPBOX/Development/nodejs-trainings/threadpools_in_nodejs.js
}

CURRENT_USER='igor.mykhaylyuk'
DROPBOX='/Users/igor.mykhaylyuk/OneDrive'
TRAININGS='/Users/igor.mykhaylyuk/OneDrive/Projects/Trainings'
CONFIGS="/Users/igor.mykhaylyuk/OneDrive/Development/config-files"
SCRIPTS="/Users/imykhaylyuk/projects/trainings/shell-scripts/mac-sh"
CONFIG="/Users/igor.mykhaylyuk/OneDrive/Development/config-files/CONFIG.js"
CONFIG_DEFAULT="/Users/igor.mykhaylyuk/OneDrive/Development/config-files/CONFIG_DEFAULT.js"
CAR="/mnt/c/Users/Igor_Mykhaylyuk/projects/ctc-car"
DAT="/Users/igor.mykhaylyuk/projects/dat"
GUESTY="/Users/imykhaylyuk/projects/guesty_new"
JMIR='/Users/igor/Projects/JMIR'
KAFKA_URL="wrong_kafka_host_by_default"
# ZOOKEEPER_URL="d9lcajzokp01.labcorp.ad.ctc:2181"
# ZOOKEEPER_URL="localhost:2181"
ZOOKEEPER_URL="z-2.account-test-kafka.l9ait3.c2.kafka.us-west-2.amazonaws.com:2181,z-1.account-test-kafka.l9ait3.c2.kafka.us-west-2.amazonaws.com:2181,z-3.account-test-kafka.l9ait3.c2.kafka.us-west-2.amazonaws.com:2181"
# TOPIC_PREFIX="CTR_IM_"
TOPIC_PREFIX="CTR_"
# KAFKA_HOME="$HOME/kafka_2.12-2.2.0"
KAFKA_HOME="$HOME/kafka_2.13-3.1.0/bin"
# DOCKER_KAFKA_HOME="/opt/kafka_2.11-1.1.1/bin"
DOCKER_KAFKA_HOME="/opt/kafka_2.13-2.7.0/bin"
# DOCKER_KAFKA_HOME="/opt/kafka_2.11-0.10.1.0/bin"
# DOCKER_CONTAINER_NAME=kafka-local
DOCKER_CONTAINER_NAME=kafka-local
DOCKER_KAFKA_URL="kafka:9092"
DOCKER_ZOOKEEPER_URL="localhost:2181"
LOCAL_KAFKA_URL="localhost:9092"
# LOCAL_KAFKA_URL="b-2.account-test-kafka.l9ait3.c2.kafka.us-west-2.amazonaws.com:9092,b-3.account-test-kafka.l9ait3.c2.kafka.us-west-2.amazonaws.com:9092,b-1.account-test-kafka.l9ait3.c2.kafka.us-west-2.amazonaws.com:9092"
LOCAL_ZOOKEEPER_URL="localhost:2181"
# LOCAL_KAFKA="/Users/igor.mykhaylyuk/kafka_2.12-2.5.0/bin"
LOCAL_KAFKA="$HOME/kafka_2.13-3.1.0/bin"

alias mtt='cd $TRAININGS'
alias mtdb='cd $DROPBOX'
alias mtc='cd $CONFIGS'
# alias mtd='cd $CAR/app-data'
# alias mtp='cd $DAT'
# alias mtp='cd $GUESTY'
alias mtp='cd $JMIR'
alias mts='cd $SCRIPTS'

# Brew
alias bs_ls="brew services list"
alias bs_start="brew services start $1"
alias bs_stop="brew services stop $1"

# usefull aliases for gcp commands
alias gcpci='gcloud components install $1'
alias gcpcr='gcloud components remove $1'
alias gcpcu='gcloud components update'

# typeorm aliases
alias typeorm_new="typeorm migration:create -n $1"
alias typeorm_check="typeorm migration:generate -n $1"

# aws aliases
alias aws_login="okta-aws default sts get-caller-identity"
alias aws_login_keyman="aws_okta_keyman -o dat -u igorm@tcore.com -ro DATDeveloper-Identity"
alias aws_login_keyman_pci="aws_okta_keyman -o dat -u igorm@tcore.com -ro DATDeveloper-PCI"
alias aws_kin_ls="aws kinesis list-streams --profile=dev"
alias aws_kafka_move="ssh -i /mnt/c/Users/Igor_Mykhaylyuk/OneDrive/Projects/DAT-DEV/kafka+lambda_interaction/MSKKeyPairKafkaLambda.pem ec2-user@ec2-54-185-168-13.us-west-2.compute.amazonaws.com"
alias adc="aws-dat-cli"

# Networking
alias n_occupied="netstat -anvp tcp | awk 'NR<3 || /LISTEN/'"
alias n_ccoupied2="sudo lsof -PiTCP -sTCP:LISTEN"
alias n_check_ip="dig $site_name"
alias n_consumer="nc -l $port"
alias n_producer="nc 127.0.0.1 $port"

# Docker configs
# export DOCKER_HOST=tcp://127.0.0.1:2375

# Kubernetes aliases
alias kub_ls="kubectl get pods"
alias kub_logs="kubectl logs $1"
kub_logs_prev() {
	kubectl logs $1 --previous
}
alias kub_p_info="kubectl describe pod $1"
alias kub_config_v="kubectl config view"
alias kub_context_ls="kubectl config get-contexts"
alias kub_context="kubectl config current-context"
alias kub_context_set="kubectl config use-context $1"
alias kub_namespace_ls="kubectl get namespaces"
kub_namespace_set2() {
	kubectl config set-context --current --namespace=$1
}
namespace=test
alias kub="kubectl -n $namespace $1"

alias kub_pod_ls="kubectl get pods"
  # --sort-by='.status.containerStatuses[0].restartCount' # sort by container restarts
  # -o wide # see pods with more details
# alias kub_pod_ls_d="kubectl get pods -o wide"
alias kub_pod_rm="kubectl delete pod $1"
alias kub_pod_info="kubectl describe pod $1"
alias kub_pod_resources="kubectl top pod $2 -n $1"
alias kub_pod_metrics="kubectl top pod $1 --containers"
alias kub_pod_port="kubectl get pod $1 --template='{{(index (index .spec.containers 0).ports 0).containerPort}}{{\"\n\"}}'"
alias kub_pod_forward_port="kubectl port-forward $1 $2:$3" # 2 - local port; 3 - pods port
alias kub_pod_logs="kubectl logs $1"
alias kub_pod_logs_r="kubectl logs -f $1"
kub_pod_logs_prev() {
	kubectl logs $1 --previous
}
kub_move() {
    # kubectl exec -it $1 -- /bin/bash
	kubectl -n $1 exec -it $2 -- /bin/bash
}
kub_get_envs() {
	kubectl -n $1 exec $2 -- sh -c "xargs -0 -L1 -a /proc/1/environ"
}
kub_get_pods() {
	kubectl -n $1 get pods
}
kub_get_logs() {
	kubectl -n $1 logs $2
}
kub_get_logs_r() {
	kubectl -n $1 logs $2 -f
}
alias kub_s_ls="kubectl get services"
alias kub_d_ls="kubectl get deployments"
alias kub_d_get="kubectl get helmreleases.flux.weave.works"
alias kub_d_remove="kubectl delete helmreleases.flux.weave.works $1"
alias kub_d_restart="kubectl rollout restart deployment $1"

# Kubernetes k9s aliases
kubk_run="k9s -n $1" # to run k9s in a given namespace
kubk_pod="k9s -c $pod" # to run k9s in pod view via the pod command
kubk_context="k9s --context $ctx" # to run k9s in a non default kubconfig context
kubk_readonly="k9s --readonly" # to run k9s in readonly mode

# usefull aliases for docker-compose commands
dcompose_up () {
	docker-compose -f $1 up
}
dcompose_up_rebuild () {
	docker-compose -f $1 up -d --build
}
dcompose_down () {
	docker-compose -f $1 down
}
# usefull aliases for docker commands
# docker='sudo docker'
docker='docker' # images, containers, networks and volumes
alias d_vulnerability_check='docker scan' # run Snyk to check images for vulnerabilities
alias dcls='$docker ps -a'
alias dclsa='$docker container ls --all'
alias dcl='$docker container logs $container_name'
dc_move() {
	$docker exec -it $1 /bin/bash
}
dc_cp_to() {
	container_hash=$1
	path_to_local_file=$2
	path_to_file=$3
	$docker cp $path_to_local_file $container_hash:/$path_to_file
}
dc_cp_from() {
	container_hash=$1
	path_to_local_file=$2
	path_to_file=$3
	$docker cp $container_hash:/$path_to_file $path_to_local_file
}
alias dcp='$docker port $container_name'
alias dc_run='$docker run -d -P --rm --name $container_name $image'
alias dc_create='$docker container create $image_hash'
alias dc_rm='$docker container rm $container_name'
# stop & removes container using force flag
alias dc_rm_f='$docker container rm -f $container_name'
alias dcrma='$docker container prune'
alias dc_stop='$docker stop $container_name'
alias dc_start='$docker start $container_name'
alias dc_inspect="$docker inspect $container_name"
alias dc_inspect_env_vars="$docker inspect $container_name | grep $matchint_name" # $1 - container hash; $2 - matching string
alias dc_logs="$docker logs $container_name"
alias dc_logs_f="$docker logs -f $container_name"
alias dc_prune_images="docker image prune -a"
alias dc_prune_containers="docker container prune"
alias dc_prune_voulmes="docker volume prune"
alias dc_prune_network="docker network prune"
alias dc_prune_system="docker system prune"
alias drzk='$docker run -p 2181:2181 -p 9092:9092 --env ADVERTISED_HOST=127.0.0.1 --env ADVERTISED_PORT=9092 --net car-network --name kafka spotify/kafka'
alias drk='$docker run -p 9092:9092 --env KAFKA_ADVERTISED_HOST_NAME=127.0.0.1 --env KAFKA_ADVERTISED_PORT=9092 --env KAFKA_ZOOKEEPER_CONNECT=localhost:2181 --env KAFKA_DELETE_TOPIC_ENABLE=true --env KAFKA_AUTO_CREATE_TOPICS_ENABLE=true --name kafka-local-2 wurstmeister/kafka:2.13-2.7.0'
# alias drdb='$docker run -P -d -e MYSQL_ROOT_PASSWORD=qwerty --name mysqldb mysql:8.0.15'
# alias drdb='$docker run -p 3316:3306 -d --platform linux/amd64 -e MYSQL_ROOT_PASSWORD=qwerty --name mysqldb mysql:8.0.17'
alias drdb='$docker run -p 3307:3306 -d --platform linux/amd64 --name mysqldb mysql/mysql-server:8.0.17'
alias dr_db2='$docker run -p 3307:3306 -d -e MYSQL_ROOT_PASSWORD=qwerty --name mysqldb57 mysql:5.7.12'
alias dr_db5='$docker run -p 3309:3306 -d --network="host" -e MYSQL_ROOT_PASSWORD=qwerty --name mysqldb57 mysql:5.7.12'
alias dr_db3='$docker run -p 3308:3306 -d -e MYSQL_ROOT_PASSWORD=qwerty --name mysqldb57-2 mysql:5.7.12'
alias dr_db4='$docker run -p 3309:3306 -d -e MYSQL_ROOT_PASSWORD=qwerty --name mysqldb57-3 mysql:5.7.12'
alias drdbp='$docker run --name some-postgres -p 5433:5432 -e POSTGRES_PASSWORD=qwerty -d postgres'
alias drdbm='$docker run -p 27017:27017 --name mongodb mongo'
pg_dumps_folder='/Users/imykhaylyuk/Downloads/guesty_dumps'
# alias pg_dump='PGPASSWORD="E7vE50t7Q_lCftPVbA4z-FwQaQA03F9s7Gr" pg_dump -U guesty_db_user -h production-db-cluster-biz.cluster-ro-cdrzb2ylebb8.us-east-1.rds.amazonaws.com --format=custom accounting_production > $pg_dumps_folder/$1.dump'
pg_dump2() {
	export PGPASSWORD="E7vE50t7Q_lCftPVbA4z-FwQaQA03F9s7Gr"
	command='pg_dump -U guesty_db_user -h production-db-cluster-biz.cluster-ro-cdrzb2ylebb8.us-east-1.rds.amazonaws.com --format=custom accounting_production > $0.dump'
	$command
}
# alias pg_restore='pg_restore --username=kong --password --host=localhost --port=5432 --verbose --format=custom --dbname=accounting_production_new $pg_dumps_folder/$1.dump'
pg_restore2() {
	command='pg_restore --username=kong --password --host=localhost --port=5432 --verbose --format=custom --dbname=accounting_production_new $0.dump'
	$command
}
alias drdb_mongo='$docker run -p 2717:27017 -d --name mongodb mongo'
alias drkwv='$docker run -it -p 8080:8080 -v kafkawebview_data:/app/data sourcelaborg/kafka-webview:latest'
alias dr_rabbit='$docker run -it -d --name myrabbitmq -p 5677:5672 -p 15677:15672 -e RABBITMQ_DEFAULT_USER=user -e RABBITMQ_DEFAULT_PASS=qwerty rabbitmq:3-management'
alias di_build='$docker build -t $image .'
alias di_build_custom='$docker build -f $docker_file -t $image .' # -f Dockerfile.development -t registry.org/platform:v2-beta-001
alias di_ls='$docker images'
alias di_rm='$docker rmi $image'
alias di_rm_f='$docker rmi -f $image'
alias di_run='$docker run $image $command1 $command2 $command3'
alias di_publish='$docker image push $image_name_with_tag' # registry.org/platform:v2-beta-001
# alias di_run='$docker run $image $command' # docker run iname_hash npm test works well
alias di_search='$docker search $image'
di_get_info() {
	$docker run -it $1 /bin/bash
}
alias dv_ls='$docker volume ls -q'
alias dv_rm='$docker volume rm $volume'
alias dv_rm_all='$docker volume prune' # This will remove all volumes not used by at least one container
alias dn_ls='$docker network ls'
alias dn_rm_all='$docker network prune'

# KAFKA_EXEC=local
kafka_executable() {
	echo $KAFKA_EXEC
}
kafka_executable_set() {
	KAFKA_EXEC=$1
	case $1 in "local") KAFKA_EXEC=$KAFKA_HOME/bin/kafka-topics.sh;;
	"docker") KAFKA_EXEC="$docker exec -it $DOCKER_CONTAINER_NAME $DOCKER_KAFKA_HOME/kafka-topics.sh";;
	*)
	# Echo “default case”;;
	esac
}
kt_ls() {
	$KAFKA_EXEC --list --zookeeper $1
}
# alias 'dk-sc'="$docker exec -it kafka /opt/kafka_2.11-0.10.1.0/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic $1"
# alias 'dk-sp'="$docker exec -it kafka /opt/kafka_2.11-0.10.1.0/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic $1"
dt_ls() {
	# $docker exec -it $DOCKER_CONTAINER_NAME $DOCKER_KAFKA_HOME/kafka-topics.sh --list --zookeeper $ZOOKEEPER_URL
	# works only in local kafka from 2.13-2.7.0 version
	# $KAFKA_EXEC/kafka-topics.sh --list --bootstrap-server $KAFKA_URL
	$docker exec -it $DOCKER_CONTAINER_NAME $DOCKER_KAFKA_HOME/kafka-topics.sh --list --bootstrap-server $KAFKA_URL
}
klt_ls() {
	# $docker exec -it $DOCKER_CONTAINER_NAME $DOCKER_KAFKA_HOME/kafka-topics.sh --list --zookeeper $ZOOKEEPER_URL
	# works only in local kafka from 2.13-2.7.0 version
	# $KAFKA_EXEC/kafka-topics.sh --list --bootstrap-server $KAFKA_URL
	$KAFKA_HOME/kafka-topics.sh --list --bootstrap-server $KAFKA_URL
}
dt_config_get() {
	$docker exec -it $DOCKER_CONTAINER_NAME $DOCKER_KAFKA_HOME/kafka-configs.sh --describe --all --bootstrap-server $KAFKA_URL --topic $1
}
dt_config_set() {
	topic_name="$1"
    	config_name="$2"
    	config_value="$3"
	# $docker exec -it $DOCKER_CONTAINER_NAME $DOCKER_KAFKA_HOME/kafka-configs.sh --alter --add-config $2=$3 --bootstrap-server $KAFKA_PROD_URL --topic $1
	$docker exec -it $DOCKER_CONTAINER_NAME $DOCKER_KAFKA_HOME/kafka-configs.sh --alter --add-config ${config_name}=${config_value} --bootstrap-server $KAFKA_URL --topic ${topic_name}
}
dt_info() {
	# $docker exec -it $DOCKER_CONTAINER_NAME $DOCKER_KAFKA_HOME/kafka-topics.sh --describe --zookeeper $ZOOKEEPER_URL --topic $1
	$docker exec -it $DOCKER_CONTAINER_NAME $DOCKER_KAFKA_HOME/kafka-topics.sh --describe --bootstrap-server $KAFKA_URL --topic $1
}
dt_delete() {
	$docker exec -it $DOCKER_CONTAINER_NAME $DOCKER_KAFKA_HOME/kafka-topics.sh --bootstrap-server $KAFKA_URL --delete --topic $1
	# $docker exec -it $DOCKER_CONTAINER_NAME $DOCKER_KAFKA_HOME/kafka-topics.sh --zookeeper $ZOOKEEPER_URL --delete --topic $1
}
dt_create() {
	# $docker exec -it $DOCKER_CONTAINER_NAME $DOCKER_KAFKA_HOME/kafka-topics.sh --create --zookeeper $DOCKER_ZOOKEEPER_URL --replication-factor 1 --partitions $2 --topic $1
	$docker exec -it $DOCKER_CONTAINER_NAME $DOCKER_KAFKA_HOME/kafka-topics.sh --bootstrap-server $KAFKA_URL --create --replication-factor $3 --partitions $2 --topic $1
}
klt_create() {
	# $docker exec -it $DOCKER_CONTAINER_NAME $DOCKER_KAFKA_HOME/kafka-topics.sh --create --zookeeper $DOCKER_ZOOKEEPER_URL --replication-factor 1 --partitions $2 --topic $1
	$KAFKA_HOME/kafka-topics.sh --bootstrap-server $KAFKA_URL --create --replication-factor $3 --partitions $2 --topic $1
}
dt_consumer_all() {
	$docker exec -it $DOCKER_CONTAINER_NAME $DOCKER_KAFKA_HOME/kafka-console-consumer.sh --bootstrap-server $KAFKA_URL --topic $1 --from-beginning --property print.timestamp=true
}
klt_consumer_all() {
	$KAFKA_HOME/kafka-console-consumer.sh --bootstrap-server $KAFKA_URL --topic $1 --from-beginning --property print.timestamp=true --property print.offset=true
}
dt_consumer_offset() {
	$docker exec -it $DOCKER_CONTAINER_NAME $DOCKER_KAFKA_HOME/kafka-console-consumer.sh --bootstrap-server $KAFKA_URL --topic $1 --offset $2 --partition 0 --max-messages 1
}
dt_consumer() {
	$docker exec -it $DOCKER_CONTAINER_NAME $DOCKER_KAFKA_HOME/kafka-console-consumer.sh --bootstrap-server $KAFKA_URL --topic $1
}
klt_consumer() {
	$KAFKA_HOME/kafka-console-consumer.sh --bootstrap-server $KAFKA_URL --topic $1
}
dt_producer() {
	$docker exec -it $DOCKER_CONTAINER_NAME $DOCKER_KAFKA_HOME/kafka-console-producer.sh --broker-list $KAFKA_URL --topic $1
}
dt_count() {
	$docker exec -it $DOCKER_CONTAINER_NAME $DOCKER_KAFKA_HOME/kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list $KAFKA_URL --topic $1 --time -1 --offsets 1
}
klt_count() {
	$KAFKA_HOME/kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list $KAFKA_URL --topic $1 --time -1 --offsets 1
}
dt_counta() {
	$docker exec -it $DOCKER_CONTAINER_NAME $DOCKER_KAFKA_HOME/kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list $KAFKA_URL --topic $1 --time -1 --offsets 1 | awk -F  ":" '{sum += $3} END {print sum}'
}
dt_increase_partitions() {
	$docker exec -it $DOCKER_CONTAINER_NAME $DOCKER_KAFKA_HOME/kafka-topics.sh --alter --zookeeper $ZOOKEEPER_URL --topic $1 --partitions $2
}
dt_get_first() {
	$docker exec -it $DOCKER_CONTAINER_NAME $DOCKER_KAFKA_HOME/kafka-console-consumer.sh --bootstrap-server $KAFKA_URL --topic $1 --from-beginning --max-messages 1
	# docker exec -it kafka $DOCKER_KAFKA_HOME/kafka-simple-consumer-shell.sh --broker-list $DOCKER_KAFKA_URL --topic $1 --partition $2 --offset $3
}
dt_get_last() {
	$docker exec -it $DOCKER_CONTAINER_NAME $DOCKER_KAFKA_HOME/kafka-simple-consumer-shell.sh --broker-list $KAFKA_URL --topic $1 --partition $2 --offset $3
}
# see topics by groups
dg_ls() {
	$docker exec -it $DOCKER_CONTAINER_NAME $DOCKER_KAFKA_HOME/kafka-consumer-groups.sh --bootstrap-server $KAFKA_URL --list
}
klg_ls() {
	$KAFKA_HOME/kafka-consumer-groups.sh --bootstrap-server $KAFKA_URL --list
}
dg_info() {
	$docker exec -it $DOCKER_CONTAINER_NAME $DOCKER_KAFKA_HOME/kafka-consumer-groups.sh --bootstrap-server $KAFKA_URL --group $1 --describe
}
klg_info() {
	$KAFKA_HOME/kafka-consumer-groups.sh --bootstrap-server $KAFKA_URL --group $1 --describe
}
dg_reset_to_beginning() {
	$docker exec -it $DOCKER_CONTAINER_NAME $DOCKER_KAFKA_HOME/kafka-consumer-groups.sh --bootstrap-server $KAFKA_URL --reset-offsets --group $1 --topic $2 --to-earliest --execute
	# --to-earliest
	# --to-latest
	# --to-offset <integer>
	# --shift-by <positive_or_negative_integer>
	# --to-datetime <datetime_string>
	# --by-duration <duration_string>
}
klg_reset_to_beginning() {
	$KAFKA_HOME/kafka-consumer-groups.sh --bootstrap-server $KAFKA_URL --reset-offsets --group $1 --topic $2 --to-earliest --execute
}
dg_reset_to_offset() {
	$docker exec -it $DOCKER_CONTAINER_NAME $DOCKER_KAFKA_HOME/kafka-consumer-groups.sh --bootstrap-server $KAFKA_URL --reset-offsets --group $1 --topic $2 --to-offset $3 --execute
}
klg_reset_to_offset() {
	$KAFKA_HOME/kafka-consumer-groups.sh --bootstrap-server $KAFKA_URL --reset-offsets --group $1 --topic $2 --to-offset $3 --execute
}
docker_kafka_subscribe_consumer() {
  # echo Consumer is listening $TOPIC_PREFIX $1 $2
  printf "The consumer is listening %s topic \n\n" $TOPIC_PREFIX$1_$2
  $docker exec -it kafka /opt/kafka_2.11-0.10.1.0/bin/kafka-console-consumer.sh --bootstrap-server $DOCKER_KAFKA_URL --topic $TOPIC_PREFIX$1_$2
}
dkscd() {
  docker_kafka_subscribe_consumer $1 Data
}
dkscc() {
  docker_kafka_subscribe_consumer $1 Changes
}
kt_create() {
	$KAFKA_HOME/bin/kafka-topics.sh --create --bootstrap-server $KAFKA_URL --replication-factor 1 --partitions $2 --topic $1
}
lk_ls() {
	$LOCAL_KAFKA/kafka-topics.sh --list --bootstrap-server $KAFKA_URL
}
lk_t_create() {
	$LOCAL_KAFKA/kafka-topics.sh --create --bootstrap-server $KAFKA_URL --replication-factor 1 --partitions $2 --topic $1
}
lk_t_info() {
	$LOCAL_KAFKA/kafka-topics.sh --describe --bootstrap-server $KAFKA_URL --topic $1
}
lk_t_count() {
	$LOCAL_KAFKA/kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list $KAFKA_URL --topic $1 --time -1 --offsets 1
}
lk_t_delete() {
	$LOCAL_KAFKA/kafka-topics.sh --zookeeper $LOCAL_ZOOKEEPER_URL --delete --topic $1
}
lk_t_producer() {
	$LOCAL_KAFKA/kafka-console-producer.sh --broker-list $LOCAL_KAFKA_URL --topic $1
}
lk_t_consumer() {
	$LOCAL_KAFKA/kafka-console-consumer.sh --bootstrap-server $KAFKA_URL --topic $1 --from-beginning --property print.timestamp=true --property print.offset=true
}
lk_g_ls() {
	$LOCAL_KAFKA/kafka-consumer-groups.sh  --list --bootstrap-server $KAFKA_URL
}
lk_g_offsets() {
	$LOCAL_KAFKA/kafka-consumer-groups.sh  --describe --group $1 --bootstrap-server $KAFKA_URL
}
lk_g_reset() {
	$LOCAL_KAFKA/kafka-consumer-groups.sh  --bootstrap-server $KAFKA_URL --reset-offsets --group $1 --topic $2 --to-offset $3 --execute
}

# usefull alias for git commands
# info
# git config --list # to list git configuration
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
git_cie() {
	git ci --allow-empty -m $1
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
alias gift='git fetch --tags'
alias git_tag_add='git tag $1'
alias git_tag_rm='git tag -d $1'
alias git_tag_rm_r='git push --delete origin $1'
alias gt_ls='git tag -l'
alias gifb='git fetch origin $branch'
alias gpr='git pull --rebase origin $(git symbolic-ref HEAD 2> /dev/null | cut -b 12-)'
alias grp='git rp'
alias grpt='git push origin --tags'
alias git_tag_ls_r='git ls-remote --tags origin'
alias grpf='git push -f origin $(git symbolic-ref HEAD 2> /dev/null | cut -b 12-)'
alias grb='git branch -D $branch'
alias grrb='git push origin :$(git symbolic-ref HEAD 2> /dev/null | cut -b 12-)'
alias gruo='git remote update origin --prune'
alias gr_info='git remote -v'
alias gr_add='git remote add origin $1'
alias gr_rm='git remote rm origin'
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
alias git_reset_lc_s='git reset --soft HEAD~1'
alias grlc='git reset HEAD^'
alias grst='git reset HEAD $path'
alias git_reset_delited='git checkout HEAD $1'
# stash
alias gst='git stash'
alias gstm='git stash save $message'
alias gsta='git stash apply stash@\{$number\}'
alias gstl='git stash list'
alias gust='git stash pop'
# difference
alias git_diff_c='git diff $1 $2' # to get diff between 2 different commits
git_diff() {
  git diff $1..$2 # to get diff between 2 branches
}
# reset files
git_reset_file() {
  git checkout $1 -- $2 # 1 - branch or commit that file should be reseted to; 2 - path to file
}
# gerrit
alias ggr='git review franchise'

alias reslint='eslint . -c $CAR/.eslintrc.json'
alias rfeslint='eslint . --fix -c $CAR/.eslintrc.json'

# Aliases for JMIR
alias sso='docker exec -it jmir_SSO_1 "$@"'
alias run_corporate='docker run --platform linux/amd64 -d -it -p 1234:3000 --name=corporate jmir-corporate'
alias dev_go='ssh -i ~/dev_local.pem ubuntu@ec2-3-12-60-1.us-east-2.compute.amazonaws.com'
# alias dev_cp_from2='scp -i ~/dev_local.pem ubuntu@2-3-12-60-1.us-east-2.compute.amazonaws.com:$file $path'
dev_cp_from() {
	scp -i ~/dev_local.pem ubuntu@ec2-3-12-60-1.us-east-2.compute.amazonaws.com:$0 $1
}
dev_cp_to() {
	scp -i ~/dev_local.pem $0 ubuntu@ec2-3-12-60-1.us-east-2.compute.amazonaws.com:$1
}
# alias dev_cp_to2='scp -i ~/dev_local.pem ./$file ubuntu@2-3-12-60-1.us-east-2.compute.amazonaws.com:$path'

# SOME ALIASES FOR NODE.JS
alias http_server_run='http-server ./dist -p $1'

# SOME ALIASES FOR NPM
# npm install --timing # to generate a npm-debug.log for installing packages
# npm publish --timing # to generate a npm-debug.log for publishing packages
# Troubleshooting
# npm install -verbose # to get more details when something can't be installed
# npm config set tmp /path/to/big/drive/tmp # to set tmp folder in custom place
# npm config ls -l # to list node configuration
alias ncl='npm config list'
alias npm_cc='npm cache clean' # some strange issues can be resolved by running this command
alias nci='np && ncc && ni'
alias ni_e='npm install --save --save-exact $1'
alias ni='npm install --no-package-lock'
alias ni_ci='npm ci'
alias npm_init='npm init -y'
# latest minor version of 3.x version => npm i package@"<4.0.0"
alias nif='rm -rf ./node_modules && npm install --no-package-lock'
alias npm_ls='npm list --depth=${1:-0}' # linux command
alias npm_ls_g='npm list -g --depth=${1:-0}' # linux command
alias npm_update='npm install -g npm'
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
# alias n_cv='npm view $1 versions'
alias npm_package_lv='npm show $1 version'
npm_check_version() {
  npm view $1 versions
}
alias n_publish='npm publish'
alias n_unpublish='npm unpublish $1'
# to deprecate some published versions
# npm deprecate @dat/node-oas-api@2.5.1 "Version no longer supported. Upgrade to @2.5.2"
alias nvd='npm version'
# npm version patch # updates patch version and commits changes in git
# npm version minor
# npm version major
# alias nt='node ./run_tests.js'
alias nta='karma start --single-run'
alias npm_ld='npm link' # to link package
# link package by name without version nla @dat/node-oas-api
alias npm_lp='npm link $1' # to use linked package
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
