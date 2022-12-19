FROM golang:1.19 AS build
COPY . /src
RUN apt-get update && apt-get -y install uuid-runtime
RUN cd /src && make && make bin/chwrap.tar

FROM debian:11

LABEL maintainers="NetApp"
LABEL description="BeeGFS CSI Driver"

# Copy all built binaries to netapp/ directory.
COPY --from=build /src/bin/beegfs-csi-driver /src/bin/chwrap /netapp/

# Add chwrap symbolic links to netapp/ directory.
COPY --from=build /src/bin/chwrap.tar /
RUN tar xvf /chwrap.tar && rm -f /tmp/chwrap.tar

# Call chwrap linked binaries before container installed binaries.
ENV PATH "/netapp:/$PATH"

ENTRYPOINT ["beegfs-csi-driver"]

