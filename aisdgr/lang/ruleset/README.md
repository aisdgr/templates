# LANG Rulesets

This directory contains **LANG rulesets**, which compose
language-specific coding standards from atomic LANG rules.

Rulesets do not define new behavior.
They only **select and activate existing rule categories**
based on programming language and quality requirements.

---

## 1. Rules vs Rulesets

- **Rules** define *what coding practices are required or recommended* at the language level.
- **Rulesets** define *which languages* those rules apply to.

Rulesets:
- do NOT introduce normative language (MUST / MUST NOT)
- do NOT encode quality semantics
- do NOT reference code generation scenarios or governance authority

---

## 2. Core vs Language-Specific Rulesets

| Type                | Description                          | Example      |
| ------------------- | ------------------------------------ | ------------ |
| Core Ruleset        | Language-agnostic baseline standards | lang.core    |
| Language Ruleset    | Language-specific coding standards   | lang.java    |

This separation ensures all projects comply with baseline standards
while enabling language-specific quality enforcement.

---

## 3. Ruleset Naming Convention

Rulesets follow the pattern:

```
lang.<language>
```

Examples:
- `lang.core` — Core language-agnostic standards
- `lang.java` — Java-specific standards
- `lang.go` — Go-specific standards

---

## 4. Available Rulesets

### Core Standards

| Ruleset    | Purpose                                        |
| ---------- | ---------------------------------------------- |
| lang.core  | Language-agnostic coding standards (LANG-STD)  |

---

### Language-Specific Standards

| Ruleset    | Language    | Purpose                                    |
| ---------- | ----------- | ------------------------------------------ |
| lang.java  | Java        | Java-specific coding standards             |
| lang.go    | Go          | Go-specific coding standards               |
| lang.py    | Python      | Python-specific coding standards           |
| lang.ts    | TypeScript  | TypeScript-specific coding standards       |
| lang.js    | JavaScript  | JavaScript-specific coding standards       |
| lang.rs    | Rust        | Rust-specific coding standards             |

---

## 5. Rule Application Model

LANG rulesets are applied in a **layered composition**:

1. **Core Layer** — All projects MUST include `lang.core`
2. **Language Layer** — Projects using a specific language MUST include the corresponding language ruleset

### Example: Java Project

```yaml
includes:
  - ruleset_id: lang.core        # LANG-STD rules (core standards)
    version: ">=1.0.0"
  - ruleset_id: lang.java        # LANG-JAVA rules (Java-specific)
    version: ">=1.0.0"
```

### Example: TypeScript Project

```yaml
includes:
  - ruleset_id: lang.core        # LANG-STD rules (core standards)
    version: ">=1.0.0"
  - ruleset_id: lang.ts          # LANG-TS rules (TypeScript-specific)
    version: ">=1.0.0"
```

---

## 6. Rule Category Inclusion Model

Rulesets select rules by **rule ID**, not by category.

Core categories included in all rulesets:

- **Constraint (C)** — Hard requirements with MUST/MUST NOT
- **Policy (P)** — Recommendations with SHOULD/SHOULD NOT

This model allows new rules to be added without changing existing rulesets.

---

## 7. Combination with Other Domains

LANG rules compose with other domains:

```
source_code.add.java = CODE rules (operation constraints)
                     + LANG rules (language standards)
                     + GOV rules (governance principles)
```

### Full Stack Example

```yaml
includes:
  # CODE domain — operation constraints
  - ruleset_id: source_code.add
    version: ">=1.0.0"

  # LANG domain — language standards
  - ruleset_id: lang.core
    version: ">=1.0.0"
  - ruleset_id: lang.java
    version: ">=1.0.0"

  # GOV domain — governance principles
  - ruleset_id: gov.core
    version: ">=1.0.0"
```

---

## 8. Design Rationale

- LANG rules define the **minimum quality contract** for each language
- Rulesets define **language context only**
- Governance authority, enforcement severity, and escalation are handled externally

---

## 9. Summary

If a coding practice cannot be governed through rule composition,
it does not belong in LANG.
