#!/bin/bash

set -o pipefail

[[ "${#}" == "2" ]] || {
    echo "Please give the chart name and the update type as only arguments"
    exit 3
}

CHART="$1"
UPDATE_TYPE="$2"

version="$(awk '/^version:/ {print $2}' "${CHART}/Chart.yaml")"
echo "Old version is ${version}"
major="$(echo "${version}" | cut -d. -f1)"
minor="$(echo "${version}" | cut -d. -f2)"
patch="$(echo "${version}" | cut -d. -f3)"

if [[ "${UPDATE_TYPE}" =~ (major|replacement) ]]
then
  major="$(( major + 1 ))"
  minor=0
  patch=0
elif [[ "${UPDATE_TYPE}" =~ (minor|pinDigest) ]]
then
  minor="$(( minor + 1 ))"
  patch=0
else
  patch="$(( patch + 1 ))"
fi

newversion="${major}.${minor}.${patch}"
echo "New version is ${newversion}"

# change version in Chart.yaml
sed -i "s/^version:.*/version: ${newversion}/g" "${CHART}/Chart.yaml"
