FROM ubuntu:16.04

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install dpkg-dev

RUN mkdir /local-apt

COPY --from=rafaelgieschke/deb:slirpvde /out /local-apt

RUN cd /local-apt && dpkg-scanpackages . | gzip -c > Packages.gz

RUN sed -i '1ideb file:///local-apt /' /etc/apt/sources.list
RUN apt-get -y update
