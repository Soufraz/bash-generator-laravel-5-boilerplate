#!/bin/bash
# A simple Shell script to remove basic files module for laravel-5-boilerplate project
# https://github.com/rappasoft/laravel-5-boilerplate
# Rafael Soufraz - 16/Sep/2015
#
# This script needs to be in directory app/generator/


plural_name=$1
singular_name=$2

# Checks if variable $plural_name was passed via param
if [ "$plural_name" == "" ]; then
    echo "Usage: ./remove.sh plural_name singular_name"
    exit
fi

# Checks if variable $singular_name was passed via param
if [ "$singular_name" == "" ]; then
    echo "Usage: ./remove.sh plural_name singular_name"
    exit
fi


modules=$plural_name
module=$singular_name
Modules="${modules^}"
Module="${module^}"

# Remove module folders
rm -r ../app/Http/Requests/Backend/"$Module"
rm -r ../app/Repositories/Backend/"$Module"
rm -r ../app/Services/"$Module"

# Remove module files
rm ../app/"$Module".php
rm ../app/Http/Controllers/Backend/"$Module"Controller.php
rm ../app/Http/Requests/Backend/"$Module"/Create"$Module"Request.php
rm ../app/Http/Requests/Backend/"$Module"/Update"$Module"Request.php
rm ../app/Http/Routes/Backend/"$Modules".php
rm ../app/Providers/"$Module"ServiceProvider.php
rm ../app/Repositories/Backend/"$Module"/"$Module"Contract.php
rm ../app/Repositories/Backend/"$Module"/Eloquent"$Module"Repository.php
rm ../app/Services/"$Module"/Traits/"$Module"Attributes.php