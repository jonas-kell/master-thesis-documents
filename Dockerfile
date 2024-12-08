# FROM texlive/texlive@sha256:83e0ef29b7470c6fe3f28f14c558220673a47a9cea23668d7fa97b994ee5b799
FROM texlive/texlive:TL2022-historic

RUN apt-get update && apt-get install -y \
    python3-pip \
    gnuplot \
    fontconfig \
    wget \
    unzip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# this just HAS python3.12, what else (needed to install pip3 though)
RUN pip3 install Pygments --break-system-packages
RUN pip3 install numpy --break-system-packages

RUN apt-get update && apt-get install -y \
    sudo \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Default environment variables
# will get overwritten, if started with docker compose
ARG USERNAME=user
ARG USER_UID=1000 
ARG USER_GID=1000

# Add a user group and user with provided UID/GID
RUN groupadd --gid ${USER_GID} ${USERNAME} && \
    useradd --uid ${USER_UID} --gid ${USER_GID} --create-home ${USERNAME} && \
    echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR /workspace
