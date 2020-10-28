FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install build-essential libpq-dev libssl-dev openssl libffi-dev zlib1g-dev wget -y && apt-get install python3-pip python3-dev -y
RUN apt-cache search python3.6 && wget https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tgz && tar -xvf Python-3.6.8.tgz
WORKDIR /Python-3.6.8
RUN ./configure --enable-optimizations && make -j8 && make install
RUN pip3 install --upgrade pip && pip3 install virtualenv && pip install -U pytest