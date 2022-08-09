FROM alpine:3.16

ENV TERM=xterm-256color

RUN  set -x \
  && apk add --no-cache --virtual deps \
    git \
    make \
  && apk add --no-cache \
    bash \
    ncurses \
  && git clone https://github.com/pipeseroni/pipes.sh.git \
  &&  cd pipes.sh \
  && make install \
  && apk del deps

ENTRYPOINT [ "pipes.sh" ]
