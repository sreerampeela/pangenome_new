FROM continuumio/miniconda3:4.10.3
LABEL authors="Sreeram Peela" \
      description="Docker image for seq-seq-pan (https://gitlab.com/rki_bioinformatics/seq-seq-pan)"
RUN apt update; apt install -y  gcc procps jq
RUN conda config --add channels defaults
RUN conda config --add channels bioconda
RUN conda config --add channels conda-forge
RUN conda install mamba
RUN mamba create -n ssp_env seq-seq-pan
RUN mamba create -n panpasco_env panpasco
ENV PATH /opt/conda/envs/ssp_env/bin:/opt/conda/envs/panpasco_env/bin:$PATH

