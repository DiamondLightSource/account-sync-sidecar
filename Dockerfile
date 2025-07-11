# The devcontainer should use the developer target and run as root with podman
# or docker with user namespaces.
ARG PYTHON_VERSION=3.11
FROM python:${PYTHON_VERSION} AS developer

RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install libnss-ldapd gdb -y

RUN sed -i 's/files/ldap files/g' /etc/nsswitch.conf
COPY dls-nslcd.conf /etc/nslcd.conf


RUN pip install debugpy
ENV DEBUGPY_LOG_DIR=/logs

ENTRYPOINT [ "nslcd" ]
CMD [ "--debug" ]
