# Sectigo [Certificate Transparency](http://www.certificate-transparency.org/) Logs: Accepted Roots

Sectigo's CT logs are powered by [Trillian](https://github.com/google/trillian) with the [Trillian CT personality](https://github.com/google/certificate-transparency-go#trillian-ct-personality).

Our first generation logs use Trillian's MySQL backend with a MariaDB database, whereas our second generation logs use Trillian's PostgreSQL backend with a PostgreSQL database.

## Production logs

Our production logs accept all root certificates that are trusted for the server authentication trust purpose in one or more of the Microsoft, Mozilla, Chrome, Apple, and 360 Browser root programs.

[Mammoth](crt/mammoth) and [Sabre](crt/sabre) are our first generation production logs, currently included in the Chrome and Apple log programs.

[Elephant](crt/elephant) and [Tiger](crt/tiger) are our second generation production logs, currently awaiting inclusion in the Chrome and Apple log programs.

## Non-Production logs

Our non-production logs accept all root certificates that are trusted for any trust purpose in one or more of the Microsoft, Mozilla, Chrome, Apple, 360 Browser, Java, and Android root programs, as well as various roots that are no longer trusted or are known to CCADB but not yet trusted.

[Dodo](crt/dodo) is our first generation non-production log.

[Dumbo](crt/dumbo) is our second generation non-production log.

## Test logs

Our test logs accept root certificates that are not publicly trusted and that have been submitted by community members.

[Dodo](crt/dodo) is also our first generation test log. We no longer accept Pull Requests to add other root certificates to Dodo.

[Tigger](crt/tigger) is our second generation test log. We welcome [Pull Requests to add other root certificates](CONTRIBUTING.md) to Tigger.
