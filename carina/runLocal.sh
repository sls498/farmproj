#!/bin/bash
## Pre-Requisites:
## install mysql-server and mysql-client
## run in bash: mysql -u root -p
## in mysql create the DB: CREATE DATABASE ${MYSQL_DATABASE};
## in mysql create the user: CREATE USER "${MYSQL_USER}"@"%" IDENTIFIED BY "${MYSQL_PASSWORD}";
## in mysql grant user privs: GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION;
## in mysql flush mysql privs: FLUSH PRIVILEGES;

## NOTE: Remember to init the DB (run initLocalDb.sh) if it's the first time you start the app locally after creating the DB, or you'll get a HTTP Error!

export MYSQL_DATABASE="farm"
export MYSQL_HOST="localhost"
# source the values for USER and PASSWORD
source farm-mysql-prod.env
# export the sourced values
export MYSQL_USER
export MYSQL_PASSWORD

# if we don't have a virtualenv, make one
if [ ! -d ".py3env" ]; then
	# in case it's a file
	rm -rf .py3env
	# assumes you have python 3.x installed on your OS in /usr/bin/python3
	virtualenv -p /usr/bin/python3 .py3env
fi
# activate virtualenv
source .py3env/bin/activate
# go to app directory
cd app
# make sure we have the latest pip
pip install --upgrade pip
# get the requirements
pip install -r requirements.txt
# safety check for static files
IS_STATIC_ROOT_STILL_SET="`grep -o "^STATIC_ROOT" app/settings.py`"
if [ "$IS_STATIC_ROOT_STILL_SET" == "STATIC_ROOT" ]; then
	echo "$IS_STATIC_ROOT_STILL_SET is still set for production in app/settings.py!"
else
	# run it in development mode so that django serves the static files!
	python manage.py runserver 0.0.0.0:8000
fi
