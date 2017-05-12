#!/bin/bash
# installs to /opt/gradle
# existing versions are not overwritten/deleted
# seamless upgrades/downgrades
# $GRADLE_HOME points to latest *installed* (not released)
gradle_version=3.4.1
mkdir /opt/gradle
wget -N http://services.gradle.org/distributions/gradle-${gradle_version}-bin.zip
unzip -oq ./gradle-${gradle_version}-bin.zip -d /opt/gradle
ln -sfnv gradle-${gradle_version} /opt/gradle/latest
printf "export GRADLE_HOME=/opt/gradle/latest\nexport PATH=\$PATH:\$GRADLE_HOME/bin" > /etc/profile.d/gradle.sh
. /etc/profile.d/gradle.sh
rehash ; sync
# check installation
export PATH=$PATH:/opt/gradle/gradle-3.4.1/bin
gradle -v
