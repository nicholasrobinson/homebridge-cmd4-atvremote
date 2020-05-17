#!/bin/bash

# Script for controlling MRP AppleTV using postlund/pyatv atvremote.
# Usage: bash MrpAppleTVRemote.sh Set <TV_COMMANDS> On true

if [ "$1" = "Get" ]; then
   # Stateless switch is always off
   echo "0"
   exit 0
fi

if [ "$1" = "Set" ]; then
   if [ "$3" = "On" ]; then
      if [ "$4" = "true" ]; then
         # Execute send_dmap_or_mrp_commands.py
         ./send_dmap_commands.py "MRP Apple TV" "<IP_ADDRESS>" "<IDENTIFIER_FROM_SCAN>" "$2" "<MRP_PORT>"
         exit $?
      else
         # There is no turning off a command
         exit 0
      fi
   fi
fi

exit -1

