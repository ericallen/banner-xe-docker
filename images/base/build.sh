#!/bin/bash

TOMCAT7=7.0.75
JAVA7=7u79
TOMCAT8=8.0.41
JAVA8=8u121

echo "Building XE-BASE-SS Oracle Linux 6 & Tomcat7 & Java 7"
docker build -t ericallen/xe-base-ss:ol6-tomcat7-java7 -t ericallen/xe-base-ss:ol6-tomcat${TOMCAT7}-java${JAVA7}  base-ss/oracle6-tomcat7-java7/.
docker push ericallen/xe-base-ss:ol6-tomcat7-java7
docker push ericallen/xe-base-ss:ol6-tomcat${TOMCAT7}-java${JAVA7}

echo "Building XE-BASE-SS Oracle Linux 6 & Tomcat8 & Java 8"
docker build -t ericallen/xe-base-ss:ol6-tomcat8-java8 -t ericallen/xe-base-ss:ol6-tomcat${TOMCAT8}-java${JAVA8} base-ss/oracle6-tomcat8-java8/.
docker push ericallen/xe-base-ss:ol6-tomcat8-java8
docker push ericallen/xe-base-ss:ol6-tomcat${TOMCAT8}-java${JAVA8}

echo "Building XE-BASE-SS Alpine & Tomcat7 & Java 7"
docker build -t ericallen/xe-base-ss:alpine-tomcat7-java7 -t ericallen/xe-base-ss:alpine-tomcat${TOMCAT7}-java${JAVA7} base-ss/alpine-tomcat7-java7/.
docker push ericallen/xe-base-ss:alpine-tomcat7-java7
docker push ericallen/xe-base-ss:alpine6-tomcat${TOMCAT7}-java${JAVA7}

echo "Building XE-BASE-SS Alpine & Tomcat8 & Java 8"
docker build -t ericallen/xe-base-ss:alpine-tomcat8-java8 -t ericallen/xe-base-ss:alpine-tomcat${TOMCAT8}-java${JAVA8} base-ss/alpine-tomcat8-java8/.
docker push ericallen/xe-base-ss:alpine-tomcat8-java8
docker push ericallen/xe-base-ss:alpine-tomcat${TOMCAT8}-java${JAVA8}

echo "Building XE-BASE-ADMIN Oracle Linux 6 & Tomcat 7 & Java 7"
docker build -t ericallen/xe-base-admin:ol6-tomcat7-java7 -t ericallen/xe-base-admin:ol6-tomcat${TOMCAT7}-java${JAVA7} base-admin/oracle6-tomcat7-java7/.
docker push ericallen/xe-base-admin:ol6-tomcat7-java7
docker push ericallen/xe-base-admin:ol6-tomcat${TOMCAT7}-java${JAVA7}

echo "Building XE-BASE-ADMIN Oracle Linux 6 & Tomcat 8 & Java 8"
docker build -t ericallen/xe-base-admin:ol6-tomcat8-java8 -t ericallen/xe-base-admin:ol6-tomcat${TOMCAT8}-java${JAVA8} base-admin/oracle6-tomcat8-java8/.
docker push ericallen/xe-base-admin:ol6-tomcat8-java8
docker push ericallen/xe-base-admin:ol6-tomcat${TOMCAT8}-java${JAVA8}

echo "Building XE-BASE-ADMIN Alpine & Tomcat 7 & Java 7"
docker build -t ericallen/xe-base-admin:alpine-tomcat7-java7 -t ericallen/xe-base-admin:alpine-tomcat${TOMCAT7}-java${JAVA7} base-admin/alpine-tomcat7-java7/.
docker push ericallen/xe-base-admin:alpine-tomcat7-java7
docker push ericallen/xe-base-admin:alpine-tomcat${TOMCAT7}-java${JAVA7}

echo "Building XE-BASE-ADMIN Alpine & Tomcat 8 & Java 8"
docker build -t ericallen/xe-base-admin:alpine-tomcat8-java8 -t ericallen/xe-base-admin:alpine-tomcat${TOMCAT8}-java${JAVA8}  base-admin/alpine-tomcat8-java8/.
docker push ericallen/xe-base-admin:alpine-tomcat8-java8
docker push ericallen/xe-base-admin:alpine-tomcat${TOMCAT8}-java${JAVA8}
