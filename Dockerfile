FROM m1mbert/cxlb-gnuradio-3.8:1.2

# install dependencies
RUN apt-get update && \ 
    apt-get install -y \
    cmake \
    autoconf \
    libtool \
    pkg-config \
    build-essential \
    python-docutils \
    libcppunit-dev \
    swig \
    doxygen \
    liblog4cpp5-dev \
    python-scipy \
    python-gtk2 \
    gnuradio-dev \
    gr-osmosdr \
    libosmocore-dev

# get OOT libriares
RUN git clone https://git.osmocom.org/sdr/gr-osmosdr.git gr-osmosdr.git
RUN git clone  clone https://gitea.osmocom.org/sdr/gr-gsm.git gr-gsm.git

# build the OOT libraries
RUN cd gr-osmosdr.git/ && mkdir build && cd build/ && cmake -DCMAKE_INSTALL_PREFIX=/cortexlab/toolchains/current .. && make && make install
RUN cd gr-gsm.git/ && mkdir build && cd build/ && cmake -DCMAKE_INSTALL_PREFIX=/cortexlab/toolchains/current .. && make && make install
