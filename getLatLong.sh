#!/bin/bash - 
#===============================================================================
#
#          FILE: getLatLong.sh
# 
#         USAGE: ./getLatLong.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 12/08/2017 14:30
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
cat ~/data/accDeath.csv | gsed 's/(\([.0-9]\+\), \([-.0-9]\+\))\"$/","\1","\2"/' > accDeathsed.csv

