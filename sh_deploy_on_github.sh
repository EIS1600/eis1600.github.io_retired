#!/bin/bash

# Variables
pathToWebsite="./docs/"
pathToFreshWebsite="./theme_stack/public/"

# Generating the website using R's blogdown in the ./theme_stack/ directory
Rscript -e "setwd('./theme_stack/'); blogdown::build_site()"
echo "- Website generated using blogdown in ./theme_stack/ directory."

# REMOVING OLD
rm -rf $pathToWebsite
echo "- the old DOCS folder has been deleted."

# MOVING IN NEW
mv $pathToFreshWebsite $pathToWebsite
echo "- the DOCS folder has been replaced with newly generated content."

# CLEANING
for folder in $(find $pathToWebsite -type d); do
    if [[ $folder == *"/ar/"* ]]; then
        for suffix in "_DE" "_EN" "_FA" "_RU"; do
            [ -d "${folder}${suffix}" ] && rm -rf "${folder}${suffix}"
        done
    elif [[ $folder == *"/de/"* ]]; then
        for suffix in "_AR" "_EN" "_FA" "_RU"; do
            [ -d "${folder}${suffix}" ] && rm -rf "${folder}${suffix}"
        done
    elif [[ $folder == *"/en/"* ]]; then
        for suffix in "_AR" "_DE" "_FA" "_RU"; do
            [ -d "${folder}${suffix}" ] && rm -rf "${folder}${suffix}"
        done
    elif [[ $folder == *"/fa/"* ]]; then
        for suffix in "_AR" "_DE" "_EN" "_RU"; do
            [ -d "${folder}${suffix}" ] && rm -rf "${folder}${suffix}"
        done
    elif [[ $folder == *"/ru/"* ]]; then
        for suffix in "_AR" "_DE" "_EN" "_FA"; do
            [ -d "${folder}${suffix}" ] && rm -rf "${folder}${suffix}"
        done
    else
        for suffix in "_AR" "_DE" "_EN" "_FA" "_RU"; do
            [ -d "${folder}${suffix}" ] && rm -rf "${folder}${suffix}"
        done
    fi
done

echo "- the new DOCS folder has been cleaned."

# Pushing to GITHUB
git add . && git commit -m "website automatic update" && git push
echo "- WEBSITE has been pushed to GITHUB."
