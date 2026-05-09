FROM alpine:3.19

WORKDIR /app

# 下载 frp 0.61.0 linux amd64
RUN wget -q https://github.com/fatedier/frp/releases/download/v0.61.0/frp_0.61.0_linux_amd64.tar.gz \
&& tar -zxf frp_0.61.0_linux_amd64.tar.gz \
&& mv frp_0.61.0_linux_amd64/frps /app/frps \
&& rm -rf frp_0.61.0_linux_amd64.tar.gz frp_0.61.0_linux_amd64

COPY frps.toml /app/

$PORT 7000

CMD ["./frps", "-c", "frps.toml"]
