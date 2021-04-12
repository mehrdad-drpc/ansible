#!/bin/bash

rm -rf provision

# get project name
echo "Enter your project name:"  
read project_name  

# make provision directory
mkdir provision
cd provision

# make host inventory
mkdir inventory
touch inventory/hosts
cat << EOF > ./inventory/hosts
[hostlist1]
[hostlist2]
EOF

# make project file
touch $project_name.yml
cat << EOF > $project_name.yml
- host: <<host_name>>
  roles:
    - $project_name
EOF

# make roles direcory with all subdirectories
mkdir -p roles/$project_name

mkdir roles/$project_name/vars
touch roles/$project_name/vars/main.yml

mkdir roles/$project_name/defaults
touch roles/$project_name/defaults/main.yml

mkdir roles/$project_name/tasks
touch roles/$project_name/tasks/main.yml

mkdir roles/$project_name/handlers
touch roles/$project_name/handlers/main.yml

mkdir roles/$project_name/meta
touch roles/$project_name/meta/main.yml

mkdir roles/$project_name/file

mkdir roles/$project_name/templates



