#!/bin/bash

# Sync libraries from this repository to another. This script makes it easier to keep core external library versions and
# configuration up-to-date. It contains a list of libraries whose contents are dictated by this repository. When run, it
# removes the destination's version of these libraries and copies its own version to the destination. The WORKSPACE file
# in the destination directory is not maintained via this script. To keep the WORKSPACE file in sync, load the
# core_library_deps.bzl script as it is done in the WORKSPACE file in this repository.

if [[ $# -eq 1 ]]
then
    SRC_DIR="."
    DEST_DIR="$1"
elif [[ $# -eq 2 ]]
then
    SRC_DIR="$1"
    DEST_DIR="$2"
else
    # Print usage.
    echo -e "Usage: $0 [source_directory] destination_directory"
    echo -e "\tsource_directory defaults to the current directory"
    exit 1
fi

# Normalize the directories to full paths. If this is omitted, DEST_DIR handling is inconsistent. Sometimes, it will
# refer to a directory relative to the working directory of the script, and in other places, it will refer to a
# directory relative to the SRC_DIR.
SRC_DIR=$(cd "$SRC_DIR"; pwd)
DEST_DIR=$(cd "$DEST_DIR"; pwd)

declare -a CORE_LIBRARIES=("third_party/absl" "third_party/gflags" "third_party/glog" "third_party/gtest" "third_party/protobuf" ".github/workflows")

for library in ${CORE_LIBRARIES[@]}
do
    rm -rf "${DEST_DIR}/${library}"
    cd "$SRC_DIR"; find "$library" -type f | xargs tar cf - | (cd "$DEST_DIR"; tar xf -)
done

echo -e "Synced."
