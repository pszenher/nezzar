#!/usr/bin/env bash

set -o errexit -o pipefail -o nounset

image_format="qcow2"
vm_memory="16G"

disk_image=$(
    guix time-machine -C "devel-channel.scm" \
	 -- \
	 system image "vm-devel-config.scm" --image-type="${image_format}"
	  )
disk_image_copy="/tmp/${disk_image##*/}"

cp "${disk_image}" "${disk_image_copy}"
chmod "644" "${disk_image_copy}"

exec \
    guix shell qemu \
    -- \
    qemu-system-x86_64 \
    -machine "accel=kvm" \
    -smp     "8" \
    -cpu     "host" \
    -drive   "index=1,file=${disk_image_copy},format=${image_format}" \
    -net     "none" \
    -m       "${vm_memory}"
