sh ./stop.sh

cd /home/topuser/smaug/top-argus-agent/
source  vvlinux/bin/activate
cd agent
#nohup python argus_agent.py -a 127.0.0.1:9090 -f ./xtop.log > /dev/null & 2>&1
nohup python argus_agent.py -a $1 -f $2 > /dev/null & 2>&1
echo "done start"
