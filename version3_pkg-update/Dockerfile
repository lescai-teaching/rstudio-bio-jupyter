FROM ghcr.io/lescai-teaching/rstudio-bio-jupyter:2.1.0

USER root
ENV MAMBA_ROOT_PREFIX /usr/local

RUN Rscript -e 'BiocManager::install(version = "3.18", update=FALSE, ask=FALSE)'
RUN Rscript -e 'BiocManager::install(c("clusterProfiler", "DOSE", "pheatmap"))'

RUN micromamba remove -y -n base jupyterlab \
    && micromamba install -y -n base conda-forge::jupyterlab=4.2.5 \
    && micromamba clean -a -y

RUN pip install --no-cache-dir jupyter-rsession-proxy --upgrade

COPY init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh

USER gitpod

ENTRYPOINT [ "/usr/local/bin/init.sh" ]