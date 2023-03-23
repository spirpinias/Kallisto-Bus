# hash:sha256:0cc693c791e67aeb44f8b1ab0d64532e4e070577952e41143f5b61ff30cf4a16
FROM registry.apps.codeocean.com/codeocean/mambaforge:22.9.0-3

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN conda install -y --channel=defaults --channel=bioconda --channel=conda-forge \
        kallisto \
    && conda clean -ya
