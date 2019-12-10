kill -9 `ps -ef |grep argus_agent.py |grep -v grep |awk -F ' ' '{print $2}'`
