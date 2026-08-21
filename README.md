# Sectigo [Certificate Transparency](http://www.certificate-transparency.org/) Logs: Accepted Roots

Sectigo's CT logs are powered by the following software:

- RFC6962 logs: [Trillian](https://github.com/google/trillian) with the [Trillian CT personality](https://github.com/google/certificate-transparency-go#trillian-ct-personality).
- Static CT logs: [TesseraCT](https://github.com/transparency-dev/tesseract), which uses the [Tessera](https://github.com/transparency-dev/tessera) library.

Our first generation RFC6962 logs use Trillian's MySQL backend with a MariaDB database, whereas our second generation RFC6962 logs use Trillian's PostgreSQL backend with a PostgreSQL database. Our Static CT logs use the POSIX storage backend.

All of our logs are behind Cloudflare, and our RFC6962 logs use the [CF_CTile](https://github.com/sectigo/CF_CTile) caching proxy.

## Production logs

Our production logs accept all root certificates that are trusted for the server authentication trust purpose in one or more of the Microsoft, Mozilla, Chrome, Apple, and 360 Browser root programs.

[Mammoth](crt/mammoth) and [Sabre](crt/sabre) were our first generation production logs (RFC6962), currently included in the Chrome and Apple log programs, but no longer accepting entries.

[Elephant](crt/elephant) and [Tiger](crt/tiger) are our second generation production logs (RFC6962), currently included in the Chrome and Apple log programs.

[Monument](crt/monument) and [Statue](crt/statue) are our third generation production logs (Static CT), soon to be submitted for inclusion in the Chrome and Apple log programs.

## Non-Production logs

Our non-production logs accept various root certificates that are no longer trusted or are known to CCADB but not yet trusted. Our first and second generation non-production logs also accept(ed) all root certificates that are trusted for any trust purpose in one or more of the Microsoft, Mozilla, Chrome, Apple, 360 Browser, Java, and Android root programs.

[Dodo](crt/dodo) was our first generation non-production log (RFC6962).

[Dumbo](crt/dumbo) is our second generation non-production log (RFC6962).

[Standee](crt/standee) is our third generation non-production log (Static CT).

## Test logs

Our test logs accept root certificates that are not publicly trusted and that have been submitted by community members.

[Dodo](crt/dodo) was also our first generation test log (RFC6962).

[Tigger](crt/tigger) is our second generation test log (RFC6962). We welcome [Pull Requests to add other root certificates](CONTRIBUTING.md) to Tigger.
