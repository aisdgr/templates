# LANG Rule List

This directory contains **language-specific coding standards rules** for the LANG domain.

## Overview

| Language          | Prefix      | Constraint (C) | Policy (P) | Total |
| ----------------- | ----------- | -------------- | ---------- | ----- |
| Standard (Core)   | LANG-STD    | 5              | 2          | 7     |
| Java              | LANG-JAVA   | 2              | 4          | 6     |
| Go                | LANG-GO     | 4              | 3          | 7     |
| Python            | LANG-PY     | 3              | 3          | 6     |
| TypeScript        | LANG-TS     | 4              | 3          | 7     |
| JavaScript        | LANG-JS     | 5              | 2          | 7     |
| Rust              | LANG-RS     | 4              | 3          | 7     |
| **Total**         |             | **27**         | **20**     | **47**|

---

## Standard (Core) - LANG-STD

Language-agnostic coding standards applicable to all programming languages.

| Type       | ID              | RNL                                                                                         |
| ---------- | --------------- | ------------------------------------------------------------------------------------------- |
| Constraint | LANG-STD-C-01   | Code *MUST* exhibit deterministic and reproducible behavior.                                |
| Constraint | LANG-STD-C-02   | Code *MUST* have explicit control flow and state management.                                |
| Constraint | LANG-STD-C-03   | Code **MUST NOT** introduce hidden external dependencies.                                   |
| Constraint | LANG-STD-C-04   | Code *MUST* handle sensitive data safely with explicit protection.                          |
| Policy     | LANG-STD-P-01   | Code structure *SHOULD* be intent-revealing and self-documenting.                           |
| Policy     | LANG-STD-P-02   | Code *SHOULD* validate boundaries and make errors visible at the earliest possible point.   |
| Constraint | LANG-STD-C-05   | AI behavior *MUST* be explicitly limited to declared scopes and constraints.                |

---

## Java - LANG-JAVA

Java-specific coding standards.

| Type       | ID              | RNL                                                                                   |
| ---------- | --------------- | ------------------------------------------------------------------------------------- |
| Constraint | LANG-JAVA-C-01  | Java code *MUST* use explicit and appropriate types.                                  |
| Policy     | LANG-JAVA-P-01  | Java inheritance *SHOULD* be used with explicit justification and limited depth.      |
| Constraint | LANG-JAVA-C-02  | Java code *MUST* handle null explicitly using Optional or explicit null checks.       |
| Policy     | LANG-JAVA-P-02  | Java checked exceptions *SHOULD* be used judiciously with proper handling.            |
| Policy     | LANG-JAVA-P-03  | Java code *SHOULD* prefer immutable data structures for thread safety.                |
| Policy     | LANG-JAVA-P-04  | Java identifiers *SHOULD* be intent-revealing with clear documentation.               |

---

## Go - LANG-GO

Go-specific coding standards.

| Type       | ID              | RNL                                                                                           |
| ---------- | --------------- | --------------------------------------------------------------------------------------------- |
| Constraint | LANG-GO-C-01    | Go code *MUST* handle all errors explicitly using multiple return values.                      |
| Constraint | LANG-GO-C-02    | Go control flow *MUST* be simple and explicit, avoiding deep nesting.                         |
| Constraint | LANG-GO-C-03    | Go concurrency *MUST* have explicit ownership and lifecycle management.                        |
| Policy     | LANG-GO-P-01    | Go code *SHOULD* prefer composition over inheritance.                                          |
| Policy     | LANG-GO-P-02    | Go interfaces *SHOULD* be minimal and defined at the point of use.                             |
| Constraint | LANG-GO-C-04    | Go code *MUST* exhibit deterministic behavior with explicit side effects.                      |
| Policy     | LANG-GO-P-03    | Go identifiers *SHOULD* be intent-revealing with clear package documentation.                  |

---

## Python - LANG-PY

Python-specific coding standards.

| Type       | ID              | RNL                                                                                         |
| ---------- | --------------- | ------------------------------------------------------------------------------------------- |
| Constraint | LANG-PY-C-01    | Python code *MUST* prioritize explicitness over cleverness or implicit features.            |
| Constraint | LANG-PY-C-02    | Python exceptions *MUST* be handled explicitly with specific exception types.               |
| Policy     | LANG-PY-P-01    | Python data structures *SHOULD* use type hints for public APIs.                             |
| Policy     | LANG-PY-P-02    | Python code *SHOULD* validate boundary inputs explicitly.                                   |
| Constraint | LANG-PY-C-03    | Python core logic *MUST* be deterministic with explicit randomness control.                 |
| Policy     | LANG-PY-P-03    | Python comments and docstrings *SHOULD* be intent-revealing and maintained with code.       |

---

## TypeScript - LANG-TS

TypeScript-specific coding standards.

| Type       | ID              | RNL                                                                                                   |
| ---------- | --------------- | ----------------------------------------------------------------------------------------------------- |
| Constraint | LANG-TS-C-01    | TypeScript projects *MUST* enable strict type checking (`strict: true`).                              |
| Constraint | LANG-TS-C-02    | TypeScript public APIs *MUST* have explicit type annotations for all parameters and return values.    |
| Policy     | LANG-TS-P-01    | TypeScript code *SHOULD* use interfaces and type aliases appropriately based on use case.             |
| Constraint | LANG-TS-C-03    | TypeScript code **MUST NOT** use unsafe type assertions without runtime validation.                   |
| Constraint | LANG-TS-C-04    | TypeScript code *MUST* handle `null` and `undefined` explicitly.                                      |
| Policy     | LANG-TS-P-02    | TypeScript async interfaces *SHOULD* be type-safe with explicit error types.                          |
| Policy     | LANG-TS-P-03    | TypeScript identifiers *SHOULD* be intent-revealing with TSDoc comments.                              |

