FROM debian:latest

# Install required packages
RUN apt-get update && apt-get install -y \
    live-build \
    git \
    curl \
    ca-certificates \
    sudo \
    systemd-container \
    xz-utils \
    squashfs-tools \
    cpio \
    genisoimage \
    wget \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get install dirmngr ca-certificates apt-transport-https curl -y

RUN curl -fSsL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg >/dev/null

RUN echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list

# Set working directory
WORKDIR /workspace

# Copy the live-build config into the container
COPY . /workspace

# Fix permissions
RUN chmod -R a+rw /workspace

# Default build steps (can be overridden)
CMD sudo lb config --distribution trixie && lb build