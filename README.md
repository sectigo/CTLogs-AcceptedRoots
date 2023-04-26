# Sectigo [Certificate Transparency](http://www.certificate-transparency.org/) Logs: Accepted Roots
Sectigo's CT logs are powered by [Trillian](https://github.com/google/trillian) with the [Trillian CT personality](https://github.com/google/certificate-transparency-go#trillian-ct-personality).

[Sectigo Mammoth](crt/mammoth) and [Sectigo Sabre](crt/sabre) are our production logs, which accept all root certificates that are trusted for the server authentication trust purpose in one or more of the Microsoft, Mozilla, Chrome, Apple, and 360 Browser root programs.

[Sectigo Dodo](crt/dodo) is our non-production log, which accepts all root certificates that are trusted for any trust purpose in one or more of the Microsoft, Mozilla, Chrome, Apple, 360 Browser, Java, and Android root programs, as well as various roots that are no longer trusted or are not yet trusted. Note that we welcome and will consider [Pull Requests to add other root certificates](CONTRIBUTING.md) to Dodo.
