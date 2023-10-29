#!/usr/bin/env bash

CUR_GUIX_COMMIT=$(guix describe -f json \
		      | jq -r '.[] | select(.name == "guix").commit')

echo ${CUR_GUIX_COMMIT}
