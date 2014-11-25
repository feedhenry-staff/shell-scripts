#!/bin/bash
#
############################################################
#
# .weinre.sh
#
# Script will automatically detect `en0` ip address property
# and pass to a function to start a weirne service for on
# device debugging of cordova based hybird apps
#
############################################################

# start weirne by passing network ip
function start {

    # Variables
    ip=$(ipconfig getifaddr en0)

    # check if ip is set
    if [ "$ip" != "" ]; then
      printf "\n\n"
      echo "$(tput setaf 6)******************************** Starting weinre *******************************$(tput sgr0)"
      printf "\n"

      weinre --boundHost $ip --debug

      printf "\n"
      echo "$(tput setaf 6)******************************** Closing weinre ********************************$(tput sgr0)"
      printf "\n\n"
    else
      printf "\n\n"
      echo "$(tput setaf 1)*************************** Error ****************************$(tput sgr0)"
      printf "\n"

      echo "$(tput setaf 1)IP address could not be determined.$(tput sgr0)"
      printf "\n"
      echo "$(tput setaf 1)Please check that you have a network connection and try again.$(tput sgr0)"

      printf "\n"
      echo "$(tput setaf 1)**************************************************************$(tput sgr0)"
      printf "\n\n"
    fi
}

# invoke
start