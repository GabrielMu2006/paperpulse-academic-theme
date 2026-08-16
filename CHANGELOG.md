# Changelog

## Unreleased

- Increased the editing caret to a two-pixel, paper-aware high-contrast mark.
- Strengthened inline and fenced-code backgrounds, borders, and delimiters in
  Live Preview while preserving the existing reading-mode treatment.
- Replaced pale active Markdown and math-source colors with scheme-specific
  plum tones that pass the fixed-palette contrast audit.

## 1.0.0 — 2026-08-12

- Initial independent release.
- Deliberate PaperPulse Academic Dark and Light schemes.
- Accent Color-aware application shell, overlays, editor, reader, settings,
  forms, Properties, Bases, Canvas, Graph, and Academic Dashboard integration.
- Optional Style Settings for material, paper temperature, accent intensity,
  radius, shadow, and density.
- Accessibility and print fallbacks, static safety checks, contrast audit, and
  deterministic packaging.
- Corrected Dark-mode Dashboard reading-row contrast and strengthened the
  restrained red–magenta–purple hierarchy across its shell and panels.
- Restored the full CodeMirror editing width by applying long-form line width
  to the editor sizer rather than its flexing content container.
