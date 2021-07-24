#!/bin/bash

function bold_echo {
  echo -e "\e[1m###### $1...\e[0m"
}

function success {
  echo -e "\e[42m\e[1m###### [DONE]\e[0m\e[49m"
}

function fail {
  echo -e "\e[41m\e[1m###### [FAILED]\e[0m\e[49m"
  exit 1
}

#rm -rf provision

bold_echo "get project name"
echo "Enter your project name:" || fail
read project_name || fail
success

bold_echo "make provision directory"
if [ ! -d "provision" ]; then
  mkdir provision
  cd provision || fail
else
  cd provision || fail
fi
success

bold_echo "make host inventory"
if [ ! -d "inventory" ]; then
  mkdir inventory || fail
  touch inventory/hosts || fail
  cat << EOF > ./inventory/hosts
    [hostlist1]
    [hostlist2]
EOF
else
  echo "directory 'inventory' already exists"
fi
success

bold_echo "make project file"
touch $project_name.yml || fail
cat << EOF > $project_name.yml
- name: something about your playbook
  hosts: <<host_name>>
  roles:
    - $project_name
  vars:
    key1: val1
    key2: val2
  become: true/false
EOF
success

bold_echo "make roles direcory with all subdirectories"
mkdir -p roles/$project_name || fail
success

bold_echo "make vars directory"
mkdir roles/$project_name/vars || fail
touch roles/$project_name/vars/main.yml || fail
success

bold_echo "make defualts directory"
mkdir roles/$project_name/defaults || fail
touch roles/$project_name/defaults/main.yml || fail
success

bold_echo "make tasks directory"
mkdir roles/$project_name/tasks || fail
touch roles/$project_name/tasks/main.yml || fail
success

bold_echo "make hanldlers directory"
mkdir roles/$project_name/handlers || fail
touch roles/$project_name/handlers/main.yml || fail
success

bold_echo "make meta directory"
mkdir roles/$project_name/meta || fail
touch roles/$project_name/meta/main.yml || fail
success

bold_echo "make file directory"
mkdir roles/$project_name/file || fail
success

bold_echo "make tamplates directory"
mkdir roles/$project_name/templates || fail
success
