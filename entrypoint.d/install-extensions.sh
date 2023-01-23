#!/bin/sh
if [ "${EXTENSIONS-}" ]; then
  for extension in $EXTENSIONS; do 
    /usr/bin/code-server --install-extension "$extension"
  done
fi
