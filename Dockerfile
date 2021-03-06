FROM perl:latest
MAINTAINER Kivanc Yazan <kyzn@cpan.org>

RUN apt-get update
RUN apt-get install memcached sqlite3
RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN cpanm Carton Starman

RUN git clone http://github.com/kyzn/PRC.git
RUN cd PRC && carton install --deployment
RUN cd PRC && sqlite3 prc.db < prc.sql

WORKDIR PRC
CMD service memcached start && perl -Ilocal/lib/perl5 -Ilib local/bin/starman --port 8080 prc.psgi
