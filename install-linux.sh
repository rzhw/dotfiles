#!/bin/sh
pushd `dirname $0` > /dev/null
SCRIPTPATH=`pwd`
popd > /dev/null

# ======= COMMON =======
"$SCRIPTPATH"/install-unix-common.sh

# ======= COPYPASTA =======
echo "* Dependencies for copypasta"
if [ $(dpkg-query -W -f='${Status}' python-magic 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
    sudo apt-get install python-magic;
fi

echo "* Put this in .bashrc:"
echo "alias pbcopy='python $SCRIPTPATH/third_party/copypasta/copypasta.py'"

echo "* Done!"
