#!/usr/bin/env bash
set -euo pipefail

exec sudo rstudio-server start

exec jupyter lab \
    --ip 0.0.0.0 \
    --no-browser \
    --NotebookApp.token='' \
    --NotebookApp.password=''
