FROM debian:bookworm

RUN apt update -y \
    && apt install systemd wget curl gpg -y \
    && curl https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg \
    && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list \
    && apt update && apt install cloudflare-warp \
    && apt-get autoclean && rm -rf /var/lib/apt/lists/*
