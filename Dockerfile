FROM ghcr.io/lescai-teaching/rstudio-bio-jupyter:2.0.0

USER root 

RUN apt-get update && \
    apt-get install -y git

USER rstudio

CMD ["sudo rstudio-server start"]

