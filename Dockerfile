# DON't use ubuntu 20.04, seems to be a bug and gets stuck when doing apt install
FROM ubuntu:24.04

# script for test
COPY hello.sh /

# workaround to tzdata getting hanged in docker images
ENV TZ=Europe/Bucharest
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# install packages
RUN apt update && \
	# basic tools
	apt install -y sudo && \
	apt install -y apt-utils && \
	apt install -y build-essential && \
	apt install -y git && \
	apt install -y vim && \
	apt install -y gcc && \
	apt install -y g++ && \
	apt install -y sed && \
	apt install -y gawk && \
	apt install -y autoconf && \
	apt install -y automake && \
	apt install -y libxmu-dev && \
	apt install -y libxt-dev && \
	apt install -y libx11-dev && \
	apt install -y libxt6 && \
	apt install -y gnuplot-x11 && \
	apt install -y tk tcl parallel tmux mc emacs && \
	apt install -y tshark && \
	# python stuff
	apt install -y python3 && \
	apt install -y python3-pip && \
	apt install -y python3-matplotlib python3-jupyter-core python3-jupyter-client && \
	apt install -y python3-ipykernel jupyter-notebook python3-pandas
	# some ns3 libs
	apt install -y libgsl-dev && \
	apt install -y gsl-bin && \
	apt install -y libgslcblas0 && \
	apt install -y autoconf cvs bzr unrar && \
	apt install -y sqlite3 libsqlite3-dev && \
	apt install -y libxml2 libxml2-dev && \
	apt install -y cmake

RUN snap install code --classic

RUN ln -s ~/.local/bin/jupyter-notebook /usr/bin/jupyter-notebook

# create user student
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN useradd -rm -d /home/student -s /bin/bash -g root -G sudo student
RUN echo 'student:student' | chpasswd
USER student
WORKDIR /home/student

# We need to define the command to launch when we are going to run the image.
# We use the keyword 'CMD' to do that.
CMD [ "/bin/sh", "./hello.sh" ]
