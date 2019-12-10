pwd

rm -rf /root/smaug

mkdir /root/smaug -p
cd /root/smaug

which python3
if [ $? -eq 1 ]
then
    echo "no python3 found, will try to install python3"
    sudo yum install -y python36
else
    echo 'check python3 ################################## Yes'
fi


which pip 
if [ $? -eq 1 ]
then
    echo "no pip found, will try to install pip"
    # install pip
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py
else
    echo 'check pip ################################## Yes'
fi

which virtualenv
if [ $? -eq 1 ]
then
    echo "no virtualenv found, will try to install virtualenv"
    # 安装 virtualenv
    pip3 install virtualenv
else
    echo 'check virtualenv ################################## Yes'
fi

which git 
if [ $? -eq 1 ]
then
    echo "no git found, will try to install git"
    yum install -y git
else
    echo 'check git ################################## Yes'
fi

git clone https://github.com/smaugx/top-argus-agent
echo 'clone top-argus-agent ################################## Ok'

cd top-argus-agent
virtualenv  -p python3 vvlinux
source  vvlinux/bin/activate
pip install -r requirements.txt

echo ""
echo "###################everything ready for agent, will start agent####################"
echo ""

cd agent
nohup python argus_agent.py -a 127.0.0.1:9090 -f ./xtop.log > /dev/null & 2>&1
echo "done start"