FROM ubuntu:xenial
MAINTAINER Julian Engelhardt <jengelhardt211@gmail.com>


RUN apt-get update &&\
    apt-get install -y wget

RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u162-b12/0da788060d494f5095bf8624735fa2f1/jre-8u162-linux-x64.tar.gz -c -O /tmp/jre.tar.gz &&\
    mkdir -p /opt/jre &&\
    tar --strip-components=1 -zxf /tmp/jre.tar.gz -C /opt/jre

RUN update-alternatives --install "/usr/bin/java" "java" "/opt/jre/bin/java" 1 &&\
    update-alternatives --install "/usr/bin/javaws" "javaws" "/opt/jre/bin/javaws" 1 &&\
    echo export JAVA_HOME=/opt/jre/ >> ~/.bashrc

CMD ["java", "-version"]
