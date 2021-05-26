#!/bin/bash

deploy_dir="deploy"
deploy_repo="https://github.com/paralect/ship-deploy"

api_koa_dir="api"
api_koa_repo="https://github.com/paralect/koa-api-starter"

web_react_dir="web"
web_react_repo="https://github.com/paralect/react-starter"

filesToRemove=( ".drone.yml"
                "docker-compose.yml"
                "docker-compose.test.yml"
                "LICENSE"
                "CHANGELOG.md"
                "CODE_OF_CONDUCT.md"
                ".all-contributorsrc"
                "CONTRIBUTING.md"
                "SHIP_README.md" )

function installService() {
  repo="$1"
  dir="$2"

  cd ../../"$dir"

    echo $1
  shopt -s dotglob
  rm -rf *

  git clone --quiet "$repo" .
  rm -rf .git "${filesToRemove[@]}"
}

case "$1" in
  "$deploy_dir")
    installService "$deploy_repo" "$deploy_dir"
  ;;
  "$api_koa_dir")
    installService "$api_koa_repo" "$api_koa_dir"
  ;;
  "$web_react_dir")
    installService "$web_react_repo" "$web_react_dir"
  ;;
esac
