#!/bin/bash
sudo rstudio-server start
jupyter lab --ip 0.0.0.0 --no-browser --NotebookApp.token='' --NotebookApp.password=''