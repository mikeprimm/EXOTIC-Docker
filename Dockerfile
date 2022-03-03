from python:3.10.2-bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget curl vim && mkdir /work && mkdir /exotic
RUN curl -s https://api.github.com/repos/rzellem/EXOTIC/releases/latest | grep tarball_url | cut -d : -f 2,3 | tr -d "[\"\ ,]" | xargs wget -O exotic.tar.gz  
RUN tar -xzf exotic.tar.gz --strip=1 -C /exotic && rm exotic.tar.gz && pip3 install wheel setuptools && pip3 install --upgrade exotic

WORKDIR /work

VOLUME ["/work"]

CMD ["/bin/bash"]
