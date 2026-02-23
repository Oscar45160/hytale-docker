FROM eclipse-temurin:25-jre-noble

RUN apt-get update -y && \
    apt-get install -y curl unzip file && \
    apt-get clean

WORKDIR /home/container

RUN curl -L -o hytale-downloader "https://downloader.hytale.com/hytale-downloader.zip" && \
    file hytale-downloader && \
    chmod +x hytale-downloader

CMD ["java", "-XX:AOTCache=HytaleServer.aot", "-jar", "HytaleServer.jar", "--assets", "Assets.zip"]