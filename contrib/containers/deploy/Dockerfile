FROM phusion/baseimage:jammy-1.0.4
LABEL maintainer="Rub Developers <dev@rub.org>"
LABEL description="Dockerised RubCore, built from CI"

ARG USER_ID
ARG GROUP_ID

ENV HOME="/home/rub"

# add user with specified (or default) user/group ids
ENV USER_ID="${USER_ID:-1000}"
ENV GROUP_ID="${GROUP_ID:-1000}"
RUN groupadd -g ${GROUP_ID} rub && \
    useradd -u ${USER_ID} -g rub -s /bin/bash -m -d /home/rub rub && \
    mkdir /home/rub/.rubcore && \
    chown ${USER_ID}:${GROUP_ID} -R /home/rub

COPY bin/* /usr/local/bin/

RUN chmod a+x /usr/local/bin/*

USER rub

VOLUME ["/home/rub"]

EXPOSE 9998 9999 19998 19999

WORKDIR /home/rub
