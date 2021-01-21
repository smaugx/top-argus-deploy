sh ./stop.sh

cd /home/topuser/smaug/top-argus-agent/
source  vvlinux/bin/activate
python3  main.py -a $1 -f $2
echo "done start"
