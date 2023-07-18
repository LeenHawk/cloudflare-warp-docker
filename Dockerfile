FROM debian:bookworm

RUN apt update -y \
    && apt install systemd wget curl gpg lsb-release -y \
    && curl https://pkg.cloudflareclient.com/pubkey.gpg | gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg \
    && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/cloudflare-client.list \
    && apt update && apt install cloudflare-warp -y \
    && apt-get autoclean && rm -rf /var/lib/apt/lists/*
