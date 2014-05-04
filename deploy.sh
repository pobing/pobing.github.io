#!/bin/sh

cd  `pwd`
rm -rf blog/
mkdir blog && cp -r  stage/_site/ blog/