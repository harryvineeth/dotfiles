#!/bin/bash

set -u
set -e

USERNAME=$(id -un $(logname))
USERGROUP=$(id -gn $(logname))

echo $USERNAME
echo $USERGROUP
