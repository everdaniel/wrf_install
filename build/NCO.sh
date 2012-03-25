#!/bin/bash
#
#    File: NCO.sh
#  Author: Yagnesh Raghava Yakkala <yagnesh@NOSPAM.live.com>
# Created: Thursday, December  1 2011
#

. $appsdir/NCO.env
cd $WRF_BASE/src/${DIR}

for dep in ${DEP[@]}; do        # soruce dep envs
    source $appsdir/$dep.env
done

export NETCDF4_ROOT
export NETCDF_INC
export NETCDF_LIB

./configure \
    --prefix=$NCO_ROOT \
    --enable-fortran \
    --enable-netcdf4 \
    --enable-udunits2 \
    --enable-mpi \
    --disable-dap-netcdf | tee ${APP}.${COMP}.config

make clean 2>&1 | tee ${APP}.${COMP}.clean
make 2>&1 | tee ${APP}.${COMP}.make
make check 2>&1 | tee ${APP}.${COMP}.check
make install 2>&1 | tee ${APP}.${COMP}.install

# NCO.sh ends here
