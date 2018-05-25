##
# Java Configuration
#
# Copyright 2011-2015 by Andrew Donald Kennedy; All Rights Reserved.
##

##
# Java
##
# To change JDK version requires setting the JAVA_HOME environment variable
#JAVA_VERSION="1.7.0_b20111119.jdk"
#JAVA_VERSION="jdk1.7.0_60.jdk"
#JAVA_VERSION="jdk1.7.0_71.jdk"
#JAVA_VERSION="jdk1.8.0_05.jdk"
#JAVA_VERSION="jdk1.8.0_25.jdk"
JAVA_VERSION="jdk1.8.0_131.jdk"
#JAVA_VERSION="openjdk_1.7.0_u60.jdk"
JAVA_HOME="/Library/Java/JavaVirtualMachines/${JAVA_VERSION}/Contents/Home"
#JAVA_OPTS="-Xms1g -Xmx1g -XX:MaxPermSize=300m -verbosegc"
JAVA_OPTS="-Xms1g -Xmx4g"
#JAVA_OPTS="-Xms400m -Xmx800m -XX:MaxPermSize=200m"
#JAVA_OPTS="-Xms1g -Xmx4g -XX:PermSize=256m -XX:MaxPermSize=512m -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:+CMSClassUnloadingEnabled"
JAVA_6_DEBUG_OPTS="-agentlib:jdwp=transport=dt_socket,address=127.0.0.1:8888,server=y,suspend=n"
JAVA_7_DEBUG_OPTS="-Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=8888,suspend=n -verbosegc"
JAVA_8_DEBUG_OPTS="${JAVA_7_DEBUG_OPTS}"
export JAVA_VERSION JAVA_HOME JAVA_OPTS JAVA_6_DEBUG_OPTS JAVA_7_DEBUG_OPTS JAVA_8_DEBUG_OPTS

##
# Ant
##
ANT_HOME=" /opt/local/share/java/ant"
ANT_OPTS="-Xms400m -Xmx800m -XX:MaxPermSize=200m"
#ANT_OPTS="${JAVA_OPTS}"
export ANT_HOME ANT_OPTS

##
# Maven
##
MAVEN_HOME="/opt/local/share/java/maven3"
M2_HOME="${MAVEN_HOME}"
#MAVEN_OPTS="-Xms1g -Xmx2g -XX:MaxPermSize=500m -Dmaven.javadoc.skip=true"
#MAVEN_OPTS="${JAVA_OPTS}"
MAVEN_OPTS="-Xms4g -Xmx8g"
M2_OPTS="${MAVEN_OPTS}"
export MAVEN_HOME MAVEN_OPTS M2_HOME M2_OPTS

# vim:ts=4:sw=4
