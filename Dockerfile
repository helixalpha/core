FROM phusion/baseimage

COPY ./helixalpha.conf /root/.helixalpha/helixalpha.conf
COPY . /helixalpha
WORKDIR /helixalpha

# Shared libraries and dependencies
RUN apt update
RUN apt-get install -y build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils
RUN apt-get install -y libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev

# BerkleyDB for wallet support
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:bitcoin/bitcoin
RUN apt-get update
RUN apt-get install -y libdb4.8-dev libdb4.8++-dev

# UPnP
RUN apt-get install -y libminiupnpc-dev

# ZMQ
RUN apt-get install -y libzmq3-dev

# Build helixalpha from source
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install

# Clean App

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose Ports

EXPOSE 9222 19122
CMD ["helixalphad", "--printtoconsole"]