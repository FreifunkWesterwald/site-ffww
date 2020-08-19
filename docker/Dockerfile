FROM debian:stable

RUN useradd -ms /bin/bash build

VOLUME /opt/site-ffww/
WORKDIR /opt/site-ffww/

ENTRYPOINT ["./docker/build.sh"]