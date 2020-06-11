FROM amd64/photon:latest

ARG A_PORT=1080
ARG USER=user
ARG PASSWORD=password
ARG SIP=

ENV USER=$USER
ENV PWD=$PASSWORD
ENV SIP=$SIP 

COPY microsocks microsocks
COPY init.sh init.sh
RUN chmod +x microsocks
RUN chmod +x init.sh

EXPOSE $A_PORT

CMD ["sh", "./init.sh"]