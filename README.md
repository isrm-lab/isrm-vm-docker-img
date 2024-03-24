# To build

```
./build-img.sh <desiredDockerImageName> <pathToNs3sourceCode> [rebuild yes|no]
```

Example:

```
./build-img.sh isrm2024 /home/mihai/test-docker/ns-3-dev/ yes
```

# In case you rebooted the machine

In case you rebooted the machine on which the docker container is running you'll need to remount the things. Simply do build
without the third parameter:

```
./build-img.sh isrm2024 /home/mihai/test-docker/ns-3-dev/
```

# To enter inside console

```
./enter-img.sh isrm2024
```

Where isrm2024 is the tag of the docker image you used when you ran build. In case you forgot you can use docker images to list them all and pick
the tag
