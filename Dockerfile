FROM jenkins/jnlp-slave
USER root

# install docker
RUN curl -fsSL https://get.docker.com | bash

FROM jenkins/slave:3.29-2
MAINTAINER Oleg Nenashev <o.v.nenashev@gmail.com>
LABEL Description="This is a base image, which allows connecting Jenkins agents via JNLP protocols" Vendor="Jenkins project" Version="3.29"

COPY jenkins-slave /usr/local/bin/jenkins-slave

USER jenkins

RUN usermod -a -G docker jenkins


ENTRYPOINT ["jenkins-slave"]




