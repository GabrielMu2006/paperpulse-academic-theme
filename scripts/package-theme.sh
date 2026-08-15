#!/bin/sh
set -eu

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
dist_dir="$repo_dir/dist"
stage_dir=$(mktemp -d "${TMPDIR:-/tmp}/paperpulse-academic.XXXXXX")
trap 'rm -rf "$stage_dir"' EXIT HUP INT TERM

mkdir -p "$dist_dir" "$stage_dir/PaperPulse Academic"
for asset in manifest.json theme.css LICENSE README.md README.zh-CN.md CHANGELOG.md; do
    cp "$repo_dir/$asset" "$stage_dir/PaperPulse Academic/$asset"
done

TZ=UTC find "$stage_dir/PaperPulse Academic" -exec touch -t 202608120000 {} +
archive_tmp="$stage_dir/paperpulse-academic-v1.0.0.zip"
(
    cd "$stage_dir"
    COPYFILE_DISABLE=1 TZ=UTC LC_ALL=C zip -X -q "$archive_tmp" \
        "PaperPulse Academic/manifest.json" \
        "PaperPulse Academic/theme.css" \
        "PaperPulse Academic/LICENSE" \
        "PaperPulse Academic/README.md" \
        "PaperPulse Academic/README.zh-CN.md" \
        "PaperPulse Academic/CHANGELOG.md"
)
mv "$archive_tmp" "$dist_dir/paperpulse-academic-v1.0.0.zip"
shasum -a 256 "$dist_dir/paperpulse-academic-v1.0.0.zip"
