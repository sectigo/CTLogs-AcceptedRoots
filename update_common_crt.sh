#!/bin/bash

cd crt/common/trusted
rm *.crt
TMPFILE=`mktemp`

# Get a list (from the crt.sh DB) of the SHA-256 hashes of all of the roots that are currently enabled for the server authentication trust purpose in one or more of the Microsoft, Mozilla, Chrome, Apple, and 360 Browser root programs.
psql -h crt.sh -p 5432 -U guest certwatch -c "\COPY (SELECT 'echo ' || upper(encode(c.CERTIFICATE, 'hex')) || ' | xxd -r -ps | openssl x509 -inform der -out ' || upper(encode(digest(c.CERTIFICATE, 'sha256'), 'hex')) || '.crt' FROM root_trust_purpose rtp, ca_certificate cac, certificate c WHERE rtp.TRUST_CONTEXT_ID IN (1, 5, 6, 12, 25) AND rtp.TRUST_PURPOSE_ID = 1 and rtp.CERTIFICATE_ID = cac.CERTIFICATE_ID AND cac.CERTIFICATE_ID = c.ID GROUP BY c.CERTIFICATE ORDER BY min(get_ca_name_attribute(cac.CA_ID))) TO $TMPFILE"
bash $TMPFILE

rm $TMPFILE
