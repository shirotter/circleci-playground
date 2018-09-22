FROM busybox:1.29

LABEL maintainer "shirotter <shirotter+circleci.playground@gmail.com>"

ARG message_file="/circleci/hello.txt"
ARG message="Hello CircleCI"
ARG interval="60s"

WORKDIR /circleci
RUN set -x \
    && : "Create file" \
    && echo ${message} > ${message_file}

RUN set -x \
    && : "Suspend execution for ${interval}" \
    && sleep ${interval}

ENTRYPOINT [ "cat" ]
CMD [ "${message_file}"]
