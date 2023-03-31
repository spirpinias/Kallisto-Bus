# hash:sha256:28a08f4e3fa5bfc3b890fff317e2efa7299f068cf709572fcc048388457d3898
FROM registry.apps.codeocean.com/codeocean/mambaforge:22.9.0-3

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        wget \
    && rm -rf /var/lib/apt/lists/*

RUN conda install -y --channel=defaults --channel=bioconda --channel=conda-forge \
        kallisto==0.48.0 \
    && conda clean -ya

COPY postInstall /
RUN /postInstall
