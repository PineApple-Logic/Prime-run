#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: prime-run <command> [args...]"
    echo "Example: prime-run /usr/bin/steam"
    exit 1
fi

echo "Launching '$@' using dedicated NVIDIA GPU."

"$@" safely passes all arguments (including spaces/special characters) to the command.
__NV_PRIME_RENDER_OFFLOAD=1 \
__GLX_VENDOR_LIBRARY_NAME=nvidia \
__VK_LAYER_NV_optimus=VULKAN_GLES_OFFLOAD \
exec "$@"
