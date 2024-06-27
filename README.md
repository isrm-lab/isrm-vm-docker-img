# First time setup

Step 1: New terminal

```
mkdir -p ~/isrm
cd ~/isrm
git clone git@github.com:isrm-lab/isrm-vm-docker-img.git
```

Step 2: 

New terminal

```
cd ~/isrm
git clone https://gitlab.com/nsnam/ns-3-dev.git
# checkout to tag 3.42!
cd ns-3-dev
git checkout -b rel-342 ns-3.42
cd ../ns-3-dev/examples
git clone https://github.com/isrm-lab/ns3-labs.git
```

Step 3: 

```
cd ~/isrm/isrm-vm-docker
./build-img.sh isrm2024 ~/isrm/ns-3-dev yes
```

When rebooting your PC/laptop is enough to do this to re-access the vm (or if you unmounted your overlayfs)

```
./build-img.sh isrm2024 ~/isrm/ns-3-dev
```

Entering the vm:

```
./enter-img.sh isrm2024
```

To unmount the overlay:

```
sudo umount ~/.isrm2024/merge
```

To do the first build:

```
./enter-img.sh isrm2024
# ensure you're in isrm folder (should be done by default by the docker image)

./ns3 configure --enable-examples --enable-tests
./ns3 build

# to test
./ns3 run "lab3 --numberOfNodes=2 \
     --payloadSize=1400 --offeredRate=11Mbps --phyRate=DsssRate11Mbps --simulationTime=2"
```

# Generic instructions/manpage/help

## To build

```
./build-img.sh <desiredDockerImageName> <pathToNs3sourceCode> [rebuild yes|no]
```

Example:

```
./build-img.sh isrm2024 /home/mihai/test-docker/ns-3-dev/ yes
```

## In case you rebooted the machine

In case you rebooted the machine on which the docker container is running you'll need to remount the things. Simply do build
without the third parameter:

```
./build-img.sh isrm2024 /home/mihai/test-docker/ns-3-dev/
```

## To enter inside console

```
./enter-img.sh isrm2024
```

Where isrm2024 is the tag of the docker image you used when you ran build. In case you forgot you can use docker images to list them all and pick
the tag
