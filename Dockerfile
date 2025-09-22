FROM debian:bookworm-slim


RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      bash \
      curl \
      netcat-openbsd \
      fortune-mod \
      cowsay && \
    rm -rf /var/lib/apt/lists/*


WORKDIR /app
COPY wisecow.sh /app/wisecow.sh
RUN chmod +x /app/wisecow.sh


EXPOSE 4499


CMD ["./wisecow.sh"]
