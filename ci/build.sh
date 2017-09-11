#!/bin/bash
set -eo pipefail

if [[ $CIRCLE_TAG ]]
then
    mkdir -p output
    ./gradlew war ear bootRepackage
    mv build/libs/*.ear output
    mv war/build/libs/*.war output
    mv war/build/libs/*.jar output
else
    ./gradlew check
fi

