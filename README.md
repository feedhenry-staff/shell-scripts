FH Shell Scripts
====

###ipa-build.sh

Script to build and sign `.ipa` binary via the terminal.

Place file in the same directory as your Xcode Project

Initially you will need to make file executable. To do this enter the following;

```bash
chmod 755 ./ipa-build.sh
```
Then to build and sign from directory of Xcode project enter the following;

```bash
./ipa-build.sh ProjectName SchemaName ProvisioningProfileName
```

###weinre.sh

Simple script to start a Weinre Server locally for debuging Client Apps on device.

Script will automatically detect IP address on network and pass to weinre command.

DO NOT FORGET TO ADD SCRIPT TAG TO INDEX.HTML

Initially you will need to make file executable. To do this enter the following;

```bash
chmod 755 ./weinre.sh
```
Then to start server enter the following;

```bash
./weinre.sh 
```
