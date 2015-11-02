#!/bin/bash
echo "config dubbo ..."
if [ -n "$DUBBO_APPLICATION" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/dubbo\.application.*$/dubbo.application=$DUBBO_APPLICATION/g"
fi
if [ -n "$DUBBO_PROTOCOL" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/dubbo\.protocol.*$/dubbo.protocol=$DUBBO_PROTOCOL/g"
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

echo "config redis ..."
if [ -n "$REDIS_NAME" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/redis\.host.*$/redis.host=$REDIS_NAME/g"
fi
if [ -n "$REDIS_PORT" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/redis\.port.*$/redis.port=$REDIS_PORT/g"
fi
if [ -n "$REDIS_DBINDEX" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/redis\.dbindex.*$/redis.dbindex=$REDIS_DBINDEX/g"
fi
if [ -n "$REDIS_EXPIRE" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/redis\.expire.*$/redis.expire=$REDIS_EXPIRE/g"
fi
if [ -n "$REDIS_TIMEOUT" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/redis\.timeout.*$/redis.timeout=$REDIS_TIMEOUT/g"
fi
if [ -n "$REDIS_PASSWORD" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/redis\.password.*$/redis.password=$REDIS_PASSWORD/g"
fi
if [ -n "$PLIST_TITLE" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/base\.url.*$/base.url=$BASE_URL/g"
fi
if [ -n "$PLIST_TITLE" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/plist\.title.*$/plist.title=$PLIST_TITLE/g"
fi