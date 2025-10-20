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
    apt-get install -y --no-install-recommends \
        gdebi-core \
        libfribidi-dev \
        libharfbuzz-dev \
        sudo \
        wget \
        git \
        git-lfs && \
    wget https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2025.09.1-401-amd64.deb && \
    gdebi -n rstudio-server-2025.09.1-401-amd64.deb && \
    rm rstudio-server-2025.09.1-401-amd64.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash gitpod && \
    echo "gitpod:rstudio" | chpasswd && \
    usermod -aG sudo gitpod && \
    echo "gitpod ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/gitpod && \
    chmod 0440 /etc/sudoers.d/gitpod

RUN micromamba run -n base pip install --no-cache-dir jupyter-rsession-proxy==2.1.0

# overwrite default config to point rstudio server to the R path installed under conda
COPY rserver.conf /etc/rstudio/rserver.conf

COPY init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh

USER gitpod
WORKDIR /home/gitpod

ENTRYPOINT [ "/usr/local/bin/init.sh" ]


