#!/usr/bin/env bash

touch ~/.pip-freeze

python3 -m pip freeze | while read line ; do

if ! grep -q "$line" ~/.pip-freeze && [[  "$(echo $line | tr '[:upper:]' '[:lower:]')" != mycfg* ]]; then
    echo "$line" >> ~/.pip-freeze
fi

done
