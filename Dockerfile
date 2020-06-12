FROM alpine:latest

ARG A_PORT=1080
ARG USER=user
ARG PASSWORD=password
ARG SIP=

ENV USER=$USER
ENV PWD=$PASSWORD
ENV SIP=$SIP 

COPY microsocks microsocks
COPY init.sh init.sh

RUN apk add --no-cache \
    coreutils \
    shadow 
RUN useradd -u 1000 -U -M -s /bin/false microsocks && \
    usermod -G users microsocks
RUN chmod +x microsocks
RUN chmod +x init.sh

EXPOSE $A_PORT

CMD ["sh", "./init.sh"]