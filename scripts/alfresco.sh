#!/bin/bash
# -------
# Script for starting Alfresco service with enough memory
# 
# Copyright 2014 Sokie
# -------
ALF_HOME=/opt/alfresco
cd "$ALF_HOME"
APPSERVER="${ALF_HOME}/tomcat"
export CATALINA_HOME="$APPSERVER"

# Set any default JVM values
export JAVA_OPTS='-Xms512m -Xmx768m -Xss768k -XX:MaxPermSize=256m -XX:NewSize=256m -server'
export JAVA_OPTS="${JAVA_OPTS} -Dalfresco.home=${ALF_HOME} -Dcom.sun.management.jmxremote"

if [ "$1" = "start" ]; then
 "${APPSERVER}/bin/startup.sh"
elif [ "$1" = "stop" ]; then
 "${APPSERVER}/bin/shutdown.sh"
 killall -u alfresco java
fi
