#!/bin/bash

pwd
sh ./stop.sh

rm -rf /home/topuser/smaug

mkdir /home/topuser/smaug -p
cd /home/topuser/smaug

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
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && sudo python3 get-pip.py
else
    echo 'check pip ################################## Yes'
fi

which virtualenv
if [ $? -eq 1 ]
then
    echo "no virtualenv found, will try to install virtualenv"
    # 安装 virtualenv
    ret_pip3=`which pip3`
    sudo $ret_pip3  install virtualenv
else
    echo 'check virtualenv ################################## Yes'
fi

which git 
if [ $? -eq 1 ]
then
    echo "no git found, will try to install git"
    sudo yum install -y git
else
    echo 'check git ################################## Yes'
fi

ls top-argus-agent
if [ $? -eq 0 ]
then
    echo "found top-argus-agent dir"
    if [ $# -ne 1]
    then
        echo "using non-force mode, will exit"
        exit 0
    fi

    if [ $1 != '-f' ]
    then
        echo "param invalid:$1, will exit"
        exit 0
    fi

    echo "using -f(force) mode, will reinstall top-argus-agent..."
else
    echo "not found top-argus-agent dir, will install top-argus-agent..."
fi

rm -rf top-argus-agent
git clone https://github.com/smaugx/top-argus-agent
echo 'clone top-argus-agent ################################## Ok'

cd top-argus-agent
ret_vir=`which virtualenv`
ret_py3=`which python3`
$ret_vir -p $ret_py3 vvlinux
source  vvlinux/bin/activate
pip install -r requirements.txt

echo ""
echo "###################everything ready for agent####################"
echo "done deploy"
echo ""
