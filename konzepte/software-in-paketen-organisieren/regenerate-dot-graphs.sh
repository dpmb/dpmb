#!/bin/sh

# Simple script to regenerate dot files and PMGs of package dependency graphs

set -e

DIR=$(dirname $0)
for pkg in dpkg apt aptitude; do
    debtree --no-recommends --no-provides --no-conflicts $pkg > $DIR/$pkg.dot
    dot -Tpng < $DIR/$pkg.dot > $DIR/$pkg.png
done
