#!/bin/bash

odoo_version="odoo15"
instance_name="go15"

# Dirs
proj_dir="/opt/$odoo_version/projects/$instance_name/"
data_dir="${proj_dir}data"
config_dir="/etc/odoo/${instance_name}"
custom_dir="${proj_dir}custom"
enterprise_dir="${proj_dir}enterprise"

mkdir -p $data_dir $custom_dir $config_dir
chmod 777 $data_dir



####################################
# Change The Port In Config File !!!
####################################



#configuration files
ln /usr/bin/python3 /usr/bin/$instance_name
cp -a odoo.conf $config_dir/$instance_name.conf
cp -a service.service /etc/systemd/system/$instance_name.service

# setup config file
sed -i "s/youssef/${instance_name}/g" /etc/odoo/${instance_name}/$instance_name.conf
sed -i "s/odoo_version/${odoo_version}/g" /etc/odoo/${instance_name}/$instance_name.conf

# setup systemd service
sed -i "s/youssef/${instance_name}/g" /etc/systemd/system/$instance_name.service
sed -i "s/odoo_version/${odoo_version}/g" /etc/systemd/system/$instance_name.service
systemctl daemon-reload

# create postgres user
su -c "createuser -d ${instance_name}" postgres

# create system user for instance
useradd -d $proj_dir -s /bin/nologin -G odoo $instance_name
