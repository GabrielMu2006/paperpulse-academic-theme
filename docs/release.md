# Release procedure

1. Run `scripts/check-theme.sh` and `scripts/contrast-audit.py`.
2. Confirm visual acceptance in real Obsidian for the complete matrix.
3. Run `scripts/package-theme.sh` twice and compare SHA-256 hashes.
4. Confirm the archive contains only the documented public files.
5. Commit the finalized verification report as the local acceptance commit.

Publishing, pushing, creating a GitHub repository/release, and Community Themes
submission require separate explicit authorization.
