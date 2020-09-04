#!/bin/sh

# for our docker-compose friends
cp /app/creds /app/securecreds
chmod 400 securecreds

socat "TCP4-LISTEN:$LOCALPORT,reuseaddr,fork" EXEC:"ssh -o \"StrictHostKeyChecking=no\" -i ./securecreds $REMOTE '/usr/bin/socat STDIO $DEVICE'"