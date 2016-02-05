#!/bin/sh
export HM_HOME=/opt/hm
export LD_LIBRARY_PATH=$HM_HOME/lib
$HM_HOME/bin/lighttpd -f /opt/hm/etc/lighttpd/lighttpd.conf -m /opt/hm/lib/lighttpd/
$HM_HOME/bin/rfd -d -l 0 -f /opt/hm/etc/config/rfd.conf 
$HM_HOME/bin/ReGaHss -l 0 -f /opt/hm/etc/rega.conf&
java -Xmx32m -Dlog4j.configuration=file:///etc/config/log4j.xml -Dfile.encoding=ISO-8859-1 -jar /opt/HMServer/HMServer.jar
