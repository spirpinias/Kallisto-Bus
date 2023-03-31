# hash:sha256:35dfa2fe82d9a2b25a85ba94329d8b8ca8f6c98d4af613eb8fbbc3db194b0847
FROM registry.apps.codeocean.com/codeocean/mambaforge:22.9.0-3

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        wget=1.20.3-1ubuntu2 \
    && rm -rf /var/lib/apt/lists/*

RUN conda install -y --channel=defaults --channel=bioconda --channel=conda-forge \
        kallisto==0.48.0 \
    && conda clean -ya

COPY postInstall /
RUN /postInstall
