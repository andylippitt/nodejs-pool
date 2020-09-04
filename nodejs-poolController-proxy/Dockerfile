FROM alpine

RUN apk add --no-cache openssh socat

WORKDIR /app

ADD start.sh /app/start.sh
RUN chmod 700 /app/start.sh

ENV LOCALPORT 30485
ENV REMOTE pi@pool.localdomain
ENV DEVICE FILE:/dev/ttyS0,b9600,raw

ENTRYPOINT ["/app/start.sh"]
