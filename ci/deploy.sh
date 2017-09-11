#!/bin/bash
set -eo pipefail

if [ -z $CIRCLE_TAG ]
then
    echo "Skipping deploy: Git tag not found"
    exit 0
fi

if [ -z $GITHUB_TOKEN ]
then
    echo "Skipping deploy: GitHub token not found"
    exit 0
fi

echo "Publishing pre-release $CIRCLE_TAG"

github-release release \
    --user okode \
    --repo spring-boot-war \
    --tag $CIRCLE_TAG \
    --name $CIRCLE_TAG \
    --description $CIRCLE_TAG \
    --pre-release

cd output
echo "Uploading artifacts:"
ls -1
parallel github-release upload \
    --user okode \
    --repo spring-boot-war \
    --tag $CIRCLE_TAG \
    --name {} \
    --file {} ::: *
cd -
