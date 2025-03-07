FROM groovy

MAINTAINER Gregor Rot <gregor.rot@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Zurich

USER root
RUN yes | unminimize
RUN apt-get update
RUN apt-get install -y man libbz2-dev liblzma-dev vim python3 git python3-pip rna-star samtools nano libxml2-dev libfreetype6-dev pkg-config libpng-dev pkg-config build-essential fort77 liblzma-dev libblas-dev gfortran gobjc++ libpcre2-dev aptitude libreadline-dev default-jre default-jdk openjdk-8-jdk openjdk-8-jre libcurl4-openssl-dev
RUN pip3 install pysam numpy matplotlib==3.2 regex pandas HTSeq

# student user
RUN useradd -m -d /home/student student
#ADD . /home/student/teachingDocker
RUN chown -R student.student /home/student

USER student
WORKDIR /home/student
RUN mkdir ~/data
RUN echo "alias python='python3'" >> ~/.bashrc

WORKDIR /home/student
