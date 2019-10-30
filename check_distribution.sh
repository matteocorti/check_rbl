#!/bin/sh

PERL_FILES="check_rbl t/*.t"
FILES="${PERL_FILES} AUTHORS COPYING COPYRIGHT Changes INSTALL Makefile.PL NEWS README.md TODO check_distribution.sh"

echo "Perl::Critic"
echo "============"
echo
perlcritic -1 ${PERL_FILES}
echo

echo "Formatting errors: tabs"
echo "======================="
echo
grep --line-number '\t' ${FILES}
echo

echo "Formatting errors: blanks at the end of line"
echo "============================================"
echo
grep --line-number '[[:blank:]]$' ${FILES}
echo

YEAR=$( date +"%Y" )
echo "Copyright"
echo "========="
echo
echo '### README.md'
grep  "(c) Matteo Corti, 2009-${YEAR}" README.md
echo '### COPYRIGHT'
grep "Copyright (c) 2009-${YEAR} Matteo Corti" COPYRIGHT
echo '### check_rbl'
grep "Copyright (c) 2009-${YEAR} Matteo Corti <matteo@corti.li>" check_rbl
echo
