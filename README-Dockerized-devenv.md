# Dockerized angular devenv

## Table of Contents

1.  [Description](#description)
1.  [Create a new app](#create-a-new-app)
1.  [First things first](#first-things-first)
1.  [Start the app](#start-the-app)
1.  [Install new dependencies](#install-new-dependencies)
1.  [Prettier & eslint](#prettier-&-eslint)
1.  [Angular update](#angular-update)

## Description

⚠️ This is just a small personal project to play around with angular.

Provides a simple dockerized angular development environement.

The idea is to have everything necessary to create and develop an angular application without installing any of it locally.

Instead npm, node, angular cli, etc. are installed and run in a docker container.

Additionally, the current directory is a mounted volume of the docker container to allow the container to:

- write files (e.g. needed to install dependencies required for the app)
- read and see file changes done locally (e.g. needed to watch files changes with ng serve).

To work, this only uses 2 files from this repository:

- `Dockerfile`<br>
_If you modify this file do not forget to run: `./dockerized-devenv.sh build`_
- `dockerized-devenv.sh` <br>
_This script is a simple wrapper around `docker run` to ease its usage._
<br>It should be adapted for each project created from this repository

## Create a new app

1. Create a folder with the name of the angular app and get the 2 files mentioned above in that folder<br>
_You can for example fork this repository_
1. Run `./dockerized-devenv.sh quick-start`
1. Your new app is created & served, you can naviguate to `http://localhost:4200/`

Alternatively, you can run the commands one by one:
1. Build the docker container `./dockerized-devenv.sh build`
1. Run `./dockerized-devenv.sh new`<br>
_If you want to use different options, you can use<br>
`./dockerized-devenv.sh ng new [NAME] [OPTIONS]`_
1. If you want you can install Prettier & eslint with `./dockerized-devenv.sh init`<br>
_(or install them like any other dependency, see below)<br>
This repository already contains basic configuration files for both. If you don't want to use pretier and/or eslint, simply ignore or delete those files._

After creating a new project, removing the `quick-start` && ``new` options fron `./dockerized-devenv.sh` would make sense.

## First things first

If you did not create an app directly with this repository & did not do it manually yet:<br>
Build the docker container with `./dockerized-devenv.sh build`

## Start the app

Run `./dockerized-devenv.sh serve`

## Install new dependencies

Run `./dockerized-devenv.sh npm install [DEPENDENCY]`

## Run the tests

Run `./dockerized-devenv.sh test`

## Prettier & eslint

Run respectively `./dockerized-devenv.sh prettier` or `./dockerized-devenv.sh lint`

## Angular update

1. Update the angular cli version used in `Dockerfile`
1. If needed also update the node version used in `Dockerfile`
1. Run `./dockerized-devenv.sh update [ANGULAR VERSION]`
