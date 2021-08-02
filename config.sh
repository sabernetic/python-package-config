#!/bin/bash
cp .pypirc $HOME/
mkdir -p $HOME/.pip
cp pip.conf $HOME/.pip/
export token=$(aws codeartifact get-authorization-token --domain hishab --domain-owner 140370042521 --query authorizationToken --output text)
pip config set global.index-url https://aws:$token@hishab-140370042521.d.codeartifact.us-east-1.amazonaws.com/pypi/mypy/simple/
