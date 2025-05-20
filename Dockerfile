# The devcontainer should use the developer target and run as root with podman
# or docker with user namespaces.
ARG PYTHON_VERSION=3.11
FROM python:${PYTHON_VERSION} as developer

RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install libnss-ldapd -y
COPY dls-nslcd.conf /etc/nslcd.conf

ENTRYPOINT [ "nslcd" ]
CMD [ "--debug" ]
