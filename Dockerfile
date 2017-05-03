FROM beginor/ubuntu-china:16.04
MAINTAINER beginor <beginor@qq.com>
# Install wget and openssh-server, download and install jexus, then cleanup
RUN apt update && apt upgrade -y \
    && apt install -y wget \
    && wget --no-check-certificate https://linuxdot.net/down/jexus-5.8.2-x64.tar.gz \
    && tar -zxf jexus-5.8.2-x64.tar.gz && rm jexus-5.8.2-x64.tar.gz \
    && mv jexus /usr/ && cd /usr/jexus && /usr/jexus/jws regsvr \
    && apt remove -y wget \
    && apt purge -y wget \
    && rm -rf /var/lib/apt/lists/* \
    && apt autoremove -y
ADD bootstrap.sh /usr/bin/
# Expost ports
EXPOSE 80 443
# Define volumes
VOLUME ["/usr/jexus/siteconf", "/var/www", "/usr/jexus/log"]
# Define workdir
WORKDIR /usr/jexus
# Define startup scripts;
ENTRYPOINT ["/usr/bin/bootstrap.sh"]
