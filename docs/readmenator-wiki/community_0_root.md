# root

*Community 0 | 1 files | cohesion 1.00*

## Definition

This community groups 1 file(s) rooted at `root` with dominant language sh (cohesion 1.00). Central symbols: `extractPorts`, `man`, `mkt`, `rmk`. Core file: `lazybspwm.sh` (4 symbols). Documented purpose: Paquetes necesarios.

## Files

| File | Language | Layer | Symbols | Doc |
|------|----------|-------|---------|-----|
| `lazybspwm.sh` | sh | utility | 4 | yes |

## Key Symbols

- `mkt` (function, `lazybspwm.sh:305`) - Functions
- `extractPorts` (function, `lazybspwm.sh:310`) - Extract nmap information
- `man` (function, `lazybspwm.sh:322`) - Set 'man' colors
- `rmk` (function, `lazybspwm.sh:343`)

## Internal vs External Edges

- Internal resolved imports (EXTRACTED): 0
- Cross-boundary resolved imports (EXTRACTED): 0

## Connections

- No cross-community bridges recorded. This community is self-contained.

## Risks

- No scoped security, taint, cycle, or layer risks.

## Open Questions

- What would break if the most connected file in root changed?
- Should root be split, given cohesion 1.00?

## Sources

- `lazybspwm.sh`
