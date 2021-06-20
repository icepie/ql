FROM whyour/qinglong:2.2.0

LABEL maintainer="icepie"
WORKDIR /

COPY patch .

RUN chmod a+x /usr/local/bin/ql
RUN chmod a+x /ql/shell/update.sh
RUN chmod a+x /ql/docker/docker-entrypoint.sh

ARG QL_URL=https://github.com/whyour/qinglong.git
ARG QL_BRANCH=master
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    LANG=zh_CN.UTF-8 \
    SHELL=/bin/bash \
    PS1="\u@\h:\w \$ " \
    QL_DIR=/ql

WORKDIR ${QL_DIR}

ENTRYPOINT ["./docker/docker-entrypoint.sh"]