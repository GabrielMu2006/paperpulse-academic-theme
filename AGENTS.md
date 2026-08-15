# Repository instructions

This repository contains only the independent **PaperPulse Academic** Obsidian
theme. Do not run Git operations in the parent Vault, `dashboard/`, `.obsidian/`,
or the PaperPulse source repository.

- Runtime output is CSS plus `manifest.json`; never add JavaScript.
- Do not add production dependencies, network requests, remote fonts/images,
  telemetry, or Vault/configuration mutation.
- Treat the sibling PaperPulse application source and `../dashboard` as
  read-only references. Do not introduce either as a dependency.
- Dashboard integration uses only the documented `--academic-dashboard-*`
  contract. Do not depend on Dashboard component DOM.
- Preserve both `.theme-dark` and `.theme-light`, user Accent Color, keyboard
  focus, reduced motion/transparency, increased contrast, forced colors, and
  print fallbacks.
- Install only by copying public assets to
  `.obsidian/themes/PaperPulse Academic`; never enable the theme or edit
  `appearance.json` automatically.
- Before acceptance run `scripts/check-theme.sh`, the contrast audit,
  deterministic packaging twice, and `git diff --check`.
