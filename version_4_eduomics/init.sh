#!/usr/bin/env bash
set -euo pipefail

sudo /usr/bin/rstudio-server start

exec jupyter lab \
    --ip 0.0.0.0 \
    --no-browser \
    --NotebookApp.token='' \
    --NotebookApp.password=''
