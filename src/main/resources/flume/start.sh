#!/usr/bin/env bash
if [ $# != 2 ];then
  echo "Usage: <conf-file> <agent>";
  exit 1;
fi
#从环境变量中获取flume的安装目录
FLUME_HOME=${FLUME_HOME}

if [ $FLUME_HOME == null ];then
    echo "please set FLUME_HOME env";
  exit 1;
fi
# nohup flume-ng agent --conf-file flume-kafka.properties --name dpi-agent --conf /usr/local/apache-flume-1.9.0-bin/conf  &
sh flume-ng agent --conf-file $1 --name $2 --conf $FLUME_HOME/conf -Dflume.root.logger=INFO,console
