FROM debian:buster

RUN cat /etc/debian_version

VOLUME ["/etc/tor/", "/usr/share/tor"]

RUN apt-get update
RUN apt-get install apt-transport-https gpg wget -y

RUN wget -qO- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --import
RUN gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add -

RUN echo "deb     https://deb.torproject.org/torproject.org buster main" >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get install tor -y

USER 127

#VOLUME ["/etc/tor/", "/var/lib/tor/"]

ENTRYPOINT ["tor"]
# docker run -it --rm -v tor-etc:/etc/tor/ -v tor-var:/var/lib/tor b850f0b235d5
