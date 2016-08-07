FROM alpine:3.4

RUN apk update && apk add curl

RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest && chmod a+x /usr/local/bin/ecs-cli

ENTRYPOINT ["/usr/local/bin/ecs-cli"]
CMD ["--help"]
