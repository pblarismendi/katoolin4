#!/bin/bash

source "conf.sh";

PROGRAM_PREFIX="";

# If the installation directory is not in PATH issue a warning:
if ! echo $PATH | grep -q "$DIR";
then
    echo "Warning: '$DIR' is not in your PATH.";
    echo "         To use this program add '$DIR'";
    echo "         to your PATH or manually copy";
    echo "         katoolin4.py somewhere.";
    echo;
    PROGRAM_PREFIX="$DIR/";
fi

# Check if shebang from katoolin4.py can execute:
/usr/bin/env python3 -V >/dev/null || die "Please install 'python3'";
/usr/bin/env paru -V >/dev/null || die "Please install 'paru'";

# Install all dependencies:
paru -Sy python-pacman || die;

sudo install -T -g root -o root -m 555 ./katoolin4.py "$DIR/$PROGRAM" || die;

echo "Successfully installed."
echo "Run it with 'sudo $PROGRAM_PREFIX$PROGRAM'.";
exit 0;
