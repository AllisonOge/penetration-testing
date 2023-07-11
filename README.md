# penetration-testing-project

A research project on penetration testing on the GSM network done by a team of students at the University of Benin led by Dr Nosa Bello in 2020. This repo holds the results from the research and some setup files.

## Requirements

The project was carried out with the following tools:
- [OpenBTS](https://github.com/RangeNetworks/openbts.git)
- [GNU Radio v3.8](https://github.com/gnuradio/gnuradio.git)
- UHD
- [Osmosdr](https://osmocom.org/projects/gr-osmosdr/wiki/GrOsmoSDR)
- [GR-GSM](https://osmocom.org/projects/gr-gsm/wiki/Installation)
- [Wireshark](https://www.wireshark.org/docs/)
- [Kraken](https://github.com/joswr1ght/kraken.git)
- USRP B210 with VERT antennas
- RTL-SDRs
- High processing computers
- Android Handsets compatible with GSM
- 3TB hard disk for storing the A5/1 rainbow tables
- [Airprobe](https://github.com/zimmerle/airprobe.git)
- [GSMFrameCoder](https://github.com/flyopenair/gsmframecoder.git)

## Setup

For the installation fo OpenBTS I will highly recommend you do so with Ubuntu LTS 16.04 or 18.04 using UHDv3.9.5. It will require a lot of patience and IT knowledge so seek help if you are not comfortable with linux and CMake. The project is not limited to OpenBTS as there is even a new guy call YateBTS so feel free to explore the possibilities. For the task of decoding and decrypting the saved packets for a target channel, I will recommend GNU Radio v3.8 so that you can use the latest blocks in GR-GSM for handling hopping channels (see [`grgsm_hopping_example.grc`]()). The requirements section has links to the GitHub repositories or installation pages, so follow the guide for you machine.

P.S. If you are comfortable with Docker and want to control the different GNU Radio versions without the stress of installing the required libriaries then you can use the [`Dockerfile`](). It installs GNU Radio v3.8 with Osmosdr and GR-GSM. Follow the steps below to build the dockerfile in linux or MacOS and run the container:
```sh
docker build --network=host -t grgsm .
docker run -dit --net=host --expose 2222 --privileged grgsm:latest
```
Then ssh to the container with command `ssh -Xp 2222 root@localhost`.

## Results
The results of the research are contained in `/data/` directory which contains screenshots, GSM packets and burst files.

## Publication

Under review