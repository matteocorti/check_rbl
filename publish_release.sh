#!/bin/sh

VERSION=$( grep "our\ \$VERSION\ =\ " check_rbl | sed "s/^[^']*'\([0-9.]*\)';/\1/" )

echo 'Did you update the RELEASE_NOTES.md? '
read -r ANSWER
if [ "x${ANSWER}" = "xy" ] ; then

    perl Makefile.PL
    make dist
    gh release create "v${VERSION}" --title "check_rbl-${VERSION}" --notes-file RELEASE_NOTES.md "check_rbl-${VERSION}.tar.gz"

fi
