#! /usr/bin/env bash

DEFAULT_PARAM=$2

if [ "${DEFAULT_PARAM}x" == "x" ]
then
  DEFAULT_PARAM="SOME DEFAULT PARAMS"
fi

case $1 in
  "setup")
    vagrant up --provision
  ;;

  "test")
    ssh_login "echo test"
  ;;

  "production")
    echo "Production commands"
  ;;

  "development")
    ssh_login "echo development"
  ;;

  "nuke")
    vagrant destroy --force
  ;;

  *)
    echo "Invalid Command"
  ;;
esac


function ssh_login {
  vagrant up
  vagrant ssh -c "cd /vagrant/ && ${1}"
}
