#!/bin/bash

echo "config dubbo ..."
if [ -n "$DUBBO_HOST" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/dubbo\.protocol\.host.*$/dubbo.protocol.host=$DUBBO_HOST/g"
fi
if [ -n "$DUBBO_PORT" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/dubbo\.protocol\.port.*$/dubbo.protocol.port=$DUBBO_PORT/g"
fi
if [ -n "$ZK_HOST" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/dubbo\.registry.*$/dubbo.registry=zookeeper:\/\/$ZK_HOST:$ZK_PORT/g"
fi
echo "config mysql ..."
if [ -n "$MYSQL_PORT" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/jdbc\.url.*$/jdbc.url=jdbc\:mysql\:\/\/$MYSQL_HOST\:$MYSQL_PORT\/atwork_level?createDatabaseIfNotExist=true\&useUnicode=true\&characterEncoding=UTF-8/g"
fi
if [ -n "$MYSQL_USER" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/jdbc\.username.*$/jdbc.username=$MYSQL_USER/g"
fi
if [ -n "$MYSQL_PASS" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/jdbc\.password.*$/jdbc.password=$MYSQL_PASS/g"
fi