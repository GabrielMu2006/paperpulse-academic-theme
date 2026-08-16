#!/bin/sh
set -eu

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$repo_dir"

python3 - <<'PY'
import json
from pathlib import Path

root = Path.cwd()
manifest = json.loads((root / "manifest.json").read_text())
versions = json.loads((root / "versions.json").read_text())
expected = {"name", "version", "minAppVersion", "author"}
missing = expected - manifest.keys()
assert not missing, f"manifest missing: {sorted(missing)}"
assert manifest["name"] == "PaperPulse Academic"
assert manifest["version"] == "1.0.0"
assert manifest["minAppVersion"] == "1.13.6"
assert versions == {manifest["version"]: manifest["minAppVersion"]}

css = (root / "theme.css").read_text()
assert ".theme-dark" in css and ".theme-light" in css
for token in ("--background-primary", "--interactive-accent", "--text-normal",
              "--academic-dashboard-shell", "@media (forced-colors: active)",
              "prefers-reduced-motion", "prefers-contrast"):
    assert token in css, f"missing required CSS role: {token}"

assert ".markdown-source-view.mod-cm6 .cm-sizer" in css
assert ".markdown-source-view .cm-contentContainer,\n.markdown-preview-sizer" not in css
for selector in (".markdown-source-view.mod-cm6 .cm-cursor",
                 ".markdown-source-view.mod-cm6 .cm-active.cm-line",
                 ".markdown-source-view.mod-cm6 .HyperMD-codeblock",
                 ".markdown-source-view.mod-cm6 .HyperMD-math",
                 ".metadata-container .metadata-property-key input[type=\"text\"]",
                 ".metadata-container .metadata-property-value input[type=\"text\"]"):
    assert selector in css, f"missing editor visibility selector: {selector}"
dark_scheme = css.split(".theme-dark {", 1)[1].split(".theme-light {", 1)[0]
light_scheme = css.split(".theme-light {", 1)[1].split("/* T2:", 1)[0]
for token in ("--pp-editor-caret", "--pp-editor-source",
              "--pp-editor-code-border"):
    assert all(f"{token}:" in scheme for scheme in (dark_scheme, light_scheme)), (
        f"editor token must exist in both schemes: {token}"
    )
metadata_section = css.split(".metadata-container {", 1)[1].split("/* T4:", 1)[0]
for token in ("--text-normal: var(--pp-paper-ink)",
              "--metadata-label-text-color: var(--pp-paper-secondary)",
              "--metadata-input-text-color: var(--pp-paper-ink)"):
    assert token in metadata_section, f"missing paper-aware Properties role: {token}"

dashboard_roles = {
    "shell", "toolbar", "panel", "panel-elevated", "surface-hover",
    "surface-active", "surface-inset", "reading-surface", "blur", "text",
    "text-muted", "text-faint", "border", "border-strong", "divider",
    "accent", "accent-hover", "accent-soft", "accent-strong", "focus",
    "info", "success", "warning", "error", "info-soft", "success-soft",
    "warning-soft", "error-soft", "favorite", "radius-xs", "radius-sm",
    "radius-md", "radius-lg", "radius-toolbar", "shadow-panel",
    "shadow-toolbar", "shadow-edit", "space-page", "space-panel",
    "space-control-x", "space-control-y",
}
for role in dashboard_roles:
    assert f"--academic-dashboard-{role}:" in css, f"missing Dashboard role: {role}"

dashboard_section = css.split("/* T5:", 1)[1].split("/* T6:", 1)[0]
selectors = [part.split("{")[0].strip() for part in dashboard_section.split("}") if "{" in part]
assert all(".academic-dashboard-view" in selector for selector in selectors), (
    "Dashboard integration must use only the public view scope"
)

lower = css.lower()
for forbidden in ("http://", "https://", "url(", "@import", "/users/", "telemetry"):
    assert forbidden not in lower, f"forbidden theme content: {forbidden}"

assert not list(root.glob("*.js")), "JavaScript is forbidden"
assert not (root / "package.json").exists(), "production dependencies are forbidden"
print("manifest, schemes, Dashboard contract, accessibility hooks, and safety policy: passed")
PY

git diff --check
echo "theme static checks: passed"
