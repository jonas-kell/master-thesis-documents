FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3-pip \
    gnuplot \
    fontconfig \
    wget \
    unzip \
    perl \
    xz-utils \
    gnupg \
    make \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Download and install TeX Live with a minimal profile
RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    tar -xzf install-tl-unx.tar.gz && \
    cd install-tl-* && \
    echo "selected_scheme scheme-medium" > ./texlive.profile && \
    ./install-tl --profile=./texlive.profile && \
    cd .. && rm -rf install-tl-*

# this just HAS python3
RUN pip3 install Pygments --break-system-packages
RUN pip3 install numpy --break-system-packages


# install libertinus 
RUN \
    wget https://github.com/alerque/libertinus/releases/download/v7.051/Libertinus-7.051.zip -O /tmp/Libertinus.zip \
    && unzip /tmp/Libertinus.zip -d /tmp/libertinus \
    && cp /tmp/libertinus/Libertinus-7.051/static/OTF/* /usr/share/fonts/ \
    && fc-cache -fv \
    && rm /tmp/Libertinus.zip && rm -rf /tmp/libertinus
# fc-list | grep Libertinus

# Add TeX Live binaries to PATH -> that is so shitty, here I can only install 2024 version and must hardcode the year.... 
# When texlive updated in a month, then the old version might no longer install packages, ft how bad is this backwards compatibility
ENV PATH="/usr/local/texlive/2024/bin/x86_64-linux:$PATH"

RUN tlmgr update --self --all 
RUN tlmgr install was
RUN tlmgr install fontaxes
RUN tlmgr install bbm bbm-macros
RUN tlmgr install titling
RUN tlmgr install multirow
RUN tlmgr install placeins
RUN tlmgr install sttools
RUN tlmgr install minted
RUN tlmgr install upquote
RUN tlmgr install csquotes
RUN tlmgr install sidecap
RUN tlmgr install scalerel
RUN tlmgr install stix
RUN tlmgr install libertinus libertinus-otf libertinus-type1 libertinust1math
RUN tlmgr install biblatex biber etex etoolbox logreq graphics url

WORKDIR /workspace
