##
# java setup
##

JAVA_1_6_0="1.6.0_22-b04-307.jdk"
JAVA_1_7_0="1.7.0.jdk"
OPENJDK_1_7="openjdk-1.7-x86_64"
OPENJDK_1_8="openjdk-1.8-x86_64"

# To change JDK version requires more than just an environment variable ;(
#JAVA_HOME="/Library/Java/JavaVirtualMachines/${JAVA_1_7_0}/Contents/Home"
JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
JAVA_OPTS="-Xms400m -Xmx800m -XX:MaxPermSize=200m"
export JAVA_HOME JAVA_OPTS

ANT_HOME="/usr/share/ant"
ANT_OPTS="-Xms400m -Xmx800m -XX:MaxPermSize=200m"
export ANT_HOME ANT_OPTS

MAVEN_HOME="/usr/share/maven"
MAVEN_OPTS="-Xms800m -Xmx1600m -XX:MaxPermSize=400m -Dmaven.javadoc.skip=true"
export MAVEN_HOME MAVEN_OPTS
