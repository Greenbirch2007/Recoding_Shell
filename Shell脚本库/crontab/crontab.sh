#! /bin/bash

# crontab执行脚本时是不带任何环境变量的，用sh测试正常运行的脚本在布置成crontab定时任务后不一定能正常执行，
#需要在脚本里写设置环境变量的代码，并设置好脚本的工作目录。

export BASE_DIR=$HOME/test/softmon
passfile=$BASE_DIR/pass.conf
. $HOME/.bash_profile
cd $BASE_DIR