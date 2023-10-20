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
for folder in $(find $pathToWebsite -type d -name "*_AR" -o -name "*_DE" -o -name "*_EN" -o -name "*_FA" -o -name "*_RU"); do
    if [[ $folder == *"/ar/"* && ! $folder == *"_AR" ]]; then
        rm -rf "$folder"
    elif [[ $folder == *"/de/"* && ! $folder == *"_DE" ]]; then
        rm -rf "$folder"
    elif [[ $folder == *"/en/"* && ! $folder == *"_EN" ]]; then
        rm -rf "$folder"
    elif [[ $folder == *"/fa/"* && ! $folder == *"_FA" ]]; then
        rm -rf "$folder"
    elif [[ $folder == *"/ru/"* && ! $folder == *"_RU" ]]; then
        rm -rf "$folder"
    fi
done



echo "- the new DOCS folder has been cleaned."

# Pushing to GITHUB
git add . && git commit -m "website automatic update" && git push
echo "- WEBSITE has been pushed to GITHUB."
