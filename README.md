# top-argus-deploy
deploy scripts and tools for [top-argus](https://github.com/smaugx/top-argus)

[argus-agent](https://github.com/smaugx/top-argus-agent)


# How TO Deploy?
+ clone repo

```
git clone https://github.com/smaugx/top-argus-deploy.git
```

+ create tar.gz and using ansible copy to your hosts

```
tar zcvf top-argus-deploy.tar.gz top-argus-deploy
ansible -i host  all -m copy -a "src=./top-argus-deploy.tar.gz dest=/root/"
```

+ Install the dependencies And Be Ready for agent

```
ansible -i host  all -m shell -a "cd /root && tar zxvf top-argus-deploy.tar.gz && cd top-argus-deploy && sh install.sh"
```

+ start the agent

```
ansible -i host  all -m shell -a "cd /root/top-argus-deploy && sh start.sh 127.0.0.1:9090 ./xtop.log"    
```

+ stop the agent

```
ansible -i host  all -m shell -a "cd /root/top-argus-deploy && sh stop.sh"    
```

+ restart the agent

```
ansible -i host  all -m shell -a "cd /root/top-argus-deploy && sh restart.sh 127.0.0.1:9090 ./xtop.log"    
```
