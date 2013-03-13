#!/bin/sh

# A setup script to allow deployment of Python-based resources on any Unix 
# platform (although only Mac OSX and Debian are currently supported).



# Set failure mode (http://stackoverflow.com/questions/821396/aborting-a-shell-script-if-any-command-returns-a-non-zero-value)
set -e

# Executables
PYTHON="/usr/bin/env python"
PIP="pip"
PYTHON_PACKAGES="numpy scipy matplotlib pandas boto"
REQUIRED_TOOLS="python make"

# Versions
PIP_VERSION=1.2.1

# Sources
PYTHON_PACKAGE_SOURCE=https://pypi.python.org/packages/source

# Functions
check_available ()
{
    tool_name=${1}
    command -v ${tool_name} >/dev/null 2>&1 || { 
        echo "${tool_name} is not available; please install before proceeding."
        exit 1
    }
}

# Check if user is root
if [ "$(id -u)" != "0" ]; then
   echo "This setup utility must be run as root." 1>&2
   exit 1
fi

# Platform-based utility installation
platform_name=`uname`
command -v ${PIP} >/dev/null 2>&1 || { 
    echo "Installing Python pip." 1>&2
 
    if [[ "${platform_name}" == 'Darwin' ]]; then
        # Platform is Mac OSX
        
        # PIP Installation (makes all subsequent package management easier)
        pip_archive=pip-${PIP_VERSION}
        cd ~
        curl -o ${pip_archive}.tar.gz ${PYTHON_PACKAGE_SOURCE}/p/pip/pip-${PIP_VERSION}.tar.gz
        tar -xf ${pip_archive}.tar.gz
        rm ${pip_archive}.tar.gz
        
        cd pip-${PIP_VERSION}
        ${PYTHON} setup.py install
        rm -r ~/${pip_archive}
        
        # Check that other tools are available
        for tool in ${REQUIRED_TOOLS}; do
            check_available ${tool}
        done
        
    elif [[ "${platform_name}" == 'Linux' ]]; then
        sudo apt-get install ${REQUIRED_TOOLS} python-pip
    else
        echo "System platform '${platform_name}' not recognized; aborting." 1>&2
        exit 1
    fi
    
    echo "Pip installed."
}

# Install a bunch of packages!
# Packages are retrieved from the setup.py file one directory up.
for package in ${PYTHON_PACKAGES}; do
    ${PIP} install --upgrade ${package}
done

# Finalization
echo "Setup complete!" 1>&2

