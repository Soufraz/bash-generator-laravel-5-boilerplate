#!/bin/bash
# A simple Shell script to create basic files module for laravel 5 boilerplate project
# https://github.com/rappasoft/laravel-5-boilerplate
# Rafael Soufraz - 16/Sep/2015
#
# This script needs to be in directory app/generator/

plural_name=$1
singular_name=$2

# Checks if variable $plural_name was passed via param
if [ "$plural_name" == "" ]; then
    echo "Usage: ./go.sh plural_name singular_name"
    exit
fi

# Checks if variable $singular_name was passed via param
if [ "$singular_name" == "" ]; then
    echo "Usage: ./go.sh plural_name singular_name"
    exit
fi


modules=$plural_name
module=$singular_name
Modules="${modules^}"
Module="${module^}"

# Extract files to generator folder
tar -zxvf __BASE__.tar.gz

# Find and replace in all php files on current folder
for i in *.php; do
    sed -i -- "s/__Modules__/$Modules/g" $i
    sed -i -- "s/__Module__/$Module/g" $i
    sed -i -- "s/__modules__/$modules/g" $i
    sed -i -- "s/__module__/$module/g" $i
done

# Rename php files on current folder to name of module
find . -name '*__Module__*' -exec bash -c 'mv $0 ${0/__Module__/'$Module'}' {} \;

# Create required folders
mkdir -p ../app/Http/Requests/Backend/"$Module"
mkdir -p ../app/Repositories/Backend/"$Module"
mkdir -p ../app/Services/"$Module"/Traits

# Move module files to project
mv "$Module".php                        ../app/"$Module".php
mv "$Module"Controller.php              ../app/Http/Controllers/Backend/"$Module"Controller.php
mv Create"$Module"Request.php           ../app/Http/Requests/Backend/"$Module"/Create"$Module"Request.php
mv Update"$Module"Request.php           ../app/Http/Requests/Backend/"$Module"/Update"$Module"Request.php
mv "$Modules".php                       ../app/Http/Routes/Backend/"$Modules".php
mv "$Module"ServiceProvider.php         ../app/Providers/"$Module"ServiceProvider.php
mv "$Module"Contract.php                ../app/Repositories/Backend/"$Module"/"$Module"Contract.php
mv Eloquent"$Module"Repository.php      ../app/Repositories/Backend/"$Module"/Eloquent"$Module"Repository.php
mv "$Module"Attributes.php              ../app/Services/"$Module"/Traits/"$Module"Attributes.php