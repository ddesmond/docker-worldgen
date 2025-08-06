#!/bin/bash


updatedb
locate git | grep bin
/usr/bin/git lfs install

echo "deps 3d"
bash /setup/deps3d.sh