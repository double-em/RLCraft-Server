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
COPY /server.properties .
RUN java -jar installer.jar --installServer \
    && rm -rf installer* \
    && ln -s forge-*.jar server.jar

FROM openjdk:8-jre-slim
RUN adduser --system --group forge
COPY run-server.sh /
RUN chmod +x run-server.sh
COPY --from=server-install --chown=forge:forge /server /server/
USER forge
WORKDIR /server
VOLUME /server
EXPOSE 25565
ENTRYPOINT /run-server.sh