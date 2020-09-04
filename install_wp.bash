#!/bin/bash

echo "What is your new site's name?"

read sitename

if [ ! -d "$sitename" ]; 
then
    mkdir ${sitename}
    echo "Downloading latest version of WordPress..."
    curl -O https://wordpress.org/latest.tar.gz
    tar -xvf latest.tar.gz
    cp -r wordpress/* ${sitename}
    rm -r wordpress
    rm latest.tar.gz
else
    echo "Site already exists..."
fi

cd $sitename;

cp wp-config-sample.php wp-config.php

echo "What is your database name?"

read dbname

echo "Database Name: ${dbname}"

sed -i "s/database_name_here/${dbname}/g" wp-config.php

echo "What is your database username?"

read dbuser

echo "Database Username: ${dbuser}"

sed -i "s/username_here/${dbuser}/g" wp-config.php

echo "What is your database password?"

read dbpassword

echo "Database Username: ${dbpassword}"

sed -i "s/password_here/${dbpassword}/g" wp-config.php

echo "Installation complete!"


# Add git
# Install gulp
# reset password and username
