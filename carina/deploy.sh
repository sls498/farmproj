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
# safety check for static files
IS_STATIC_ROOT_STILL_SET="`grep -o "^STATIC_ROOT" app/settings.py`"
if [ "$IS_STATIC_ROOT_STILL_SET" != "STATIC_ROOT" ]; then
        echo "STATIC_ROOT is NOT set for production in app/settings.py!"
        exit
fi
# install pip requirements
pip install --upgrade -r requirements.txt
# get django to collect all static files
python manage.py collectstatic --noinput
cd ..
# remove any old static files from last deployment from lb src
rm -rf lb/static
# copy over the static content to the lb source dir
cp -R app/static lb/.
# remove the collected static files from static (keep our custom ones)
rm -rf app/static/admin
# build
docker-compose build
# run in background
docker-compose up -d
# get ip for lb
docker-compose port lb 80
# exit python virtualenv
deactivate
