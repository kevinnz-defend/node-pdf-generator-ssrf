FROM ubuntu:22.10

# Install update.
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    wget\
    python3 \
    python3-pip \
    npm \
    nodejs

#Install libssl1.1
RUN wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb
RUN dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb
# Install pdf viewer.
RUN wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.focal_amd64.deb
RUN apt-get install -y ./wkhtmltox_0.12.6-1.focal_amd64.deb

# Copy files over
WORKDIR /app
COPY . .
RUN python3 -m pip install -r requirements.txt
RUN npm i

RUN chmod +x "start.sh"

EXPOSE 3000

ENTRYPOINT [ "./start.sh" ]
