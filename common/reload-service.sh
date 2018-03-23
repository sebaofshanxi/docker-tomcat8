#!/bin/bash

rm -fr /opt/tomcat/work/Catalina/localhost/$1
oldpid=`ps aux|grep /usr/lib/jvm/java-8-oracle/bin/java|grep -v grep|awk '{print $2}'`
echo ">>> tomcat 停止 pid $oldpid "

/opt/tomcat/bin/shutdown.sh
ps aux|grep /usr/lib/jvm/java-8-oracle/bin/java|grep -v grep|awk '{print $2}'|xargs -i kill -9 {}
rm -rf /opt/tomcat/webapps/$1/
/opt/tomcat/bin/startup.sh
newpid=`ps aux|grep /usr/lib/jvm/java-8-oracle/bin/java|grep -v grep|awk '{print $2}'`
echo ">>> tomcat启动, pid $newpid"