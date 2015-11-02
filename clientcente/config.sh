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
if [ -n "$EMAIL_HOST" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/email\.host.*$/email.host=$EMAIL_HOST/g"
fiif [ -n "$EMAIL_PORT" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/email\.port.*$/email.port=$EMAIL_PORT/g"
fiif [ -n "$EMAIL_USERNAME" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/email\.username.*$/email.username=$EMAIL_USERNAME/g"
fiif [ -n "$EMAIL_PASSWORD" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/email\.password.*$/email.password=$EMAIL_PASSWORD/g"
fi