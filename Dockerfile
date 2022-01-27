#original source of this docker file - https://github.com/wtakuo/xv6-env
# I removed some stuff from it and add qemu build from source for riscv64

FROM ubuntu

LABEL maintainer="debashish.deka.c2019@iitbombay.org"

ARG TZ=UTC
ARG USER=xv6
ARG GROUP=xv6
ARG PASS=xv6
ENV HOME=/home/${USER}
ENV XV6=${HOME}/xv6-riscv

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata \
 && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
 && dpkg-reconfigure --frontend noninteractive tzdata \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
      sudo \
      git \
      build-essential \
      gdb-multiarch \
      gcc-riscv64-linux-gnu \
      binutils-riscv64-linux-gnu \
      g++ \
      wget \
      pkg-config \
      libglib2.0-dev \
      libpixman-1-dev \
 && wget https://download.qemu.org/qemu-5.1.0.tar.xz --no-check-certificate \
 && tar xvf qemu-5.1.0.tar.xz \
 && cd qemu-5.1.0 \
 && ./configure --target-list=riscv64-softmmu \
 && make -j16 \
 && make install \
 && cd .. \
 && rm -rf /var/lib/apt/lists/* \
 && groupadd ${GROUP} \
 && useradd -g ${GROUP} -m ${USER} \
 && (echo "${USER}:${PASS}" | chpasswd) \
 && gpasswd -a ${USER} sudo \
 && mkdir -p ${XV6} \
 && chown -R ${USER}:${GROUP} ${XV6} \
 && (echo "add-auto-load-safe-path ${XV6}/.gdbinit" > ${HOME}/.gdbinit) \
 && chown ${USER}:${GROUP} ${HOME}/.gdbinit

USER ${USER}
WORKDIR ${HOME}

ENTRYPOINT ["/bin/bash"]
