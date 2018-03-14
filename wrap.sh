#!/bin/bash
if [ -e package.json ]
then
    echo "/!\ package.json already exists."
    echo "/!\ Installation aborted."
    exit
else
  # copy files
  echo ""
  echo "Copying files..."
  echo ""
  curl -O https://raw.githubusercontent.com/monadicus/electron-wrap/master/package.json
  curl -O https://raw.githubusercontent.com/monadicus/electron-wrap/master/index.js
  curl -O https://raw.githubusercontent.com/monadicus/electron-wrap/master/icon.icns

  # replace name in package with current directory name
  name=${PWD##*/}
  sed -i '' "s/electron-wrap/$name/g" package.json

  # install dependencies
  echo ""
  echo "Installing node modules..."
  echo ""
  npm i

  # package the folder
  npm run package

  # cleanup
  rm package.json
  rm -rf node_modules
  rm index.js
  rm icon.icns
fi
