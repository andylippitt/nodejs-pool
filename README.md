# nodejs-poolController - docker

This is setup to run via an ssh proxy to
a raspberry pi connected to the pool via RS485 serial bus


# requirements
You'll need to create an RSA key without passphrase
to use this setup

```
user@linux:~$ ssh-keygen -f creds
Generating public/private rsa key pair.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in creds
Your public key has been saved in creds.pub
The key fingerprint is:
SHA256:--redacted--- user@linux
The key's randomart image is:
+---[RSA 3072]----+
--redacted---
--redacted---
--redacted---
--redacted---
+----[SHA256]-----+
user@linux:~$ ssh-copy-id -i creds pi@raspberrypi
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "creds.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'pi@raspberrypi'"
and check to make sure that only the key(s) you wanted were added.

user@linux:~$ ssh -i creds pi@raspberrypi

```

# run with docker-compose

create a file `creds` as above

see the configurations in ./compose-config

`docker-compose up`
then browse to http://localhost:8080

# run in kuberenetes

create the rsa creds as above

then import them into a secret
`kubectl create secret generic pool-creds --from-file=creds`

`helm upgrade --install test helm/ --set controller.publicHostname=mynode-0 --set proxy.config.ssh=pi@raspberry --set proxy.config.device="FILE:/dev/ttyS0,b9600,raw"`

then browse to http://mynode-0:31080
