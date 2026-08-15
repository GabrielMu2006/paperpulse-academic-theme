# Compatibility matrix

Primary target: Obsidian Desktop on macOS.

| Area | 1.13.6 | 1.13.7 | Notes |
| --- | --- | --- | --- |
| Light/Dark core variables | Targeted | Verified | Both schemes complete |
| Shell, ribbon, tabs, sidebars | Targeted | Verified | Active/inactive and split panes |
| Menus, palette, modals, notices | Targeted | Verified | Solid material fallback |
| Source/live preview/reading | Targeted | Verified | English/Chinese stress content |
| Settings and forms | Targeted | Verified | Native semantics retained |
| Properties and Bases | Targeted | Verified | Semantic fallback for optional DOM |
| Canvas and Graph | Targeted | Verified | Controls and selection covered |
| Academic Dashboard 0.2.0 | Targeted | Verified | Public variables only |
| 100–200% zoom | Targeted | Verified | No theme-owned fixed viewport |
| Reduced motion/transparency | Targeted | Verified | Media-query fallback |
| Increased/forced colors | Targeted | Verified | Non-color boundaries retained |

Selectors intentionally prefer stable Obsidian classes and semantic variables.
Unknown or future surfaces inherit readable core variables rather than relying
on private plugin internals.
