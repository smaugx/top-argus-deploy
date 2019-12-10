# top-argus-deploy
deploy scripts and tools for [top-argus](https://github.com/smaugx/top-argus)

[argus-agent](https://github.com/smaugx/top-argus-agent)


# How TO Deploy?
+ clone repo

```
git clone https://github.com/smaugx/top-argus-deploy.git
```

+ put yourself host file in top-argus-deploy directory

```
cd top-argus-deploy
cp [yourself_host_file] ./ 
cd ../
```

+ create tar.gz and using ansible copy to your hosts

```
ansible -i host  all -m copy "src=./top-argus-deploy.tar.gz /root/"
```

+ Install the dependencies And Be Ready for agent

```
ansible -i host  all -m shell -a "cd /root && tar zxvf top-argus-deploy.tar.gz && cd top-argus-deploy && sh deploy.sh"
```