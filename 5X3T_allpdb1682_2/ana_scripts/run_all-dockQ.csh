#!/bin/csh
#
source /home/abonvin/haddock2.4/haddock_configure.csh
set WDIR=/home/svkeulen/projects/evcomplex_2021/5_docking/1_runs/allpdb1682_2/ana_scripts
cd $1/structures/it1/water
$WDIR/run_dockQ.csh 
cd ..
$WDIR/run_dockQ.csh 
cd ../it0
$WDIR/run_dockQ.csh 
cd ../../../

exit:





