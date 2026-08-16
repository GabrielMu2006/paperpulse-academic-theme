# Verification report

Status: accepted for GitHub release 1.0.0<br>
Date: 2026-08-15

## Scope

This report covers the public source and deterministic release archive for
PaperPulse Academic 1.0.0. Community Theme Gallery submission remains a
separate optional step and still requires an approved synthetic-data preview.

## Automated verification

The following commands passed from the repository root:

```sh
./scripts/check-theme.sh
./scripts/contrast-audit.py
./scripts/package-theme.sh
```

The static check confirmed:

- valid and synchronized `manifest.json` and `versions.json` metadata;
- complete Light and Dark scheme roots;
- the documented Academic Dashboard public-variable contract;
- reduced-motion, increased-contrast, and forced-colors hooks;
- no JavaScript, production dependency, remote asset, network URL, telemetry,
  or developer absolute path in runtime CSS; and
- the corrected CodeMirror line-width selector.

The fixed-palette contrast audit recorded these text contrast ratios:

| Pair | Ratio |
| --- | ---: |
| Dark primary | 18.00:1 |
| Dark muted | 9.32:1 |
| Dark raised | 15.73:1 |
| Dark Dashboard reading start | 15.96:1 |
| Dark Dashboard reading end | 15.87:1 |
| Light primary | 15.39:1 |
| Light muted | 5.69:1 |
| Light raised | 15.86:1 |
| Paper ink | 16.06:1 |
| Dark-paper metadata muted | 7.23:1 |
| Light-paper metadata ink | 15.50:1 |
| Light-paper metadata muted | 6.40:1 |
| Dark accent text | 7.37:1 |
| Light accent text | 8.41:1 |

## Visual and runtime evidence

The accepted real-Obsidian evidence is summarized in the compatibility matrix;
the detailed capture record remains in the private local QA archive. It covers
Obsidian Desktop 1.13.7 on macOS, Dark and Light scheme behavior, Academic
Dashboard 0.2.0 integration, Simplified Chinese and English stress content,
keyboard-accessible navigation, the corrected Live Preview editor width, and
paper-aware Properties labels/values in both application color schemes.
The accessibility tree remained populated and no blank, loading, or error
surface was observed.

No real Vault note was modified to produce the public release. Local QA images
remain excluded from Git because they contain development evidence rather than
public synthetic media.

## Package verification

The deterministic archive contains exactly:

```text
PaperPulse Academic/manifest.json
PaperPulse Academic/theme.css
PaperPulse Academic/LICENSE
PaperPulse Academic/README.md
PaperPulse Academic/CHANGELOG.md
```

Packaging was run twice from the same source state and produced the same
SHA-256 hash. The final public release records the checksum beside its assets.

## Remaining optional work

Before submitting to the Obsidian Theme Gallery, add and review a 16:9
synthetic-data preview image and recheck the then-current theme submission
guidelines. This does not block the independent GitHub repository or release.
