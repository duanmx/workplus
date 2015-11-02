#!/bin/bash

echo "config dubbo ..."
if [ -n "$DUBBO_APPLICATION" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/dubbo\.application.*$/dubbo.application=$DUBBO_APPLICATION/g"
fi
if [ -n "$DUBBO_HOST" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/dubbo\.protocol\.host.*$/dubbo.protocol.host=$DUBBO_HOST/g"
fi
if [ -n "$DUBBO_PORT" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/dubbo\.protocol\.port.*$/dubbo.protocol.port=$DUBBO_PORT/g"
fi
if [ -n "$ZK_HOST" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/dubbo\.registry.*$/dubbo.registry=zookeeper:\/\/$ZK_HOST:$ZK_PORT/g"
fi
echo " redis config"
if [ -n "$REDIS_HOST" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/redis\.host.*$/redis.host=$REDIS_HOST/g"
fi
if [ -n "$REDIS_PORT" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/redis\.port.*$/redis.port=$REDIS_PORT/g"
fi
if [ -n "$REDIS_PASSWORD" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/redis\.password.*$/redis.password=$REDIS_PASSWORD/g"
fi
if [ -n "$REDIS_USE_POOL" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/redis\.use-pool.*$/redis.use-pool=$REDIS_USE_POOL/g"
fi
echo "config mongodb ..."
if [ -n "$MONGO_HOST" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/mongodb\.host.*$/mongodb.host=$MONGO_HOST/g"
fi
if [ -n "$MONGO_PORT" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/mongodb\.port.*$/mongodb.port=$MONGO_PORT/g"
fi
if [ -n "$MONGO_USER" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/mongodb\.username.*$/mongodb.username=$MONGO_USER/g"
fi
if [ -n "$MONGO_PASS" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/mongodb\.password.*$/mongodb.password=$MONGO_PASS/g"
fi
if [ -n "$MONGO_DBNAME" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/mongodb\.dbname.*$/mongodb.dbname=$MONGO_DBNAME/g"
fi
if [ -n "$MONGO_WRITE_CONCERN" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/mongodb\.write-concern.*$/mongodb.write-concern=$MONGO_WRITE_CONCERN/g"
fi
if [ -n "$MONGO_CONNETIONPERHOST" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/mongodb\.options\.connectionPerHost.*$/mongodb.options.connectionPerHost=$MONGO_CONNETIONPERHOST/g"
fi
if [ -n "$MONGO_CONNETIONTIMEOUT" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/mongodb\.options\.connectionTimeout.*$/mongodb.options.connectionTimeout=$MONGO_CONNETIONTIMEOUT/g"
fi
if [ -n "$TOKEN_INTERVAL" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/token\.survival\.interval.*$/token.survival.interval=$TOKEN_INTERVAL/g"
fi
if [ -n "$TOKEN_SURVIVAL" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/ticket\.survival\.interval.*$/ticket.survival.interval=$TOKEN_SURVIVAL/g"
fi
