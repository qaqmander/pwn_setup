#!/bin/bash

cp sources.list /etc/apt/sources.list

dpkg --add-architecture i386 && \
    apt-get -y update && \
    apt install -y \
    libc6:i386 \
    libc6-dbg:i386 \
    libc6-dbg \
    ipython \
    vim \
    ctags \
    ruby \
    ruby-dev \
    tmux \
    wget \
    gdb \
    netcat \
    socat \
    git \
    patchelf \
    ipython \
    python-dev \
    python3-distutils \
    file --fix-missing && \
    rm -rf /var/lib/apt/list/*

wget https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

python3 -m pip install --no-cache-dir \
    -i https://pypi.doubanio.com/simple/  \
    --trusted-host pypi.doubanio.com \
    ropper \
    unicorn \
    keystone-engine \
    capstone

pip install --upgrade setuptools && \
    pip install --no-cache-dir \
    -i https://pypi.doubanio.com/simple/  \
    --trusted-host pypi.doubanio.com \
    ropgadget \
    zio \
    smmap2 \
    z3-solver \
    apscheduler

gem install one_gadget seccomp-tools && rm -rf /var/lib/gems/2.*/cache/*

mkdir ~/.pip && cp pip.conf ~/.pip/

pip install pwntools 

git clone https://github.com/pwndbg/pwndbg && \
    cd pwndbg && chmod +x setup.sh && ./setup.sh

wget -O ~/.gdbinit-gef.py -q https://raw.githubusercontent.com/hugsy/gef/master/gef.py && \
    echo 'source ~/.gdbinit-gef.py' >> ~/.gdbinit

wget -O /usr/local/lib/python2.7/dist-packages/roputils.py -q https://raw.githubusercontent.com/qaqmander/roputils/master/roputils.py

git clone https://github.com/scwuaptx/Pwngdb.git ~/Pwngdb && \
    cd ~/Pwngdb && cat ~/Pwngdb/.gdbinit  >> ~/.gdbinit && \
    sed -i "s?source ~/peda/peda.py?# source ~/peda/peda.py?g" ~/.gdbinit

git clone --recursive https://github.com/tony/tmux-config.git ~/.tmux && \
    ln -s ~/.tmux/.tmux.conf ~/.tmux.conf && \
    printf '\n%s\n' 'set-option -g mouse on' >> ~/.tmux.conf

echo "alias changeld='patchelf --set-interpreter'" >> ~/.bashrc

wget -O ~/setup.sh https://raw.githubusercontent.com/qaqmander/qpwn/master/setup_vm.sh && \
    sed -i "s?#test_and_move '/tmp/qpwn/vimrc'?test_and_move '/tmp/qpwn/vimrc'?g" ~/setup.sh && \
    chmod a+x ~/setup.sh && ~/setup.sh && rm ~/setup.sh
