#!/bin/bash

set -o pipefail

[[ "${#}" == "1" ]] || {
    echo "Please give the update type as only argument"
    exit 3
}

UPDATE_TYPE="$1"

version="$(awk '/^version:/ {print $2}' "Chart.yaml")"
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
sed -i "s/^version:.*/version: ${newversion}/g" "Chart.yaml"
