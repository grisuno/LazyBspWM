# Polyglot Codebase Knowledge Graph

> Generated offline by **readmenator**. Supports C, C++, Python, Go, Rust, JS/TS, Java, C#, Shell, PHP, Dart, GDScript, Nim, ASM.
> No LLMs. No tokens. Pure static analysis.

**Total Files Parsed:** 1 | **Total Symbols Extracted:** 4 | **Total Imports:** 0

## Structural Knowledge Map
```mermaid
graph TD
    classDef mod fill:#1e1e1e,stroke:#ff6666,stroke-width:2px,color:#fff;
    classDef cls fill:#2d2d2d,stroke:#4ec9b0,stroke-width:2px,color:#fff;
    classDef fn fill:#333,stroke:#dcdcaa,stroke-width:1px,color:#dcdcaa;
    classDef ext fill:#111,stroke:#666,stroke-dasharray: 5 5,color:#aaa;
    lazybspwm_sh["lazybspwm.sh (sh)"]
    class lazybspwm_sh mod;
    lazybspwm_sh_mkt["mkt"]
    class lazybspwm_sh_mkt fn;
    lazybspwm_sh --> lazybspwm_sh_mkt
    lazybspwm_sh_extractPorts["extractPorts"]
    class lazybspwm_sh_extractPorts fn;
    lazybspwm_sh --> lazybspwm_sh_extractPorts
    lazybspwm_sh_man["man"]
    class lazybspwm_sh_man fn;
    lazybspwm_sh --> lazybspwm_sh_man
    lazybspwm_sh_rmk["rmk"]
    class lazybspwm_sh_rmk fn;
    lazybspwm_sh --> lazybspwm_sh_rmk
```

---

## Architecture Reference

### SH (1 files)

#### `lazybspwm.sh`
**Path:** `lazybspwm.sh`

**Functions:**
- `mkt` (line 305) - *Functions*
- `extractPorts` (line 310) - *Extract nmap information*
- `man` (line 322) - *Set 'man' colors*
- `rmk` (line 343)
