#!/bin/bash
source /etc/profile
cd `dirname $0`
BIN_DIR=`pwd`
cd ..
DEPLOY_DIR=`pwd`
ETC_DIR=$DEPLOY_DIR/etc

PIDS=`ps  --no-heading -C java -f --width 1000 | grep "$ETC_DIR" |awk '{print $2}'`
if [ -n "$PIDS" ]; then
    echo "ERROR: serveplatform has been started!"
    echo "PID: $PIDS"
    exit 1
fi

LOGS_DIR=$DEPLOY_DIR/logs
if [ ! -d $LOGS_DIR ]; then
	mkdir $LOGS_DIR
fi
STDOUT_FILE=$LOGS_DIR/serveplatform.log

LIB_DIR=$DEPLOY_DIR/lib
LIB_JARS=`ls $LIB_DIR|grep .jar|awk '{print "'$LIB_DIR'/"$0}'|tr "\n" ":"`

JAVA_OPTS=" -Djava.awt.headless=true -Djava.net.preferIPv4Stack=true "
JAVA_DEBUG_OPTS=""
if [ "$1" = "debug" ]; then
    JAVA_DEBUG_OPTS=" -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n "
fi
JAVA_JMX_OPTS=""
if [ "$1" = "jmx" ]; then
    JAVA_JMX_OPTS=" -Dcom.sun.management.jmxremote.port=1099 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false "
fi
JAVA_MEM_OPTS=""
let memTotal=`cat /proc/meminfo |grep MemTotal|awk '{printf "%d", $2/1024 }'`
if [ $memTotal -gt 4000 ];then
    JAVA_MEM_OPTS=" -server -Xmx4g -Xms2g -Xmn256m -Xss256k "
elif [ $memTotal -gt 2000 ];then
    JAVA_MEM_OPTS=" -server -Xmx2g -Xms1g -Xmn256m -Xss256k "
else
    JAVA_MEM_OPTS=" -server -Xmx1g -Xms1g -Xmn256m -Xss256k "
fi

echo -e "starting serveplatform ...\c"
java $JAVA_OPTS $JAVA_MEM_OPTS $JAVA_DEBUG_OPTS $JAVA_JMX_OPTS -cp $ETC_DIR:$LIB_JARS io.atwork.serveplatform.bootstrap.ServePlatformBootstrap

