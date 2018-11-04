FROM perl:latest
MAINTAINER Kivanc Yazan <kyzn@cpan.org>

RUN apt-get update
RUN apt-get install memcached sqlite3
RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN cpanm Carton Starman

RUN git clone http://github.com/kyzn/PRC.git
RUN cd PRC && carton install --deployment

WORKDIR PRC
CMD update-rc.d memcached enable
CMD service memcached start && perl -Ilocal/lib/perl5 -Ilib local/bin/starman --port 8080 prc.psgi
