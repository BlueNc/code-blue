#!/bin/bash
UPDATE_CA=${UPDATE_CA:-false}
if [[ "${UPDATE_CA,,}" =~ true ]]; then
  sudo update-ca-certificates
fi
