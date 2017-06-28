#!/bin/bash

cd crt/dodo

# Get a list (from the crt.sh DB) of the SHA-256 hashes of all of the roots that are currently trusted (but not for the server authentication trust purpose)by the Apple, Microsoft and Mozilla root programs.  These roots will be accepted by Dodo but not by Mammoth or Sabre.
# TODO: Expose this data via https://crt.sh/
psql -c "\COPY (SELECT upper(encode(digest(c.CERTIFICATE, 'sha256'), 'hex')) FROM root_trust_purpose rtp, ca_certificate cac, certificate c WHERE rtp.TRUST_CONTEXT_ID IN (1, 5, 12) AND rtp.CERTIFICATE_ID = cac.CERTIFICATE_ID AND cac.CERTIFICATE_ID = c.ID GROUP BY digest(c.CERTIFICATE, 'sha256') HAVING min(TRUST_PURPOSE_ID) > 1 ORDER BY min(get_ca_name_attribute(cac.CA_ID))) TO '__roots_sha256_not_serverauth__.sh'"

sed -i "s/^/wget --content-disposition \"https:\/\/crt.sh\/?d=/g" __roots_sha256_not_serverauth__.sh
sed -i "s/$/\"/g" __roots_sha256_not_serverauth__.sh
chmod 755 __roots_sha256_not_serverauth__.sh
./__roots_sha256_not_serverauth__.sh
rm __roots_sha256_not_serverauth__.sh
