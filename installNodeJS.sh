#!/bin/sh

######################################
#
# Ricardo Di Zio @ricdizio
#
# https://github.com/ricdizio
#
######################################
#This script only works with OS Ubunutu

###########################
# Script Init
###########################

cd /;
echo "starting script () ...";
verify="$(node -v)";

r="Command 'node' not found, did you mean:

  command 'node' from deb nodejs

Try: apt install <deb name>
";
########## WE VERIFY THAT NODE JS IS NOT INSTALLED
if [ "$verify" != "v10.15.3" ]; then
    ##NOT INSTALLED
    if [ ! -f "/node-v10.15.3-linux-x64.tar.xz" ]; 
        then
        wget https://nodejs.org/dist/v10.15.3/node-v10.15.3-linux-x64.tar.xz; -O /node-v10.15.3-linux-x64.tar.xz
        tar -xf node-v10.15.3-linux-x64.tar.xz --directory /usr/local --strip-components 1
    fi;
    if [ ! -h "/usr/bin/node" ]; 
        then 
        ln -s /usr/local/bin/node /usr/bin/node; 
        echo "Creating symbolic link /usr/local/bin/node > /usr/bin/node";
    fi;
    if [ ! -h "/usr/lib/node_modules" ]; 
        then 
        ln -s /usr/local/lib/node_modules /usr/lib/node_modules; 
        echo "Creating symbolic link /usr/local/lib/node_modules > /usr/lib/node_modules";
    fi;
    if [ ! -h "/usr/bin/npm" ]; 
        then 
        ln -s /usr/local/bin/npm /usr/bin/npm; 
        echo "Creating symbolic link /usr/local/bin/npm > /usr/bin/npm";
    fi;
    if [ ! -h "/usr/bin/npx" ]; 
        then 
        ln -s /usr/local/bin/npx /usr/bin/npx; 
        echo "Creating symbolic link /usr/local/bin/npx > /usr/bin/npx";
    fi;
    echo "Node js was installed";

else
    echo "Node JS ${verificar} installed";
fi
