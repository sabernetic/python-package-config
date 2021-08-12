#!/bin/bash
cp .pypirc $HOME/
mkdir -p $HOME/.pip
cp pip.conf $HOME/.pip/
export token=$(aws codeartifact get-authorization-token --domain sabernetic --domain-owner 538326023882 --query authorizationToken --output text)
pip config set global.index-url https://aws:$token@sabernetic-538326023882.d.codeartifact.us-east-1.amazonaws.com/pypi/mypy/simple/
