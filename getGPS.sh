#!/bin/bash - 
#===============================================================================
#
#          FILE: getGPS.sh
# 
#         USAGE: ./getGPS.sh 1600 Pennsylvania Ave NW, Washington, DC 20006
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Bsdpunk, Dusty Carver
#  ORGANIZATION: 
#       CREATED: 12/08/2017 19:25
#      REVISION:  2
#===============================================================================

set -o nounset                              # Treat unset variables as an error
KEY=$(cat ~/.gmaps)
ARGARR="$@"

APPEND=''
for i in $ARGARR;
do
    APPEND="$APPEND$i+"
done
APPEND=$(printf $APPEND | gsed 's/,//g')

curl "https://maps.googleapis.com/maps/api/geocode/json?address=$APPEND&key$KEY"

