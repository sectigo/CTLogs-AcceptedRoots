# Adding a root certificate to a Comodo CT log
To submit root certificate(s) for possible acceptance by the [Comodo Dodo](crt/dodo) test log, please fork this repository and submit a Pull Request:
- Each root certificate should be in its own PEM file in the crt/dodo/not_or_no_longer_trusted directory.
- Each filename should be the SHA-256 hash of the certificate (expressed as an UPPER-CASE hex string) with the extension ".crt".

For all enquiries about the root certificates accepted by [Comodo Mammoth](crt/mammoth) and [Comodo Sabre](crt/sabre), please email ctops@comodo.com.
