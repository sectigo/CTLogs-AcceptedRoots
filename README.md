# Comodo [Certificate Transparency](http://www.certificate-transparency.org/) Logs: Accepted Roots
Comodo's CT logs are powered by [ct-server](https://github.com/google/certificate-transparency).

[Comodo Mammoth](crt/mammoth) and [Comodo Sabre](crt/sabre) are our production logs, which accept all root certificates that are trusted for the server authentication trust purpose in one or more of the Microsoft, Mozilla and Apple root programs.

[Comodo Dodo](crt/dodo) is our test log, which accepts all root certificates that are trusted for any trust purpose in one or more of the Microsoft, Mozilla and Apple root programs, as well as various roots that are no longer trusted or are not yet trusted. Note that we welcome and will consider [Pull Requests to add other root certificates](CONTRIBUTING.md) to Dodo.
