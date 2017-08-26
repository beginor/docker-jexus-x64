FROM beginor/ubuntu-china:16.04

MAINTAINER beginor <beginor@qq.com>

COPY bootstrap.sh /usr/bin/

# Install wget, download and install jexus, then cleanup
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y wget \
    && wget --no-check-certificate https://linuxdot.net/down/jexus-5.8.3-x64.tar.gz \
    && tar -zxf jexus-5.8.3-x64.tar.gz && rm jexus-5.8.3-x64.tar.gz \
    && mv jexus /usr/ && cd /usr/jexus && /usr/jexus/jws regsvr \
    && apt-get remove -y wget \
    && apt-get purge -y wget \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /var/www/default

# Expost ports
EXPOSE 80 443
# Define volumes
VOLUME ["/usr/jexus/siteconf", "/var/www", "/usr/jexus/log"]
# Define workdir
WORKDIR /usr/jexus
# Define startup scripts;
ENTRYPOINT ["/usr/bin/bootstrap.sh"]
