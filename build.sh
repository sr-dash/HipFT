#!/bin/bash
#################################################################
#
# Build script template for HipFT.
#
# See the build scripts in the "/build_examples" 
# folder for examples of what to insert here.
# Please do not edit this file, rather copy it to a new 
# file with your own configuration options inserted.
# If your configuration is unique, feel free to add it to the 
# /build_examples folder.
# Note that your build script must be launched from 
# this lowest level directory (not from the build_examples folder).
#
#################################################################
# "mpif90" is assumed to be in your PATH and points to 
# your chosen MPI library/compiler.
#################################################################
#
#################################################################
# Please set the location of the HDF5 include & library files. 
# Make sure the HDF5 LIBRARY is COMPILED with 
# the SAME COMPILER used here, and is in the run-time environment.
#################################################################

HDF5_INCLUDE_DIR=
HDF5_LIB_DIR=

##################################################################
# Please set the HDF5 linker flags to match the installed version.
##################################################################

HDF5_LIB_FLAGS=

###########################################################################
# Please set the compile flags based on your compiler and hardware setup.
###########################################################################

FFLAGS=

###########################################################################
#             END OF USER CONFIG.  DO NOT EDIT BELOW.                     #
###########################################################################
###########################################################################
###########################################################################
###########################################################################
###########################################################################
###########################################################################

HIPFT_HOME=$PWD

cd ${HIPFT_HOME}/src
cp Makefile.template Makefile
sed -i "s#<FFLAGS>#${FFLAGS}#g" Makefile
sed -i "s#<HDF5_INCLUDE_DIR>#${HDF5_INCLUDE_DIR}#g" Makefile
sed -i "s#<HDF5_LIB_DIR>#${HDF5_LIB_DIR}#g" Makefile
sed -i "s#<HDF5_LIB_FLAGS>#${HDF5_LIB_FLAGS}#g" Makefile
echo "make 1>build.log 2>build.err"
make 1>build.log 2>build.err

echo "cp ${HIPFT_HOME}/src/hipft ${HIPFT_HOME}/bin/hipft"
cp ${HIPFT_HOME}/src/hipft ${HIPFT_HOME}/bin/hipft

