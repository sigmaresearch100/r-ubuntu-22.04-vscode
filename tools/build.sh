#!/bin/bash

set -e

# vscode
apt-get update
apt-get install -y             \
    software-properties-common \
    apt-transport-https        \
    wget
wget -O- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /usr/share/keyrings/vscode.gpg
echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | tee /etc/apt/sources.list.d/vscode.list
apt-get update
apt-get install -y \
    code

# xml2 and systemfonts dependencies
apt-get install -y     \
    libxml2-dev        \
    libfontconfig1-dev

# requires xml2 with libxml2-dev
# requires systemfonts with libfontconfig1-dev
Rscript -e "                                                                                   \
    install.packages(                                                                          \
        c(                                                                                     \
            'languageserver',                                                                  \
            'httpgd'                                                                           \
        ),                                                                                     \
        repos = c(REPO_NAME = 'https://packagemanager.rstudio.com/all/__linux__/jammy/latest') \
    )                                                                                          \
"
