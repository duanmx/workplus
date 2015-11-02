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
echo " registry config"
if [ -n "$RZ_HOST" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/registry\.zkservers.*$/registry.zkservers=$RZ_HOST:$RZ_PORT/g"
fi
if [ -n "$RZ_NAMESPACE" ];then
find ./ -name "application.properties" | uniq | xargs sed -i "s/registry\.namespace.*$/registry.namespace=$RZ_NAMESPACE/g"
fi
echo "config transport ..."
find ./ -name "application.properties" | uniq | xargs sed -i "s/transport\.socket\.access\.endpoint*$/transport.socket.access.endpoint=socket:\/\/$SOCKET_HOST:$SOCKET_PORT?service.protocol=dubbo&service.host=$SERVICE_HOST&service.port=$SERVICE_PORT&platforms=android,ios&weight=-1&version=1.0.0&idle.init.timeout=60&idle.timeout=240&idle.period=60&traffic.limit=65536&traffic.check.interval=16000/g"
find ./ -name "application.properties" | uniq | xargs sed -i "s/transport\.websocket\.access\.endpoint*$/transport.websocket.access.endpoint=socket:\/\/$WEB_SOCKET_HOST:$WEB_SOCKET_PORT?service.protocol?service.protocol=dubbo&service.host=$SERVICE_HOST&service.port=$SERVICE_PORT&platforms=android,ios&weight=-1&version=1.0.0&idle.init.timeout=60&idle.timeout=240&idle.period=60&traffic.limit=65536&traffic.check.interval=16000/g"

