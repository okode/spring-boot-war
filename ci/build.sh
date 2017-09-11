#!/bin/bash
set -eo pipefail

if [[ $CIRCLE_TAG ]]
then
    mkdir -p output
    ./gradlew war ear bootRepackage
    mv build/libs/*.ear output/spring-boot-war-$CIRCLE_TAG.ear
    mv war/build/libs/*.war output/spring-boot-war-$CIRCLE_TAG.war
    mv war/build/libs/*.jar output/spring-boot-war-$CIRCLE_TAG.jar
else
    ./gradlew check
fi

