FROM debian:stable

ARG uid
RUN useradd -u $uid -ms /bin/bash build

VOLUME /opt/site-ffww/
WORKDIR /opt/site-ffww/

ENTRYPOINT ["./docker/build.sh"]