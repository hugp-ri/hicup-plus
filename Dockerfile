FROM ubuntu:focal

RUN ln -sf /bin/bash /bin/sh
SHELL ["/bin/bash", "-c"]

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y \
 curl \
 git \
 git-lfs \
 make \
 gzip \
 pandoc \
 pigz \
 rename \
 samtools \
 wget

RUN apt-get install -y \
  curl \
  zsh \
  nano \
  && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"

RUN apt-get install -y \
  r-base r-base-core

RUN apt-get install -y libcurl4-openssl-dev libssl-dev libxml2-dev

RUN R -e 'install.packages(c("httr", "rvest", "xml2", "plotly"))'

RUN R -e 'install.packages(c("tidyverse"))'

RUN git clone "https://github.com/hugp-ri/hicup-plus.git"

RUN apt-get install -y bowtie bowtie2 hisat2

RUN ln -s /usr/bin/bowtie /bowtie \
&&  ln -s /usr/bin/bowtie2 /bowtie2 \
&&  ln -s /usr/bin/hisat2 /hisat2

RUN apt-get install -y software-properties-common \
&& add-apt-repository ppa:mhier/libboost-latest \
&& apt-get update \
&& apt-get install -y libboost-dev libboost-all-dev

RUN apt-get install -y apt-utils

RUN apt-get install -y libgtest-dev

RUN git clone https://github.com/Illumina/DRAGMAP.git \
&&  cd /DRAGMAP \
&&  HAS_GTEST=0 make \
&&  HAS_GTEST=0 make install

ENTRYPOINT ["/usr/bin/perl", "/hicup-plus/hicup-plus"]
