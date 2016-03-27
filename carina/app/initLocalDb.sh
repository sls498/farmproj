#!/bin/bash
## Pre-Requisites:
## install mysql-server and mysql-client
## run in bash: mysql -u root -p
## in mysql create the DB: CREATE DATABASE guestbook;
## in mysql create the user: CREATE USER "guestbook-admin"@"%" IDENTIFIED BY "${MYSQL_PASSWORD FROM pythonwebapp-mysql-prod.env}";
## in mysql grant user privs: GRANT ALL PRIVILEGES ON guestbook.* TO 'guestbook-admin'@'%' WITH GRANT OPTION;
## in mysql flush mysql privs: FLUSH PRIVILEGES;

export MYSQL_DATABASE="guestbook"
export MYSQL_HOST="localhost"
# source the values for USER and PASSWORD
source ../pythonwebapp-mysql-prod.env
# export the sourced values
export MYSQL_USER
export MYSQL_PASSWORD

# if we don't have a virtualenv, make one
if [ ! -d "py3env" ]; then
	# in case it's a file
	rm -rf py3env
	# assumes you have python 3.x installed on your OS in /usr/bin/python3
	virtualenv -p /usr/bin/python3 py3env
fi
# activate virtualenv
source py3env/bin/activate
# make sure we have the latest pip
pip install --upgrade pip
# get the requirements
pip install -r requirements.txt
# run it like on the cluster
python app.py create_db
