FROM debian

VOLUME ["/etc/tor/", "/usr/share/tor"]

RUN apt-get update
RUN apt-get install tor -y

USER 127

#VOLUME ["/etc/tor/", "/var/lib/tor/"]

ENTRYPOINT ["tor"]
# docker run -it --rm -v tor-etc:/etc/tor/ -v tor-var:/var/lib/tor b850f0b235d5
