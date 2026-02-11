# Adding a root certificate to our Test CT log
To submit root certificate(s) for possible acceptance by the [Tigger](crt/tigger) test log, please fork this repository and submit a Pull Request:
- Each root certificate should be in its own PEM file in the crt/tigger/not_trusted directory.
- Each filename should be the SHA-256 hash of the DER encoding of the certificate, expressed as an UPPER-CASE hex string with the extension ".crt".
- Please use Unix (LF) rather than DOS (CR/LF) line endings, and ensure that the file ends with a line feed character.

For all enquiries about the root certificates accepted by our production and non-production logs, please email ctops@sectigo.com.
