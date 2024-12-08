# FROM texlive/texlive:latest-full
FROM texlive/texlive@sha256:e38cb99bbe86518451786e410a989626012a7b0c4d3726ae9f0510e17d67fc39

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

# # install libertinus 
# RUN \
#        rm /usr/local/texlive/2024/texmf-dist/fonts/type1/public/libertinus-type1/*.pfb \
#     && rm /usr/local/texlive/2024/texmf-dist/fonts/type1/public/libertinust1math/*.pfb \
#     && rm /usr/local/texlive/2024/texmf-dist/fonts/opentype/public/libertinus-fonts/*.otf \
#     && wget https://github.com/alerque/libertinus/releases/download/v7.051/Libertinus-7.051.zip -O /tmp/Libertinus.zip \
#     && unzip /tmp/Libertinus.zip -d /tmp/libertinus \
#     && cp /tmp/libertinus/Libertinus-7.051/static/OTF/* /usr/share/fonts/ \
#     && mktexlsr && fc-cache -fv \
#     && rm /tmp/Libertinus.zip && rm -rf /tmp/libertinus
# fc-list | grep Libertinus

WORKDIR /workspace
