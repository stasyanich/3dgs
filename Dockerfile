FROM nvidia/cuda:11.7.1-devel-ubuntu22.04
# comment

# Install necessary packages
RUN apt-get update && apt-get install -y \
    git \
   	python3 \
    libboost-program-options-dev \
    libglew-dev \
    libmetis-dev \
   	libboost-filesystem-dev \
   	libceres-dev \
   	libfreeimage-dev \
    libqt5opengl5-dev \
    ffmpeg \
    p7zip-full \
   && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/graphdeco-inria/gaussian-splatting --recursive
#copy compiled colmap from root dir to /usr/bin
COPY ./colmap /usr/local/bin
# Copy the script to the container
COPY ./script.sh /
RUN chmod +x /script.sh

# Create a workspace directory and clone the repository
WORKDIR /workspace




