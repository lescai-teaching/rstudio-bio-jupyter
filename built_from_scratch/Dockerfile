FROM gitpod/workspace-full

ENV MAMBA_ROOT_PREFIX /usr/local
RUN brew install micromamba

USER root

COPY conda_env.yml /tmp/conda_env.yml

RUN micromamba install -y -n base -f /tmp/conda_env.yml \
    && micromamba install -y -n base conda-forge::procps-ng \
    && micromamba clean -a -y

RUN apt-get update && \
    apt-get install -y gdebi-core wget && \
    wget https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2023.09.1-494-amd64.deb && \
    gdebi -n rstudio-server-2023.09.1-494-amd64.deb && \
    rm rstudio-server-2023.09.1-494-amd64.deb

RUN echo "gitpod:rstudio" | chpasswd
RUN usermod -aG sudo gitpod

RUN apt-get install libharfbuzz-dev libfribidi-dev -y

RUN Rscript -e "remotes::install_github('YuLab-SMU/ggtree')"

COPY install_packages.R install_packages.R
RUN wget https://www.bioconductor.org/packages/3.12/data/annotation/src/contrib/org.Hs.eg.db_3.12.0.tar.gz
RUN wget https://bioconductor.statistik.tu-dortmund.de/packages/3.12/bioc/src/contrib/AnnotationDbi_1.52.0.tar.gz
RUN wget https://bioconductor.statistik.tu-dortmund.de/packages/3.12/bioc/src/contrib/clusterProfiler_3.18.1.tar.gz
RUN wget https://bioconductor.org/packages/3.12/data/annotation/src/contrib/DO.db_2.9.tar.gz
RUN wget https://bioconductor.statistik.tu-dortmund.de/packages/3.12/bioc/src/contrib/DOSE_3.16.0.tar.gz
RUN wget https://cran.r-project.org/src/contrib/Archive/rvcheck/rvcheck_0.1.8.tar.gz
RUN Rscript install_packages.R
RUN rm *.tar.gz
RUN rm install_packages.R

RUN pip install --no-cache-dir jupyter-rsession-proxy==2.1.0

USER gitpod
WORKDIR /home/gitpod
