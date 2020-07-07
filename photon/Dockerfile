FROM photon:latest as builder

RUN tdnf install gcc glibc-devel binutils make linux-api-headers -y

ADD src src/
ADD init.sh /
RUN make -C src
RUN chmod +x /src/microsocks && \
    chmod +x init.sh && \
    mkdir -p bin && \
    cp -v  /src/microsocks bin/microsocks && \
    cp -v init.sh bin/init.sh

FROM photon:latest

COPY --from=builder bin/microsocks microsocks
COPY --from=builder bin/init.sh init.sh

ARG A_PORT=1080
ARG USER=user
ARG PASSWORD=password
ARG SIP=

ENV USER=$USER
ENV PWD=$PASSWORD
ENV SIP=$SIP

EXPOSE $A_PORT

CMD ["sh", "./init.sh"]