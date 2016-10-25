#!/bin/bash

# Include local path
if [[ -d ${HOME}/.local/bin ]]; then
    export PATH=${HOME}/.local/bin:${PATH}
fi
