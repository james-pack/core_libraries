#!/bin/bash


if [[ $# -eq 1 ]]
then
    SRC_DIR="."
    DEST_DIR="$1"
elif [[ $# -eq 2 ]]
then
    SRC_DIR="$1"
    DEST_DIR="$2"
else
    echo "Usage: $0 [source_directory] destination_directory"
    exit 1
fi

DEST_DIR="${DEST_DIR%/}"
SRC_DIR="${SRC_DIR%/}"

declare -a CORE_LIBRARIES=("third_party/gflags" "third_party/glog" "third_party/gtest" ".github")

pushd "$SRC_DIR" > /dev/null
for library in ${CORE_LIBRARIES[@]}
do
    rm -rf "${DEST_DIR}/${library}"
    find "${library}" -type f | xargs tar cf - | (cd "$DEST_DIR"; tar xf -)
done

echo "Synced."
popd > /dev/null

