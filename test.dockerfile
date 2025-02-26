FROM i386/debian:stable-slim

# Set environment variables
ENV GO_VERSION=1.21.6
ENV ARCH=386

# Install required dependencies
RUN apt-get update && apt-get install -y \
    wget curl git build-essential \
    && rm -rf /var/lib/apt/lists/*

# Download and install Go
RUN wget https://go.dev/dl/go${GO_VERSION}.linux-${ARCH}.tar.gz -O /tmp/go.tar.gz && \
    tar -C /usr/local -xzf /tmp/go.tar.gz && \
    rm /tmp/go.tar.gz

# Set Go environment variables
ENV PATH="/usr/local/go/bin:${PATH}"
ENV GOPATH="/go"
ENV GOBIN="${GOPATH}/bin"
ENV PATH="${GOBIN}:${PATH}"

# Create a working directory
WORKDIR /app

# Verify Go installation
RUN go version

CMD ["bash"]
