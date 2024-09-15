# docker buildx create --platform "linux/amd64,linux/arm64" --name multibuilder --use

docker buildx build \
--label org.opencontainers.image.title=rnaseq-rstudio-with-jupyter \
--label org.opencontainers.image.description='container for rnaseq analysis and RStudio DEseq2 in biology courses' \
--label org.opencontainers.image.url=https://github.com/lescai-teaching/rstudio-bio-jupyter \
--label org.opencontainers.image.source=https://github.com/lescai-teaching/rstudio-bio-jupyter \
--label org.opencontainers.image.version=3.0.0 \
--label org.opencontainers.image.created=2023-01-13T12:39:11.393Z \
--label org.opencontainers.image.licenses=MIT \
--platform linux/amd64 \
--tag ghcr.io/lescai-teaching/rstudio-bio-jupyter:3.0.0 \
--tag ghcr.io/lescai-teaching/rstudio-bio-jupyter:latest \
--push .