#!/bin/bash

PYTHON_VERSION="2.7"
NUMPY_VERSION="1.6"         # 1.6 works for 2.7, 1.7 works for 3.3, 1.8 for 3.4
SKIMAGE_VERSION="0.10.0"        # version of scikits-image to build wheel for

set -x
# Install miniconda 
# comment this block out for local builds.
wget http://repo.continuum.io/miniconda/Miniconda-3.5.2-MacOSX-x86_64.sh \
    -O miniconda.sh
chmod +x miniconda.sh
./miniconda.sh -b
ls -la
ls -la ~
export PATH=/Users/travis/miniconda/bin:$PATH
conda update --yes conda

# create a conda environment with the necessary Python modules for a build
conda create --yes -n build_env python=$PYTHON_VERSION
source activate build_env
conda install --yes setuptools pip numpy=$NUMPY_VERSION six cython
python --version

# Download the the scikits-image release files
mkdir tmp
cd tmp

#cp ../v${SKIMAGE_VERSION}.tar.gz .  # testing locally
wget --no-check-certificate \
    https://pypi.python.org/packages/source/s/scikit-image/scikit-image-${VERSION}.tar.gz \
    -O v${VERSION}.tar.gz
tar xfz v${SKIMAGE_VERSION}.tar.gz
cd scikit-image-${SKIMAGE_VERSION}/

# build the wheel
echo "Building scikits-image wheel for Python: $PYTHON_VERSION"
pip install wheel
python setup.py bdist_wheel

mv dist/*.whl ../../.

# clean up
cd ../..
rm -r tmp
source deactivate
