FROM eclipse-temurin:25-jre-noble

RUN apt-get update -y && \
    apt-get install -y curl unzip && \
    apt-get clean

WORKDIR /home/container

RUN curl -L -o hytale-downloader.zip "https://downloader.hytale.com/hytale-downloader.zip" && \
    unzip hytale-downloader.zip && \
    rm hytale-downloader.zip && \
    ls -la

CMD ["java", "-XX:AOTCache=HytaleServer.aot", "-jar", "HytaleServer.jar", "--assets", "Assets.zip"]