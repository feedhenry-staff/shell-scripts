#!/bin/bash

#################################################################
#
# Script to signing Xcode Archive via Terminal
#
#################################################################

set -e

function xCodeSigning {
    xcodebuild clean -project "$PROJECTNAME.xcodeproj" -configuration Release -alltargets
    xcodebuild archive -project "$PROJECTNAME.xcodeproj" -scheme "$SCHEMENAME" -archivePath "$PROJECTNAME.xcarchive"
    xcodebuild -exportArchive -archivePath "$PROJECTNAME.xcarchive" -exportPath "$PROJECTNAME" -exportFormat ipa -exportProvisioningProfile "$PROFILENAME"
}

function exitMessage {
    printf '\n'
    echo "$(tput setaf 6)************************************  Bye  Bye  ***********************************$(tput sgr0)"
    printf '\n'
    exit 1
}

function build {

    PROJECTNAME=$1
    SCHEMENAME=$2
    PROFILENAME=$3
    CONTINUE="YES"

    printf '\n'
    echo "$(tput setaf 6)***************** Checking if all required params have been set  ******************$(tput sgr0)";
    printf '\n'

     if [[ -z "$PROJECTNAME" ]] ;
        then
        echo "Cannot find project name. Please pass a Project name as the first Parameter."
        exitMessage
    elif [[ -z "$SCHEMENAME" ]] ;
        then
        echo "Cannot find Xcode Schema name. Please pass a Schema name as the second Parameter."
        exitMessage
    elif [[ -z "$PROFILENAME" ]] ;
        then
        echo "Cannot find vaild Provision Profile. Please pass name of provisioning as the thrid Parameter."
        exitMessage
    else
        for var in PROJECTNAME SCHEMENAME PROFILENAME ; do
            if [ -n "${!var}" ] ;
                then
                echo "$var is set to ${!var}"
            else
                echo "$var is not set"
                CONTINUE="NO"
            fi
        done
    fi

    printf '\n'
    echo "$(tput setaf 6)*********************** Attempting to sign the .ipa binary file now.  ***********************$(tput sgr0)"
    printf '\n'

    if [ "$CONTINUE" = "YES" ];
        then
        xCodeSigning
        exitMessage
    else
        exitMessage
    fi
}

build $1 $2 $3

