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

# Create and compile a file to generate some cache files as long as we have root
RUN mkdir -p /tmp/latex-build && \
    echo "\
\\documentclass[headings=optiontohead,12pt,DIV=13,twoside=false,open=right,BCOR=00mm,toc=bibliographynumbered]{scrreport} \n\
\\usepackage{amsfonts,amssymb,amstext,amsmath,amsthm,bbm} \n\
\\usepackage{xspace} \n\
\\\\begin{document} \n\
\$\$\\\\ensuremath{\\mathbbm{1}_{3}}\\xspace\$\$ \n\
\$\\\\ensuremath{\\mathbbm{1}_{3}}\\xspace\$ \n\
\\\\end{document} \n\
" > /tmp/latex-build/tmp.tex
RUN cd /tmp/latex-build && \
    latexmk --shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -pdf tmp.tex


WORKDIR /workspace
