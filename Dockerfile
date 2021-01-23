FROM alpine:3.12 AS base
RUN apk add curl
COPY start.sh /
RUN mkdir server \
    && chmod +x start.sh
WORKDIR /server
RUN /start.sh

FROM openjdk:8-jre-slim AS server-install
COPY --from=base /server /server/
WORKDIR /server
COPY server.properties ops.json /server/
RUN java -jar installer.jar --installServer \
    && rm -rf installer* \
    && ln -s forge-*.jar server.jar

FROM openjdk:8-jre-slim
RUN apt update && apt install -y screen
COPY run-server.sh /
COPY --from=server-install /server /server/
RUN adduser --system --group forge && \
    chmod +x run-server.sh && \
    mkdir -p /server/server-data && \
    chown -R forge:forge /server
USER forge
WORKDIR /server
EXPOSE 25565
ENTRYPOINT /run-server.sh