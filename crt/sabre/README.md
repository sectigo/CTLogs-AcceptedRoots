# Sectigo Sabre

## Policy

These logs accept all roots that are enabled for the Server Authentication trust purpose in one or more of the Microsoft, Mozilla, Chrome, Apple, and 360 Browser root programs.

We will update the list of accepted roots from time to time in accordance with this policy.

## Status

The original Sabre log is [included in Google Chrome since M60](https://issues.chromium.org/issues/41308606). It transitioned to Readonly in May 2024, and is due to be retired in June 2025.

The first [temporally-sharded Sabre logs](https://issues.chromium.org/issues/41308606#comment57) became Qualified in the Chrome and Apple CT log lists in September 2023, and progressed to Usable in November/December 2023.

[Tiger](../tiger) is intended to replace Sabre, so no further Sabre log shards are planned after 2026h2.

## Active log shards

| URL Prefix | Expiry Range<br>Start | Expiry Range<br>End | Public Key (base64) |
|------------|-----------------------|---------------------|---------------------|
| https://sabre2025h1.ct.sectigo.com | 2025-01-01T00:00:00Z | 2025-06-30T23:59:59Z | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQc`<br>`DQgAEfi858egjjrMyBK9NV/bbxXSkem`<br>`07B1EMWvuAMAXGWgzEdtYGqFdN+9/kg`<br>`pDCQa5wszGi4/o9XyxdBM20nVWrQQ==` |
| https://sabre2025h2.ct.sectigo.com | 2025-07-01T00:00:00Z | 2025-12-31T23:59:59Z | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQc`<br>`DQgAEhRMRLXvzk4HkuXzZZDvntYOZZn`<br>`lZR2pCXta9Yy63kUuuvFbExW4JoNdkG`<br>`sjBr4mL9VjYuut7g1Lp9OClzc2SzA==` |
| https://sabre2026h1.ct.sectigo.com | 2026-01-01T00:00:00Z | 2026-06-30T23:59:59Z | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQc`<br>`DQgAEhCa8Nr3YjTyHnuAQr82U2de5UY`<br>`A0fvdYXHPq6wmTuBB7kJx9x82WQ+1Tb`<br>`pUhRmdR8N62yZ6q4oBtziWBNNdqYA==` |
| https://sabre2026h2.ct.sectigo.com | 2026-07-01T00:00:00Z | 2026-12-31T23:59:59Z | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQc`<br>`DQgAEzjXK7DkHgtp3J4bk8n7F3Djym6`<br>`mrjKfA7YMePmobwPCVVroyM0x1fAkH6`<br>`eE+ZTVj8Em+ctGqna99CMS0jVk9cw==` |

## Inactive log shards

| URL Prefix | Expiry Range<br>Start | Expiry Range<br>End | Public Key (base64) |
|------------|-----------------------|---------------------|---------------------|
| https://sabre.ct.comodo.com | Not applicable | Not applicable | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQc`<br>`DQgAE8m/SiQ8/xfiHHqtls9m7FyOMBg`<br>`4JVZY9CgiixXGz0akvKD6DEL8S0ERmF`<br>`e9U4ZiA0M4kbT5nmuk3I85Sk4bagA==` |
| https://sabre2024h1.ct.sectigo.com | 2024-01-01T00:00:00Z | 2024-06-30T23:59:59Z | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQc`<br>`DQgAELAH2zjG8qhRhUf5reoeuptObx4`<br>`ctClrIT7VU3MmToADuyhy5p7Z7RzvlT`<br>`6psFhxwLsjsU1pMIUx+JwsTFF78hQ==` |
| https://sabre2024h2.ct.sectigo.com | 2024-07-01T00:00:00Z | 2024-12-31T23:59:59Z | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQc`<br>`DQgAEehBMiucie20quo76a0qB1YWuA+`<br>`//S/xNUz23jLt1CcnqFn7BdxbSwkV0b`<br>`Y3E4Yg339TzYGX8oHXwIGaOSswZ2g==` |
