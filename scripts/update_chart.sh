#!/bin/bash

set -o pipefail

[[ "${#}" == "3" ]] || {
    echo "Please give the chart name, the update type and the new digest as only arguments"
    exit 3
}

CHART="$1"
UPDATE_TYPE="$2"
NEW_DIGEST="$3"

version="$(awk '/^version:/ {print $2}' "charts/${CHART}/Chart.yaml")"
echo "Old version is ${version}"
major="$(echo "${version}" | cut -d. -f1)"
minor="$(echo "${version}" | cut -d. -f2)"
patch="$(echo "${version}" | cut -d. -f3)"

if [[ "${UPDATE_TYPE}" =~ (digest) ]]
then
  patch="$(( patch + 1 ))"
else
  echo "This script only supports updating the image digest, aborting..."
  exit 99
fi

newversion="${major}.${minor}.${patch}"
echo "New version is ${newversion}"

# change version in Chart.yaml
sed -i "s/^version:.*/version: ${newversion}/g" "charts/${CHART}/Chart.yaml"

# change artifacthub annotation in Chart.yaml
sed -i "s/- kind: .*$/- kind: changed/g" "charts/${CHART}/Chart.yaml"
sed -i "/kind/ {n; s/description:.*/description: update excalidraw digest to ${NEW_DIGEST}/g}" "charts/${CHART}/Chart.yaml"

# change version in README.md
sed -i "s/\[Version:.*\]/[Version: ${newversion}]/g" "charts/${CHART}/README.md"
sed -i "s/Version-.*-informational/Version-${newversion}-informational/g" "charts/${CHART}/README.md"
