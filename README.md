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

For the installation of OpenBTS, I will highly recommend you do so with Ubuntu LTS 16.04 or 18.04 using UHDv3.9.5. It will require a lot of patience and IT knowledge so seek help if you are not comfortable with linux and CMake. The project is not limited to OpenBTS as there is even a new guy call YateBTS so feel free to explore the possibilities. For the task of decoding and decrypting the saved packets for a target channel, I will recommend GNU Radio v3.8 so that you can use the latest blocks in GR-GSM for handling hopping channels (see [`grgsm_hopping_example.grc`](https://github.com/AllisonOge/penetration-testing/blob/main/grc/grgsm_hopping_example.grc)). The requirements section has links to the GitHub repositories or installation pages, so follow the guide for you machine.

P.S. If you are comfortable with Docker and want to control the different GNU Radio versions without the stress of installing the required libriaries then you can use the [`Dockerfile`](https://github.com/AllisonOge/penetration-testing/blob/main/Dockerfile). It installs GNU Radio v3.8 with Osmosdr and GR-GSM. Follow the steps below to build the dockerfile in linux or MacOS and run the container:
```sh
docker build --network=host -t grgsm .
docker run -dit --net=host --expose 2222 --privileged grgsm:latest
```
Then ssh to the container with command `ssh -Xp 2222 root@localhost`.

## Results
The results of the research are contained in `/data/` directory which contains screenshots, GSM packets and burst files.

## Publication

@article {
author = {Bello, Nosa and Kanu, Ogechukwu},
title = {Penetration Testing of GSM Network using Man-In-The-Middle Attack},
journal = {JES. Journal of Engineering Sciences},
volume = {52},
number = {1},
pages = {12-26},
year  = {2024},
publisher = {Assiut University, Faculty of Engineering},
issn = {1687-0530}, 
eissn = {2356-8550}, 
doi = {10.21608/jesaun.2023.226718.1249},
abstract = {Even though wireless communication technologies have advanced beyond the Global Systems for Mobile (GSM) Communications standard to mitigate its vulnerabilities, it is still a fallback technology when the coverage is limited and modern protocols aren’t available. There is a need for a comprehensive practical demonstration of the pools of vulnerabilities of the GSM architecture in the past decades using man-in-the-middle open-source tools and SDRs amidst the latest developments. It can be shown that an attacker can successfully carry out base station spoofing, IMSI catching, GSM packet sniffing, decoding, decryption and Denial of Service (DoS) attacks. Thus, this paper aims to comprehensively present practical demonstrations of the many vulnerabilities possible with available tools. We exploited IMSI catching with a rogue BTS deployed using OpenBTS and USRP B210, GSM sniffing and decoding using GR-GSM and RTL-SDR, and A5/1 decryption using clever thinking and rainbow tables. It was observed that the one-way authentication of the GSM protocol allows most mobile devices to easily authenticate to the rogue BTS with spoofed MCC/MNC and that the strongest signal mostly wins. Also, it was observed that the possibilities of attacks on the target user like a DoS, or unencrypted communication, can be successfully carried out because the rogue BTS is in total control. Though the vulnerabilities of GSM have been made known to the general public some network providers have not taken simple measures to mitigate them, thus this work can serve as a guideline for research purposes and an awareness to the general public},
keywords = {IMSI catcher,OpenBTS,GR-GSM,Wireshark,A5/1 rainbow tables},	
url = {https://jesaun.journals.ekb.eg/article_323883.html},
eprint = {https://jesaun.journals.ekb.eg/article_323883_7eace44e00b402c4188783b967aaf19e.pdf}
}
