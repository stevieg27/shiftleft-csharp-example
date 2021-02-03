#!/usr/bin/env bash

docker build -t docker-test --build-arg BRANCH=master --build-arg SHIFTLEFT_ORG_ID=$SHIFTLEFT_ORG_ID --build-arg SHIFTLEFT_ACCESS_TOKEN=$SHIFTLEFT_ACCESS_TOKEN .
