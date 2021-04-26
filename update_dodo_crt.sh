#!/bin/bash

# Get a list (from the crt.sh DB) of the SHA-256 hashes of:
#   - All of the roots that are currently trusted (but not for the server authentication trust purpose) by one or more of the 360, Apple, Microsoft and Mozilla root programs.
#   - All of the roots that are currently trusted (for any purpose) by the Java or Android root programs, but not trusted by 360, Apple, Microsoft or Mozilla.
# These roots will be accepted by Dodo but not by Mammoth or Sabre.
cd crt/dodo/trusted_but_not_for_serverauth
rm *.crt
psql -h crt.sh -p 5432 -U guest certwatch -c "\COPY (SELECT upper(encode(digest(c.CERTIFICATE, 'sha256'), 'hex')) FROM root_trust_purpose rtp, ca_certificate cac, certificate c WHERE rtp.TRUST_CONTEXT_ID IN (25, 12, 1, 5) AND rtp.CERTIFICATE_ID = cac.CERTIFICATE_ID AND cac.CERTIFICATE_ID = c.ID GROUP BY digest(c.CERTIFICATE, 'sha256') HAVING min(TRUST_PURPOSE_ID) > 1 ORDER BY min(get_ca_name_attribute(cac.CA_ID))) TO '__roots_sha256_not_serverauth_part1__.sh'"
psql -h crt.sh -p 5432 -U guest certwatch -c "\COPY (SELECT upper(encode(digest(c.CERTIFICATE, 'sha256'), 'hex')) FROM root_trust_purpose rtp, ca_certificate cac, certificate c WHERE rtp.TRUST_CONTEXT_ID IN (17, 23) AND NOT EXISTS (SELECT 1 FROM root_trust_purpose rtp2 WHERE rtp2.CERTIFICATE_ID = rtp.CERTIFICATE_ID AND rtp2.TRUST_CONTEXT_ID IN (25, 12, 1, 5)) AND rtp.CERTIFICATE_ID = cac.CERTIFICATE_ID AND cac.CERTIFICATE_ID = c.ID GROUP BY digest(c.CERTIFICATE, 'sha256') ORDER BY min(get_ca_name_attribute(cac.CA_ID))) TO '__roots_sha256_not_serverauth_part2__.sh'"
cat __roots_sha256_not_serverauth_part1__.sh __roots_sha256_not_serverauth_part2__.sh > __roots_sha256_not_serverauth__.sh
sed -i "s/^/wget --content-disposition \"https:\/\/crt.sh\/?d=/g" __roots_sha256_not_serverauth__.sh
sed -i "s/$/\"/g" __roots_sha256_not_serverauth__.sh
chmod 755 __roots_sha256_not_serverauth__.sh
./__roots_sha256_not_serverauth__.sh
rm __roots_sha256_not_serverauth_*

# Get a list (from the crt.sh DB) of the SHA-256 hashes of:
#   - All of the roots that are in the CCADB but are not trusted by any of the root programs mentioned previously.
# These roots will be accepted by Dodo but not by Mammoth or Sabre.
cd ../in_ccadb_but_not_trusted
rm *.crt
psql -h crt.sh -p 5432 -U guest certwatch -c "\COPY (SELECT upper(encode(digest(c.CERTIFICATE, 'sha256'), 'hex')) FROM ccadb_certificate cc, certificate c WHERE cc.CERT_RECORD_TYPE = 'Root Certificate' AND cc.CERTIFICATE_ID = c.ID AND NOT EXISTS (SELECT 1 FROM root_trust_purpose rtp WHERE rtp.CERTIFICATE_ID = c.ID AND rtp.TRUST_CONTEXT_ID IN (25, 12, 1, 5, 17, 23))) TO '__roots_sha256_in_ccadb_but_not_trusted__.sh'"
sed -i "s/^/wget --content-disposition \"https:\/\/crt.sh\/?d=/g" __roots_sha256_in_ccadb_but_not_trusted__.sh
sed -i "s/$/\"/g" __roots_sha256_in_ccadb_but_not_trusted__.sh
chmod 755 __roots_sha256_in_ccadb_but_not_trusted__.sh
./__roots_sha256_in_ccadb_but_not_trusted__.sh
rm __roots_sha256_in_ccadb_but_not_trusted__.sh
