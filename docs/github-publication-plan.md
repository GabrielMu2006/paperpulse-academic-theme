# GitHub publication plan

This plan publishes PaperPulse Academic as an independent public repository and
prepares it for an optional later submission to the Obsidian Theme Gallery.

## Target

| Item | Decision |
| --- | --- |
| GitHub owner | `GabrielMu2006` |
| Repository | `paperpulse-academic-theme` |
| Visibility | Public |
| Default branch | `main` |
| Initial version | `1.0.0` |
| Release tag | `1.0.0` (exactly matches `manifest.json`) |
| License | MIT |
| Community listing | Separate step after GitHub release validation |

The local repository already has independent Git history and no configured
remote. Do not initialize the GitHub repository with a README, license, or
`.gitignore`; those files already exist locally.

## Pre-publication checklist

Complete the GitHub items before creating the public repository. Preview-image
items apply only to the optional Theme Gallery submission:

- Finalize `docs/verification-report.md`; it currently contains an
  implementation-in-progress placeholder.
- Before Theme Gallery submission, capture a synthetic-data 16:9 preview,
  recommended at 512×288 pixels, and verify that it reveals no note names,
  account names, or local paths.
- Add `versions.json` with `"1.0.0": "1.13.6"` so future compatibility
  selection has a stable starting point.
- Sanitize the device-specific absolute source path currently present in
  `AGENTS.md`. Because it also exists in the initial local commit, either create
  a clean public root commit from the audited tree or deliberately rewrite and
  re-audit the short local history before pushing it.
- Decide the screenshot filename and add it to the root or a documented public
  assets folder before Theme Gallery submission.
- Re-run the static check, contrast audit, real-Obsidian visual matrix, and
  deterministic package check from the release commit.

## Phase 1 — Prepare the public tree

1. Confirm the working tree contains only intended source and documentation.
2. Search tracked files for credentials, absolute user paths, Vault content,
   `.DS_Store`, generated QA evidence, and remote assets.
3. Scan the complete history as well as the current tree; deleting a private
   path in a later commit does not remove it from Git history.
4. Confirm `manifest.json` contains the stable name, version, minimum Obsidian
   version, and public author name.
5. Add and validate `versions.json`.
6. Add the synthetic preview image and meaningful alt text to the README only
   after the final image is approved.
7. Finalize the verification report with the tested versions, modes, zoom,
   accessibility settings, package hashes, and acceptance commit.

Acceptance: `git status` is clean, no personal data is tracked, and every file
in the repository is intended to be public.

## Phase 2 — Verify version 1.0.0

Run from the repository root:

```sh
./scripts/check-theme.sh
./scripts/contrast-audit.py
./scripts/package-theme.sh
```

Then:

1. Test the source assets in Obsidian Desktop using Default Light, Default Dark,
   a custom Accent Color, and the full compatibility matrix.
2. Test reduced motion, reduced transparency, increased contrast, forced colors,
   print, keyboard focus, and 100–200% zoom.
3. Test with and without Academic Dashboard and Style Settings.
4. Run `scripts/package-theme.sh` twice from the same commit and compare hashes.
5. Inspect the archive and confirm that it contains only the five documented
   public files below `PaperPulse Academic/`.
6. Run `git diff --check` and record the final acceptance result.

Acceptance: all automated checks pass, the two package hashes match, and the
real-Obsidian acceptance matrix has no release-blocking issue.

## Phase 3 — Create and push the GitHub repository

1. Create the empty public repository
   `GabrielMu2006/paperpulse-academic-theme`.
2. Add it as the local `origin` remote.
3. Push `main` and set upstream tracking.
4. Verify the GitHub default branch, README rendering, license detection, issue
   settings, and repository description/topics.
5. Enable private vulnerability reporting if desired; keep ordinary theme bugs
   in public issues using synthetic content.

Suggested repository description:

> A warm-paper Light and midnight Dark academic theme for Obsidian, with
> accessible fallbacks and optional Academic Dashboard integration.

Suggested topics:

```text
obsidian obsidian-theme academic writing research dark-theme light-theme
```

Acceptance: GitHub displays the intended source tree and no additional starter
commit or unrelated Vault file was introduced.

## Phase 4 — Publish the GitHub release

1. Create an annotated tag named `1.0.0` from the accepted commit.
2. Create a GitHub Release titled `PaperPulse Academic 1.0.0`.
3. Upload `manifest.json` and `theme.css` as individual release attachments.
4. Also upload `paperpulse-academic-v1.0.0.zip` and a SHA-256 checksum file for
   convenient manual installation and verification.
5. Use the `1.0.0` changelog entry as the basis for release notes, including the
   verified Obsidian range and macOS-primary support statement.
6. Download the published attachments into a temporary directory and compare
   their hashes with the accepted local assets.
7. Perform one fresh-Vault install using only the downloaded public assets.

Acceptance: the tag equals the manifest version, individual runtime assets are
present, hashes match, and the theme installs from the public release.

## Phase 5 — Optional Theme Gallery submission

Do this only after the GitHub release has been validated:

1. Re-read the current Obsidian theme guidelines and developer policies.
2. Fork `obsidianmd/obsidian-releases` and add the required theme entry.
3. Include the approved 16:9 preview and stable repository reference required by
   the current submission workflow.
4. Open the upstream pull request and address automated or maintainer feedback.
5. Do not rename the theme after acceptance; Obsidian treats submitted theme
   names as stable.

Community submission is not required for the GitHub repository or manual
release to be useful. It is a separate publication decision.

## Ongoing releases

For every later version:

1. Update `manifest.json`, `versions.json`, and `CHANGELOG.md` together.
2. Run the full automated and visual acceptance matrix.
3. Commit the accepted state, then create a tag exactly matching the manifest
   version, without a `v` prefix.
4. Attach `manifest.json` and `theme.css` individually, plus the deterministic
   archive and checksum.
5. Install once from downloaded release assets before announcing the update.

Never replace assets on an existing published tag. Correct a release with a new
Semantic Version instead.
