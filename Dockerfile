#
# Docker for youtube-dl with ffmpeg supported
# falconchen/arm64v8-youtube-dl
#

FROM arm64v8/python:3-alpine
#FROM aarch64/python:3.5-alpine
MAINTAINER falcon <me@cellmean.com>

RUN set -xe \
    && apk add --no-cache ca-certificates \
                          ffmpeg \
                          openssl \
                          aria2 \
    && pip install --upgrade pip \
    && pip install youtube-dlc \
    && mkdir -p /videos \
    && mkdir -p /audios

COPY ./youtube-dl.conf /etc/youtube-dlc.conf

# Try to run it so we know it works
RUN youtube-dlc --version

WORKDIR /data

VOLUME ["/data"]
ENTRYPOINT ["youtube-dlc"]
CMD ["--help"]
