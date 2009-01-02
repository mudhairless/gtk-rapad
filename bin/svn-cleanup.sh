#!/bin/sh

for f in `find ../ -iname .svn`; do
    rm -rf $f
done

