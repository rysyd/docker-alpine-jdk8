FROM docker.io/jeanblanchard/alpine-glibc
MAINTAINER hlwojiv

ENV LANG=C.UTF-8

ADD jre8.tar.gz /usr/java/jdk/

RUN  echo 'http://mirrors.ustc.edu.cn/alpine/v3.5/main' > /etc/apk/repositories \
 && echo 'http://mirrors.ustc.edu.cn/alpine/v3.5/community' >>/etc/apk/repositories \
 && apk update && apk add tzdata \
 && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \ 
 && echo "Asia/Shanghai" > /etc/timezone

ENV JAVA_HOME /usr/java/jdk
ENV PATH ${PATH}:${JAVA_HOME}/bin

WORKDIR /opt
