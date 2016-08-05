FROM alpine:3.4

RUN apk update && apk add curl

ENV ECS_MD5="9f722d4a3874b09a414f5bafcf10f4be"
RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest && chmod a+x /usr/local/bin/ecs-cli
RUN md5sum /usr/local/bin/ecs-cli | awk 'BEGIN {FS=" "} {print $1}'

RUN if [ "$(md5sum /usr/local/bin/ecs-cli | awk 'BEGIN {FS=" "} {print $1}')" -eq "$ECS_MD5" ]; then echo "Shit is equal."; fi
