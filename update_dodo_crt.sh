#!/bin/bash

# Get a list (from the crt.sh DB) of the SHA-256 hashes of:
#   - All of the roots that are currently "trusted" for server authentication, but with a "disabled from" date in the past or a "not before until" date more than 398 days ago, by one of the Microsoft, Mozilla, Chrome, Apple, or 360 Browser root programs.
#   - All of the roots that are currently trusted (but not for the server authentication trust purpose) by one or more of the Microsoft, Mozilla, Chrome, Apple, and 360 Browser root programs.
#   - All of the roots that are currently trusted (for any purpose) by the Java or Android root programs, but not trusted by Microsoft, Mozilla, Chrome, Apple, or 360 Browser.
# These roots will be accepted by Dodo but not by Mammoth or Sabre.
cd crt/dodo/trusted_but_not_for_serverauth
rm *.crt
TMPFILE=`mktemp`
ERRORFILE=`mktemp`

cat <<SQL | tr -d '\n' | psql -h crt.sh -p 5432 -U guest -d certwatch -v ON_ERROR_STOP=1 -X 2>$ERRORFILE
\COPY (
SELECT 'echo ' || upper(encode(c.CERTIFICATE, 'hex')) || ' | xxd -r -ps | openssl x509 -inform der -out ' || upper(encode(digest(c.CERTIFICATE, 'sha256'), 'hex')) || '.crt'
  FROM root_trust_purpose rtp, ca_certificate cac, certificate c
  WHERE rtp.TRUST_CONTEXT_ID IN (1, 5, 6, 12, 25)
    AND rtp.TRUST_PURPOSE_ID = 1
    AND rtp.CERTIFICATE_ID = cac.CERTIFICATE_ID
    AND cac.CERTIFICATE_ID = c.ID
  GROUP BY c.CERTIFICATE
  HAVING (
    'now' AT TIME ZONE 'UTC' >= max(coalesce(rtp.DISABLED_FROM, 'infinity'::timestamp))
    OR 'now' AT TIME ZONE 'UTC' - interval '398 days' >= max(coalesce(rtp.NOTBEFORE_UNTIL, 'infinity'::timestamp))
  )
  ORDER BY min(get_ca_name_attribute(cac.CA_ID))
) TO $TMPFILE
SQL

RESULT=$?
if [ "$RESULT" -eq "0" ]; then
  bash $TMPFILE
else
  cat $ERRORFILE
fi

cat <<SQL | tr -d '\n' | psql -h crt.sh -p 5432 -U guest -d certwatch -v ON_ERROR_STOP=1 -X 2>$ERRORFILE
\COPY (
SELECT 'echo ' || upper(encode(c.CERTIFICATE, 'hex')) || ' | xxd -r -ps | openssl x509 -inform der -out ' || upper(encode(digest(c.CERTIFICATE, 'sha256'), 'hex')) || '.crt'
  FROM root_trust_purpose rtp, ca_certificate cac, certificate c
  WHERE rtp.TRUST_CONTEXT_ID IN (1, 5, 6, 12, 25)
    AND rtp.CERTIFICATE_ID = cac.CERTIFICATE_ID
    AND cac.CERTIFICATE_ID = c.ID
  GROUP BY c.CERTIFICATE
  HAVING min(TRUST_PURPOSE_ID) > 1
  ORDER BY min(get_ca_name_attribute(cac.CA_ID))
) TO $TMPFILE
SQL

RESULT=$?
if [ "$RESULT" -eq "0" ]; then
  bash $TMPFILE
else
  cat $ERRORFILE
fi

cat <<SQL | tr -d '\n' | psql -h crt.sh -p 5432 -U guest -d certwatch -v ON_ERROR_STOP=1 -X 2>$ERRORFILE
\COPY (
SELECT 'echo ' || upper(encode(c.CERTIFICATE, 'hex')) || ' | xxd -r -ps | openssl x509 -inform der -out ' || upper(encode(digest(c.CERTIFICATE, 'sha256'), 'hex')) || '.crt'
  FROM root_trust_purpose rtp, ca_certificate cac, certificate c
  WHERE rtp.TRUST_CONTEXT_ID IN (17, 23)
    AND NOT EXISTS (
      SELECT 1
        FROM root_trust_purpose rtp2
        WHERE rtp2.CERTIFICATE_ID = rtp.CERTIFICATE_ID
          AND rtp2.TRUST_CONTEXT_ID IN (1, 5, 6, 12, 25)
    )
    AND rtp.CERTIFICATE_ID = cac.CERTIFICATE_ID
    AND cac.CERTIFICATE_ID = c.ID
  GROUP BY c.CERTIFICATE
  ORDER BY min(get_ca_name_attribute(cac.CA_ID))
) TO $TMPFILE
SQL

RESULT=$?
if [ "$RESULT" -eq "0" ]; then
  bash $TMPFILE
else
  cat $ERRORFILE
fi

# Get a list (from the crt.sh DB) of the SHA-256 hashes of:
#   - All of the roots that are in the CCADB but are not trusted by any of the root programs mentioned previously.
# These roots will be accepted by Dodo but not by Mammoth or Sabre.
cd ../in_ccadb_but_not_trusted
rm *.crt

cat <<SQL | tr -d '\n' | psql -h crt.sh -p 5432 -U guest -d certwatch -v ON_ERROR_STOP=1 -X 2>$ERRORFILE
\COPY (
SELECT 'echo ' || upper(encode(c.CERTIFICATE, 'hex')) || ' | xxd -r -ps | openssl x509 -inform der -out ' || upper(encode(digest(c.CERTIFICATE, 'sha256'), 'hex')) || '.crt'
  FROM ccadb_certificate cc, certificate c
  WHERE cc.CERT_RECORD_TYPE = 'Root Certificate'
    AND cc.CERTIFICATE_ID = c.ID
    AND NOT EXISTS (
      SELECT 1
        FROM root_trust_purpose rtp
        WHERE rtp.CERTIFICATE_ID = c.ID
          AND rtp.TRUST_CONTEXT_ID IN (1, 5, 6, 12, 25, 17, 23)
    )
) TO $TMPFILE
SQL

RESULT=$?
if [ "$RESULT" -eq "0" ]; then
  bash $TMPFILE
else
  cat $ERRORFILE
fi

rm $TMPFILE $ERRORFILE
