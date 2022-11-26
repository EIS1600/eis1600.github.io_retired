"""
1. remove old docs folder
2. move theme_stack/public to docs
3. remove duplicate files from docs
"""

import os, shutil

pathToWebsite = "./docs/"
pathToFreshWebsite = "./theme_stack/public/"

# REMOVING OLD

shutil.rmtree(pathToWebsite)
print("DOCS folder has been deleted.")

# MOVING IN NEW
shutil.move(pathToFreshWebsite, pathToWebsite)
print("DOCS folder has been replaced with newly generated content.")

# CLEANING 

suffixes = ("_AR", "_DE", "_EN", "_FA", "_RU")
suffAR = ("_DE", "_EN", "_FA", "_RU")
suffDE = ("_AR", "_EN", "_FA", "_RU")
suffEN = ("_AR", "_DE", "_FA", "_RU")
suffFA = ("_AR", "_DE", "_EN", "_RU")
suffRU = ("_AR", "_DE", "_EN", "_FA")

for root, dirs, files in os.walk(pathToWebsite):
    for dir in dirs:
        folder = os.path.join(root, dir)
        if "/ar/" in folder:
            if folder.endswith(suffAR):
                shutil.rmtree(folder)
        elif "/de/" in folder:
            if folder.endswith(suffDE):
                shutil.rmtree(folder)
        elif "/en/" in folder:
            if folder.endswith(suffEN):
                shutil.rmtree(folder)
        elif "/fa/" in folder:
            if folder.endswith(suffFA):
                shutil.rmtree(folder)
        elif "/ru/" in folder:
            if folder.endswith(suffRU):
                shutil.rmtree(folder)
        else:
            if folder.endswith(suffEN):
                shutil.rmtree(folder)


print("DOCS folder has been cleaned.")

# git add . && git commit -m "website automatic update" && git push
os.system("git add . && git commit -m 'website automatic update' && git push")
print("WEBSITE has been pushed to GITHUB.")