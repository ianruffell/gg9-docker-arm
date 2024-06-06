FROM arm64v8/alpine:3

RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    wget -P /etc/apk/keys/ https://cdn.azul.com/public_keys/alpine-signing@azul.com-5d5dc44c.rsa.pub && \
    echo "https://repos.azul.com/zulu/alpine" >> /etc/apk/repositories && \
    apk update && \
    apk add zulu11-jdk && \
    apk add coreutils \
            libgcc \
            bash \
            wget \
            libstdc++ \
    && \
    rm -rfv /var/cache/apk/*

#RUN $JAVA_HOME/bin/jlink \
#         --add-modules ALL-MODULE-PATH \
#         --strip-debug \
#         --no-man-pages \
#         --no-header-files \
#         --compress=2 \
#         --output /javaruntime

# Same base image as eclipse-temurin
# FROM ubuntu:22.04

#ENV JAVA_HOME=/opt/java/openjdk
#ENV PATH "${JAVA_HOME}/bin:${PATH}"
#COPY --from=jre-build /javaruntime $JAVA_HOME

# Copy and setup DB app
ENV IGNITE_HOME /opt/ignite

ENV LIBS_DIR $IGNITE_HOME/lib

ENV IGNITE_NODE_NAME defaultNode
ENV IGNITE_WORK_DIR $IGNITE_HOME/work
ENV IGNITE_CONFIG_PATH $IGNITE_HOME/etc/ignite-config.conf

COPY dist/db $IGNITE_HOME

EXPOSE 3344 10300 10800

# Copy CLI app
ENV IGNITE_CLI_HOME /opt/ignite3cli

COPY dist/cli $IGNITE_CLI_HOME

# Copy entrypoint script
COPY dist/docker-entrypoint.sh /usr/local/bin/
ENV PATH "/usr/local/bin:${PATH}"

ENTRYPOINT ["docker-entrypoint.sh"]
