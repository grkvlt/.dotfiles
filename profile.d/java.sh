##
# java setup
##

JAVA_1_7_0="jdk1.7.0_45.jdk"
#OPENJDK_1_7="openjdk-1.7-x86_64"
#OPENJDK_1_8="openjdk-1.8-x86_64"

# To change JDK version requires more than just an environment variable ;(
JAVA_HOME="/Library/Java/JavaVirtualMachines/${JAVA_1_7_0}/Contents/Home"
#JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
JAVA_OPTS="-Xms400m -Xmx800m -XX:MaxPermSize=200m"
# XXX This JAVA_OPTS setting is from Avi Vachnis at ALU for use during ALU CloudBand testing
#JAVA_OPTS="-Xms1g -Xmx4g -XX:PermSize=256m -XX:MaxPermSize=512m -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:+CMSClassUnloadingEnabled"
export JAVA_HOME JAVA_OPTS

ANT_HOME=" /opt/local/share/java/ant"
ANT_OPTS="-Xms400m -Xmx800m -XX:MaxPermSize=200m"
#ANT_OPTS="${JAVA_OPTS}"
export ANT_HOME ANT_OPTS

MAVEN_HOME="/opt/local/share/java/maven3"
M2_HOME="${MAVEN_HOME}"
#MAVEN_OPTS="-Xms1g -Xmx2g -XX:MaxPermSize=500m -Dmaven.javadoc.skip=true"
#MAVEN_OPTS="${JAVA_OPTS}"
MAVEN_OPTS="-Xms1g -Xmx2g -XX:MaxPermSize=500m"
M2_OPTS="${MAVEN_OPTS}"
export MAVEN_HOME MAVEN_OPTS M2_HOME m2_OPTS

# vim:ts=4:sw=4
