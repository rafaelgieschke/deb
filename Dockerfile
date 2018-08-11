FROM eaas/eaas-dev-testing

COPY --from=rafaelgieschke/deb /local-apt /local-apt

RUN sed -i '1ideb file:///local-apt /' /etc/apt/sources.list
RUN apt-get -y update

RUN apt-get -y --force-yes install --reinstall vde2