---

## JavaScript - LANG-JS

JavaScript-specific coding standards.

| Type       | ID              | RNL                                                                                             |
| ---------- | --------------- | ----------------------------------------------------------------------------------------------- |
| Constraint | LANG-JS-C-01    | JavaScript variables *MUST* be declared with explicit scope (`const`/`let`, not `var`).         |
| Constraint | LANG-JS-C-02    | JavaScript comparisons **MUST** use strict equality (`===` and `!==`).                          |
| Constraint | LANG-JS-C-03    | JavaScript async code *MUST* use explicit control flow (`async`/`await` preferred).             |
| Constraint | LANG-JS-C-04    | JavaScript errors *MUST* be handled explicitly with specific error types.                       |
| Policy     | LANG-JS-P-01    | JavaScript code *SHOULD* prefer immutable data patterns (`const`, `Object.freeze`).             |
| Constraint | LANG-JS-C-05    | JavaScript code **MUST NOT** introduce implicit globals or use dynamic code execution.          |
| Policy     | LANG-JS-P-02    | JavaScript identifiers *SHOULD* be intent-revealing with JSDoc comments.                        |

---

## Rust - LANG-RS

Rust-specific coding standards.

| Type       | ID              | RNL                                                                                                   |
| ---------- | --------------- | ----------------------------------------------------------------------------------------------------- |
| Constraint | LANG-RS-C-01    | Rust code *MUST* respect ownership and borrowing rules with explicit lifetime management.              |
| Constraint | LANG-RS-C-02    | Rust code **MUST NOT** use `unsafe` blocks by default; unsafe code requires explicit justification.   |
| Constraint | LANG-RS-C-03    | Rust code *MUST* handle errors explicitly using `Result<T, E>` and `Option<T>`.                       |
| Constraint | LANG-RS-C-04    | Rust concurrency *MUST* be deterministic with explicit synchronization primitives.                    |
| Policy     | LANG-RS-P-01    | Rust code *SHOULD* prefer immutability by default (immutable bindings).                               |
| Policy     | LANG-RS-P-02    | Rust code *SHOULD* have explicit lifetime annotations and clear API contracts.                        |
| Policy     | LANG-RS-P-03    | Rust identifiers *SHOULD* be intent-revealing with documentation comments.                            |

---

## Usage Notes

### Rule Application

1. **All languages** must comply with LANG-STD rules
2. **Language-specific** rules apply in addition to core standards
3. **Type determination**:
   - Constraint (C): Violations trigger governance enforcement
   - Policy (P): Violations require documented justification

### Example: Java Project

```yaml
# Apply to all Java code generation
includes:
  - ruleset_id: lang.core        # LANG-STD rules (core standards)
    version: ">=1.0.0"
  - ruleset_id: lang.java        # LANG-JAVA rules (Java-specific)
    version: ">=1.0.0"
```

### Combination with Other Domains

```
source_code.add.java = CODE rules (operation constraints)
                     + LANG rules (language standards)
                     + GOV rules (governance principles)
```

---

## Rule Statistics

### By Language

| Language          | Total Rules | Constraints | Policies |
| ----------------- | ----------- | ----------- | -------- |
| Standard (Core)   | 7           | 5           | 2        |
| Java              | 6           | 2           | 4        |
| Go                | 7           | 4           | 3        |
| Python            | 6           | 3           | 3        |
| TypeScript        | 7           | 4           | 3        |
| JavaScript        | 7           | 5           | 2        |
| Rust              | 7           | 4           | 3        |

### By Type

- **Total Constraints**: 27 (57.4%)
- **Total Policies**: 20 (42.6%)
- **Grand Total**: 47 rules

---

## Design Principles

1. **Language Agnostic Core**: LANG-STD provides baseline standards for all languages
2. **Language Specific Extensions**: Each language has rules addressing its unique characteristics
3. **Severity Mapping**:
   - `MUST` / `MUST NOT` → Constraint (enforceable)
   - `SHOULD` / `SHOULD NOT` → Policy (requires justification if violated)
4. **Composition Model**: Rules compose across domains (CODE + LANG + GOV)

---

**Source Documents:**
- `history/v3.0-aigm/g-gcs/gcs.core.yaml` → LANG-STD
- `history/v3.0-aigm/g-gcs/gcs.java.yaml` → LANG-JAVA
- `history/v3.0-aigm/g-gcs/gcs.go.yaml` → LANG-GO
- `history/v3.0-aigm/g-gcs/gcs.python.yaml` → LANG-PY
- `history/v3.0-aigm/g-gcs/gcs.typescript.yaml` → LANG-TS
- `history/v3.0-aigm/g-gcs/gcs.javascript.yaml` → LANG-JS
- `history/v3.0-aigm/g-gcs/gcs.rust.yaml` → LANG-RS

**Status**: Active (规则文件已生成)
**Version**: 1.0.0
**Last Updated**: 2026-03-18
