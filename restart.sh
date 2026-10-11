NAME=node_exporter
cd /home/test/monitoring/node_exporter/

pid=$(ps aux | grep -v grep | grep $NAME | awk '{print $2}')

if [ -z "$pid" ] ; then
	echo -e "\e[42m \e[0m ===>>> Proccess not found <<<==="
else
	echo "Find old process $pid. Kill old process"
	kill -9 $pid
	echo -e "\e[44m \e[0m ===>>> Proccess closed <<<==="
fi
./start.sh
