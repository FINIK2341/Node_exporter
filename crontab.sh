set -e
user=`whoami`
SCRIPTS_HOME=/home/$user/monitoring/node_exporter
script="node_exporter"
pushd $SCRIPTS_HOME >/dev/null

# Проверка, запущен ли скрипт
pid=$(ps -ef | grep "$script" | grep -v grep | grep -v /bin/sh | awk '{print $2}')
if [ -z "$pid" ] ; then
	echo "Script <$script> appears to be down. Attempting to start!"
	nohup $SCRIPTS_HOME/start.sh < /dev/null > /dev/null 2>&1
	rc=$?
	echo "Script <$script> started with RETVAL=$rc"
else
	echo "Script <$script> is alive"
fi

popd > /dev/null

