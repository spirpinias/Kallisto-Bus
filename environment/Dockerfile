# hash:sha256:d2659ca6865287e35bcf796f13b45e680b08942eb7b8c26915f7e6bba6e5d9de
FROM registry.apps.codeocean.com/codeocean/mambaforge:22.9.0-3

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN conda install -y --channel=defaults --channel=bioconda --channel=conda-forge \
        kallisto==0.48.0 \
    && conda clean -ya
