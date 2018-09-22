FROM busybox:1.29

LABEL maintainer "shirotter <shirotter+circleci.playground@gmail.com>"

ARG message="Hello CircleCI"
ARG interval="60s"

WORKDIR /circleci
RUN set -x \
    && : "Create file" \
    && echo ${message} > /circleci/hello.txt

RUN set -x \
    && : "Suspend execution for ${interval}" \
    && sleep ${interval}

ENTRYPOINT [ "cat" ]
CMD [ "/circleci/hello.txt" ]
