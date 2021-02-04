kill -9 `ps -ef |grep argus |grep -v grep |awk -F ' ' '{print $2}'`
