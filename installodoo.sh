#!/bin/bash
sudo apt-get update
sudo apt-get upgrade -y

# Install postgresql from apt repo

sudo apt-get install git python3 python3-pip build-essential wget python3-dev python3-venv python3-wheel libxslt-dev libzip-dev libldap2-dev libsasl2-dev python3-setuptools node-less libjpeg-dev gdebi -y


sudo apt-get install libpq-dev python-dev libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev libffi-dev
pip install psycopg2-binary

sudo apt-get install xfonts-75dpi

sudo wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.bionic_amd64.deb

sudo dpkg -i wkhtmltox_0.12.6-1.bionic_amd64.deb

sudo cp /usr/local/bin/wkhtmltoimage  /usr/bin/wkhtmltoimage

sudo cp /usr/local/bin/wkhtmltopdf  /usr/bin/wkhtmltopdf
