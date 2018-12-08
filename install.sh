#!/bin/bash

# Created by Alex Bettarini on 25 Nov 2018
# Copyright © 2018 Alex Bettarini. All rights reserved.

pushd "Miele Plugin.xctemplate"
if [ -e MieleAPI.framework.zip ]; then
unzip MieleAPI.framework.zip
rm "MieleAPI.framework.zip"
fi
if [ -d __MACOSX ]; then
rm -r __MACOSX
fi
popd
        
GROUP=Custom

SRC_DIR=$(realpath "./Miele Plugin.xctemplate")

DST_DIR1=$(realpath "$HOME/Library/Developer/Xcode")/Templates
DST_DIR2=/Library/Developer/Xcode/Templates
DST_DIR=$DST_DIR1

mkdir -p $DST_DIR/$GROUP

export TEMPLATE="Miele Plugin.xctemplate"

if [ ! -d "$DST_DIR/$GROUP/$TEMPLATE" ]; then
cp -r "$TEMPLATE" "$DST_DIR/$GROUP/$TEMPLATE"
fi
