FROM debian:bookworm-slim


ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    netcat-openbsd \
    cowsay \
    fortune \
    bash \
    curl \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /app


COPY wisecow.sh /app/wisecow.sh

RUN chmod +x /app/wisecow.sh


EXPOSE 8080


CMD ["/app/wisecow.sh"]
