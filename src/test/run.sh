##!/usr/bin/env bash
#!/bin/bash
cd $(dirname $0)

#cd ../complete

mvn install-file
-Dfile="gs-accessing-data-mysql-0.1.0.jar"
-DgroupId="org.springframework"
-DartifactId="gs-mysql-data"
-Dversion="0.1.0"
-Dpackaging="jar"
-DlocalRepositoryPath="lib"

mvn clean package
ret=$?
if [ $ret -ne 0 ]; then
  exit $ret
fi
rm -rf target

./gradlew build
ret=$?
if [ $ret -ne 0 ]; then
  exit $ret
fi
rm -rf build

#cd ../initial

#mvn clean compile
#ret=$?
#if [ $ret -ne 0 ]; then
#  exit $ret
#fi
#rm -rf target

#./gradlew compileJava
#ret=$?
#if [ $ret -ne 0 ]; then
#  exit $ret
#fi
#rm -rf build

exit