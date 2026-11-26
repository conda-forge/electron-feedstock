#!/bin/bash
set -euxo pipefail

mkdir -p "${PREFIX}/lib" "${PREFIX}/bin"
# cp -a keeps the symlinks inside Electron.app's frameworks on macOS.
cp -a "${SRC_DIR}/electron" "${PREFIX}/lib/electron"

if [[ "${target_platform}" == osx-* ]]; then
  ln -s ../lib/electron/Electron.app/Contents/MacOS/Electron "${PREFIX}/bin/electron"
else
  ln -s ../lib/electron/electron "${PREFIX}/bin/electron"
fi

