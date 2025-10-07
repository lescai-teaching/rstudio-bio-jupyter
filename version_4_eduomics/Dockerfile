FROM mambaorg/micromamba:1.5.10-noble

COPY --chown=$MAMBA_USER:$MAMBA_USER conda_env.yml /tmp/conda.yml

RUN micromamba install -y -n base -f /tmp/conda.yml \
    && micromamba install -y -n base conda-forge::procps-ng \
    && micromamba env export --name base --explicit > environment.lock \
    && echo ">> CONDA_LOCK_START" \
    && cat environment.lock \
    && echo "<< CONDA_LOCK_END" \
    && micromamba clean -a -y

USER root
ENV PATH="$MAMBA_ROOT_PREFIX/bin:$PATH"

RUN apt-get update && \
    apt-get install -y gdebi-core wget && \
    wget https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2025.09.1-401-amd64.deb && \
    gdebi rstudio-server-2025.09.1-401-amd64.deb && \
    rm rstudio-server-2025.09.1-401-amd64.deb

RUN useradd gitpod
RUN echo "gitpod:rstudio" | chpasswd
RUN usermod -aG sudo gitpod

RUN apt-get install libharfbuzz-dev libfribidi-dev -y

RUN echo "gitpod:rstudio" | chpasswd
RUN usermod -aG sudo gitpod

RUN apt-get install libharfbuzz-dev libfribidi-dev -y

RUN pip install --no-cache-dir jupyter-rsession-proxy==2.1.0

COPY init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh

USER gitpod
WORKDIR /home/gitpod

ENTRYPOINT [ "/usr/local/bin/init.sh" ]


