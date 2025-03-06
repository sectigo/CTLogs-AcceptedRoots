# Sectigo Mammoth

## Policy

These logs accept all roots that are enabled for the Server Authentication trust purpose in one or more of the Microsoft, Mozilla, Chrome, Apple, and 360 Browser root programs.

We will update the list of accepted roots from time to time in accordance with this policy.

## Status

The original Mammoth log was [included in Google Chrome since M60](https://issues.chromium.org/issues/41308603), but was retired in early 2023.

The first [temporally-sharded Mammoth logs](https://issues.chromium.org/issues/41308603#comment60) became Qualified in the Chrome and Apple CT log lists in September 2023, and progressed to Usable in November/December 2023.

Since [Elephant](crt/elephant) is intended to replace Mammoth, no further Mammoth log shards are planned after 2026h2.

## Active log shards

| URL | Expiry Range | Public Key (base64) |
|-----|--------------|---------------------|
| https://mammoth2025h1.ct.sectigo.com | Jan 01 2025 00:00:00Z inclusive to Jul 01 2025 00:00:00Z exclusive | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEEzxBtTB9LkqhqGvSxVdrmP5+79Uh4rpdsLqFEW6U4D2ojm1WjUQCnrCDzFTfm05yYks8DDLdhvvrPmbNd1hb5Q==` |
| https://mammoth2025h2.ct.sectigo.com | Jul 01 2025 00:00:00Z inclusive to Jan 01 2026 00:00:00Z exclusive | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEiOLHs9c3o5HXs8XaB1EEK4HtwkQ7daDmZeFKuhuxnKkqhDEprh2L8TOfEi6QsRVnZqB8C1tif2yaajCbaAIWbw==` |
| https://mammoth2026h1.ct.sectigo.com | Jan 01 2026 00:00:00Z inclusive to Jul 01 2026 00:00:00Z exclusive | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEnssMilHMiuILzoXmr00x2xtqTP2weWuZl8Bd+25FUB1iqsafm2sFPaKrK12Im1Ao4p5YpaX6+eP6FSXjFBMyxA==` |
| https://mammoth2026h2.ct.sectigo.com | Jul 01 2026 00:00:00Z inclusive to Jan 01 2027 00:00:00Z exclusive | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE7INh8te0u+TkO+vIY3WYz2GQYxQ9XyLfdLpQp1ibaX3mY4lt2ddRhD/4AtjI/8KXceV+J/VysY8kJ1cKDXTAtg==` |

## Inactive log shards

| URL | Expiry Range | Public Key (base64) |
|-----|--------------|---------------------|
| https://mammoth.ct.comodo.com | Not applicable | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE7+R9dC4VFbbpuyOL+yy14ceAmEf7QGlo/EmtYU6DRzwat43f/3swtLr/L8ugFOOt1YU/RFmMjGCL17ixv66MZw==` |
| https://mammoth2024h1.ct.sectigo.com | Jan 01 2024 00:00:00Z inclusive to Jul 01 2024 00:00:00Z exclusive | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEpFmQ83EkJPfDVSdWnKNZHve3n86rThlmTdCK+p1ipCTwOyDkHRRnyPzkN/JLOFRaz59rB5DQDn49TIey6D8HzA==` |
| https://mammoth2024h1b.ct.sectigo.com | Jan 01 2024 00:00:00Z inclusive to Jul 01 2024 00:00:00Z exclusive | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEo9UHKHoENK7KvoB5Tz72QfQkBOHWNloaCfLRuoQXrh6hfAAdVHOQdSGo0dpeEOGM7LKKjMjn3c3iB/BOFgJXNw==` |
| https://mammoth2024h2.ct.sectigo.com | Jul 01 2024 00:00:00Z inclusive to Jan 01 2025 00:00:00Z exclusive | `MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEhWYiJG6+UmIKoK/DJRo2LqdgiaJlv6RfvYVqlAWBNZBUMZXnEZ6jLg+F76eIV4tjGoHBQZ197AE627nBJ/RlHg==` |
