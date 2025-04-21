#!/bin/sh -ue

docker_build() {
  docker build . --tag angular-env --label prune-angular-env
  docker image prune --force --filter='label=prune-angular-env'}
}

docker_run() {
  docker run -it --rm \
    --user $(id -u):$(id -g) \
    -p 4200:4200 \
    -v ./:/angular-app \
    angular-env \
    $@
}

new_app() {
  NAME="$(basename $(pwd))"
  docker_run "ng new $NAME --directory ./ --skip-git"
}

init_dependencies() {
  docker_run "npm install eslint @eslint/js globals typescript-eslint prettier eslint-config-prettier --save-dev"
}

serve() {
  docker_run "ng serve --host 0.0.0.0 --port 4200"
}

case $1 in
quick-start)
  docker_build
  new_app
  init_dependencies
  serve
  ;;
build)
  docker_build
  ;;
new)
  docker_build
  new_app
  ;;
init)
  init_dependencies
  ;;
update)
  docker_build
  VERSION=$2
  docker_run "ng update @angular/cli@^$VERSION @angular/core@^$VERSION"
  ;;
i | install)
  docker_run "npm i"
  ;;
serve)
  serve
  ;;
test)
  docker_run "ng test"
  ;;
prettier)
  docker_run "npx prettier . --write"
  ;;
lint)
  docker_run "npx eslint"
  ;;
*)
  docker_run $@
  ;;
esac
