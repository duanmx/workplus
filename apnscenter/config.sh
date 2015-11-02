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

echo "config apns.properties"
if [ -n "$CERT_PATH" ];then
find ./ -name "apns.properties" | uniq | xargs sed -i "s/cert\.path.*$/cert.path=$CERT_PATH/g"
fi
if [ -n "$CERT_PASSWORD" ];then
find ./ -name "apns.properties" | uniq | xargs sed -i "s/cert\.password.*$/cert.password=$CERT_PASSWORD/g"
fi
if [ -n "$CERT_SANDBOX" ];then
find ./ -name "apns.properties" | uniq | xargs sed -i "s/cert\.sandbox.*$/cert.sandbox=$CERT_SANDBOX/g"
fi
if [ -n "$MSG_DEFAULT" ];then
find ./ -name "apns.properties" | uniq | xargs sed -i "s/msg\.default.*$/msg.default=$MSG_DEFAULT/g"
fi
if [ -n "$MSG_TXT" ];then
find ./ -name "apns.properties" | uniq | xargs sed -i "s/msg\.text.*$/msg.text=$MSG_TXT/g"
fi
if [ -n "$MSG_IMAGE" ];then
find ./ -name "apns.properties" | uniq | xargs sed -i "s/msg\.image.*$/msg.image=$MSG_IMAGE/g"
fi
if [ -n "$MSG_VOICE" ];then
find ./ -name "apns.properties" | uniq | xargs sed -i "s/msg\.voice.*$/msg.voice=$MSG_VOICE/g"
fi
if [ -n "$MSG_VIDEO" ];then
find ./ -name "apns.properties" | uniq | xargs sed -i "s/msg\.video.*$/msg.video=$MSG_VIDEO/g"
fi
if [ -n "$MSG_FILE" ];then
find ./ -name "apns.properties" | uniq | xargs sed -i "s/msg\.file.*$/msg.file=$MSG_FILE/g"
fi
if [ -n "$MSG_ARTICLE" ];then
find ./ -name "apns.properties" | uniq | xargs sed -i "s/msg\.article.*$/msg.article=$MSG_ARTICLE/g"
fi
if [ -n "$PUSH_QUEUED" ];then
find ./ -name "apns.properties" | uniq | xargs sed -i "s/push\.queued.*$/push.queued=$PUSH_QUEUED/g"
fi
if [ -n "$PUSH_CONNECTIONS" ];then
find ./ -name "apns.properties" | uniq | xargs sed -i "s/push\.connections.*$/push.connections=$PUSH_CONNECTIONS/g"
fi