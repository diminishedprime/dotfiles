#!/bin/bash

python -mplatform | grep -qi Ubuntu && PLATFORM="ubuntu"
python -mplatform | grep -qi Darwin && PLATFORM="darwin"

if [ "$PLATFORM" == "ubuntu" ]
then
    echo "This is running ubuntu"
fi

if [ "$PLATFORM" == "darwin" ]
then
    echo "This is running darwin"
fi
