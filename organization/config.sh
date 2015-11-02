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
if [ -n "$RZ_HOST" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/registry\.zkservers.*$/registry.zkservers=$RZ_HOST:$RZ_PORT/g"
fi
if [ -n "$BASE_LOCK_PATH" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/baseLockPath.*$/baseLockPath=$BASE_LOCK_PATH/g"
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
if [ -n "$REDIS_DATABASE" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/redis\.database.*$/redis.database=$REDIS_DATABASE/g"
fi
echo "config mysql ..."
if [ -n "$MYSQL_HOST" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/jdbc\.url.*$/jdbc.url=jdbc\:mysql\:\/\/$MYSQL_HOST\:$MYSQL_PORT\/atwork_level?createDatabaseIfNotExist=true\&useUnicode=true\&characterEncoding=UTF-8/g"
fi
if [ -n "$MYSQL_USER" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/jdbc\.username.*$/jdbc.username=$MYSQL_USER/g"
fi
if [ -n "$MYSQL_PASS" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/jdbc\.password.*$/jdbc.password=$MYSQL_PASS/g"
fi
echo "config org root ..."
if [ -n "$ROOT_ATWORK" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/root\.atwork.*$/root.atwork=$ROOT_ATWORK/g"
fi
if [ -n "$ROOT_NAME" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/root\.name.*$/root.name=$ROOT_NAME/g"
fi
