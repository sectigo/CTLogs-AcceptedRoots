# Sectigo Mammoth

## Policy

These logs accept all roots that are enabled for the Server Authentication trust purpose in one or more of the Microsoft, Mozilla, Chrome, Apple, and 360 Browser root programs.

We will update the list of accepted roots from time to time in accordance with this policy.

## Status

The original Mammoth log was [included in Google Chrome since M60](https://issues.chromium.org/issues/41308603), but was retired in early 2023.

The first [temporally-sharded Mammoth logs](https://issues.chromium.org/issues/41308603#comment60) became Qualified in the Chrome and Apple CT log lists in September 2023, and progressed to Usable in November/December 2023.

[Elephant](../elephant) is intended to replace Mammoth, so no further Mammoth log shards are planned after 2026h2.

## Active log shards

| URL Prefix | Expiry Range<br>Start | Expiry Range<br>End | Public Key (base64) |
|------------|-----------------------|---------------------|---------------------|
| https://mammoth2025h1.ct.sectigo.com | 2025-01-01T00:00:00Z | 2025-06-30T23:59:59Z | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQc`<br>`DQgAEEzxBtTB9LkqhqGvSxVdrmP5+79`<br>`Uh4rpdsLqFEW6U4D2ojm1WjUQCnrCDz`<br>`FTfm05yYks8DDLdhvvrPmbNd1hb5Q==` |
| https://mammoth2025h2.ct.sectigo.com | 2025-07-01T00:00:00Z | 2025-12-31T23:59:59Z | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQc`<br>`DQgAEiOLHs9c3o5HXs8XaB1EEK4Htwk`<br>`Q7daDmZeFKuhuxnKkqhDEprh2L8TOfE`<br>`i6QsRVnZqB8C1tif2yaajCbaAIWbw==` |
| https://mammoth2026h1.ct.sectigo.com | 2026-01-01T00:00:00Z | 2026-06-30T23:59:59Z | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQc`<br>`DQgAEnssMilHMiuILzoXmr00x2xtqTP`<br>`2weWuZl8Bd+25FUB1iqsafm2sFPaKrK`<br>`12Im1Ao4p5YpaX6+eP6FSXjFBMyxA==` |
| https://mammoth2026h2.ct.sectigo.com | 2026-07-01T00:00:00Z | 2026-12-31T23:59:59Z | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQc`<br>`DQgAE7INh8te0u+TkO+vIY3WYz2GQYx`<br>`Q9XyLfdLpQp1ibaX3mY4lt2ddRhD/4A`<br>`tjI/8KXceV+J/VysY8kJ1cKDXTAtg==` |

## Inactive log shards

| URL Prefix | Expiry Range<br>Start | Expiry Range<br>End | Public Key (base64) |
|------------|-----------------------|---------------------|---------------------|
| https://mammoth.ct.comodo.com | Not applicable | Not applicable | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQc`<br>`DQgAE7+R9dC4VFbbpuyOL+yy14ceAmE`<br>`f7QGlo/EmtYU6DRzwat43f/3swtLr/L`<br>`8ugFOOt1YU/RFmMjGCL17ixv66MZw==` |
| https://mammoth2024h1.ct.sectigo.com | 2024-01-01T00:00:00Z | 2024-06-30T23:59:59Z | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQc`<br>`DQgAEpFmQ83EkJPfDVSdWnKNZHve3n8`<br>`6rThlmTdCK+p1ipCTwOyDkHRRnyPzkN`<br>`/JLOFRaz59rB5DQDn49TIey6D8HzA==` |
| https://mammoth2024h1b.ct.sectigo.com | 2024-01-01T00:00:00Z | 2024-06-30T23:59:59Z | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQc`<br>`DQgAEo9UHKHoENK7KvoB5Tz72QfQkBO`<br>`HWNloaCfLRuoQXrh6hfAAdVHOQdSGo0`<br>`dpeEOGM7LKKjMjn3c3iB/BOFgJXNw==` |
| https://mammoth2024h2.ct.sectigo.com | 2024-07-01T00:00:00Z | 2024-12-31T23:59:59Z | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQc`<br>`DQgAEhWYiJG6+UmIKoK/DJRo2Lqdgia`<br>`Jlv6RfvYVqlAWBNZBUMZXnEZ6jLg+F7`<br>`6eIV4tjGoHBQZ197AE627nBJ/RlHg==` |
