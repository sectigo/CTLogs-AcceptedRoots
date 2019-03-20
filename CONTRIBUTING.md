# Adding a root certificate to a Sectigo CT log
To submit root certificate(s) for possible acceptance by the [Sectigo Dodo](crt/dodo) test log, please fork this repository and submit a Pull Request:
- Each root certificate should be in its own PEM file in the crt/dodo/not_trusted directory.
- Each filename should be the SHA-256 hash of the DER encoding of the certificate, expressed as an UPPER-CASE hex string with the extension ".crt".

For all enquiries about the root certificates accepted by [Sectigo Mammoth](crt/mammoth) and [Sectigo Sabre](crt/sabre), please email ctops@sectigo.com.
