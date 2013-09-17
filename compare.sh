#!/bin/sh

cat pathmap.txt | sed 's|~|'"$HOME"'|' | xargs -n 2 meld

