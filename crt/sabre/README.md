# Sectigo Sabre

## Policy

These logs accept all roots that are enabled for the Server Authentication trust purpose in one or more of the Microsoft, Mozilla, Chrome, Apple, and 360 Browser root programs.

We will update the list of accepted roots from time to time in accordance with this policy.

## Status

The original Sabre log is [included in Google Chrome since M60](https://issues.chromium.org/issues/41308606). It transitioned to Readonly in May 2024, and is due to be retired in June 2025.

The first [temporally-sharded Sabre logs](https://issues.chromium.org/issues/41308606#comment57) became Qualified in the Chrome and Apple CT log lists in September 2023, and progressed to Usable in November/December 2023.

Since [Tiger](crt/tiger) is intended to replace Sabre, no further Sabre log shards are planned after 2026h2.

## Active log shards

| URL | Expiry Range | Public Key (base64) |
|-----|--------------|---------------------|
| https://sabre2025h1.ct.sectigo.com | Jan 01 2025 00:00:00Z inclusive to Jul 01 2025 00:00:00Z exclusive | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEfi858egjjrMyBK9NV/bbxXSkem07B1EMWvuAMAXGWgzEdtYGqFdN+9/kgpDCQa5wszGi4/o9XyxdBM20nVWrQQ==` |
| https://sabre2025h2.ct.sectigo.com | Jul 01 2025 00:00:00Z inclusive to Jan 01 2026 00:00:00Z exclusive | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEhRMRLXvzk4HkuXzZZDvntYOZZnlZR2pCXta9Yy63kUuuvFbExW4JoNdkGsjBr4mL9VjYuut7g1Lp9OClzc2SzA==` |
| https://sabre2026h1.ct.sectigo.com | Jan 01 2026 00:00:00Z inclusive to Jul 01 2026 00:00:00Z exclusive | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEhCa8Nr3YjTyHnuAQr82U2de5UYA0fvdYXHPq6wmTuBB7kJx9x82WQ+1TbpUhRmdR8N62yZ6q4oBtziWBNNdqYA==` |
| https://sabre2026h2.ct.sectigo.com | Jul 01 2026 00:00:00Z inclusive to Jan 01 2027 00:00:00Z exclusive | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEzjXK7DkHgtp3J4bk8n7F3Djym6mrjKfA7YMePmobwPCVVroyM0x1fAkH6eE+ZTVj8Em+ctGqna99CMS0jVk9cw==` |

## Inactive log shards

| URL | Expiry Range | Public Key (base64) |
|-----|--------------|---------------------|
| https://sabre.ct.comodo.com | Not applicable | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE8m/SiQ8/xfiHHqtls9m7FyOMBg4JVZY9CgiixXGz0akvKD6DEL8S0ERmFe9U4ZiA0M4kbT5nmuk3I85Sk4bagA==` |
| https://sabre2024h1.ct.sectigo.com | Jan 01 2024 00:00:00Z inclusive to Jul 01 2024 00:00:00Z exclusive | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAELAH2zjG8qhRhUf5reoeuptObx4ctClrIT7VU3MmToADuyhy5p7Z7RzvlT6psFhxwLsjsU1pMIUx+JwsTFF78hQ==` |
| https://sabre2024h2.ct.sectigo.com | Jul 01 2024 00:00:00Z inclusive to Jan 01 2025 00:00:00Z exclusive | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEehBMiucie20quo76a0qB1YWuA+//S/xNUz23jLt1CcnqFn7BdxbSwkV0bY3E4Yg339TzYGX8oHXwIGaOSswZ2g==` |
