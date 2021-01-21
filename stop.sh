kill -9 `ps -ef |grep topargus-agent |grep -v grep |awk -F ' ' '{print $2}'`
