#!/usr/bin/env python3
"""Conservative WCAG contrast checks for the theme's fixed palette roles."""

def rgb(value):
    value = value.lstrip("#")
    return tuple(int(value[i:i+2], 16) / 255 for i in (0, 2, 4))

def luminance(value):
    channels = [c / 12.92 if c <= .04045 else ((c + .055) / 1.055) ** 2.4 for c in rgb(value)]
    return .2126 * channels[0] + .7152 * channels[1] + .0722 * channels[2]

def ratio(a, b):
    hi, lo = sorted((luminance(a), luminance(b)), reverse=True)
    return (hi + .05) / (lo + .05)

pairs = {
    "dark primary": ("#f7f1fb", "#090713", 4.5),
    "dark muted": ("#b8adc3", "#090713", 4.5),
    "dark raised": ("#f7f1fb", "#20152b", 4.5),
    "dark dashboard reading": ("#f7f1fb", "#231226", 4.5),
    "dark dashboard reading end": ("#f7f1fb", "#24112d", 4.5),
    "light primary": ("#251f26", "#fff9ef", 4.5),
    "light muted": ("#6c606b", "#fff9ef", 4.5),
    "light raised": ("#251f26", "#fffdf8", 4.5),
    "paper ink": ("#1f1a21", "#fff7e8", 4.5),
    "dark accent text": ("#ffffff", "#a31662", 4.5),
    "light accent text": ("#ffffff", "#8e2058", 4.5),
}

failed = []
for name, (fg, bg, required) in pairs.items():
    actual = ratio(fg, bg)
    print(f"{name}: {actual:.2f}:1")
    if actual < required:
        failed.append((name, actual, required))
if failed:
    raise SystemExit(f"contrast failures: {failed}")
print("fixed palette contrast audit: passed")
