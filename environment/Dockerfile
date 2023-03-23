# hash:sha256:c03e94063a4120839629a40aac6b064c0e9ca2447edfc3292a77d9dc468120d0
FROM registry.apps.codeocean.com/codeocean/mambaforge:22.9.0-3

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN conda install -y --channel=defaults --channel=bioconda --channel=conda-forge \
        kallisto==0.48.0 \
    && conda clean -ya

COPY postInstall /
RUN /postInstall
