#!/bin/bash

TMPFILE=`mktemp`

echo "# Added"
echo "SELECT '- \"' || get_ca_name_attribute(cac.CA_ID) || '\" (https://crt.sh/?sha256=' || upper(encode(digest(c.CERTIFICATE, 'sha256'), 'hex')) || ')' FROM certificate c, ca_certificate cac WHERE c.ID = cac.CERTIFICATE_ID AND digest(c.CERTIFICATE, 'sha256') IN (" > $TMPFILE
git show tsv/elephant-ca-roots.tsv | grep "^+" | grep -v "^+++" | sed "s/\t.*\$//g" | sed "s/^+/E'\\\\\\\\x/g" | sed "s/\$/',/g" >> $TMPFILE
echo "NULL) ORDER BY get_ca_name_attribute(cac.CA_ID);" >> $TMPFILE

psql -X -h crt.sh -p 5432 -d certwatch -U guest -f $TMPFILE | sed "s/^ //g"

echo
echo "# Removed"
echo "SELECT '- \"' || get_ca_name_attribute(cac.CA_ID) || '\" (https://crt.sh/?sha256=' || upper(encode(digest(c.CERTIFICATE, 'sha256'), 'hex')) || ')' FROM certificate c, ca_certificate cac WHERE c.ID = cac.CERTIFICATE_ID AND digest(c.CERTIFICATE, 'sha256') IN (" > $TMPFILE
git show tsv/elephant-ca-roots.tsv | grep "^-" | grep -v "^---" | sed "s/\t.*\$//g" | sed "s/^-/E'\\\\\\\\x/g" | sed "s/\$/',/g" >> $TMPFILE
echo "NULL) ORDER BY get_ca_name_attribute(cac.CA_ID);" >> $TMPFILE

psql -X -h crt.sh -p 5432 -d certwatch -U guest -f $TMPFILE | sed "s/^ //g"

rm $TMPFILE
