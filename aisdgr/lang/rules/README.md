# LANG Rule Catalog

This directory contains the **LANG rule catalog**, which defines
**language-specific coding standards** for AI-assisted and automated
code generation.

These rules are **language-aware**, **quality-focused**, and
**governance-aligned by design**.

They define **what coding practices are required or recommended**,
not *why*, *when*, or *by whom* they should be enforced.

---

## 1. Design Principles

The LANG rules follow the following non-negotiable principles:

1. **Language-Specific by Design**
   Rules apply to specific programming languages or are language-agnostic
   core principles. Each language has its own set of rules addressing its
   unique characteristics and risks.

2. **Quality-Oriented**
   Rules focus on code quality attributes: explicitness, safety,
   maintainability, and predictability. They do not encode business
   logic or organizational policies.

3. **Severity-Based Classification**
   Rules are classified into two severity levels:
   - **Constraints (MUST/MUST NOT)** — Hard requirements that trigger
     governance enforcement when violated
   - **Policies (SHOULD/SHOULD NOT)** — Recommendations that require
     documented justification when violated

4. **Composable and Reusable**
   Each rule is atomic and reusable across multiple projects and contexts.
   Rules never depend on other rules or external policies.

5. **Core + Language Extensions**
   LANG-STD rules form a language-agnostic baseline.
   Language-specific rules (LANG-JAVA, LANG-GO, etc.) extend the core
   with language-specific requirements.

---

## 2. Rule ID Naming Convention

All rules in this directory follow the same identifier format:

```
LANG-<LANGUAGE>-<TYPE>-<NN>
```

Example:
- `LANG-STD-C-01`
- `LANG-JAVA-P-02`

Where:
- **LANG** indicates the language domain
- **LANGUAGE** indicates the target language (STD, JAVA, GO, PY, TS, JS, RS)
- **TYPE** indicates the rule severity:
  - **C** = Constraint (MUST/MUST NOT)
  - **P** = Policy (SHOULD/SHOULD NOT)
- **NN** is a sequential number within the language-type combination

Rule IDs are **stable** and **never change** due to ruleset composition.

---

## 3. Rule Classification Overview

The LANG rule catalog is organized into **language-specific categories**.

Each language category contains rules addressing its unique
characteristics, risks, and best practices.

| Language | Prefix    | Total | Constraints | Policies | Focus                                        |
| -------- | --------- | ----- | ----------- | -------- | -------------------------------------------- |
| STD      | LANG-STD  | 7     | 5           | 2        | Language-agnostic core standards             |
| JAVA     | LANG-JAVA | 6     | 2           | 4        | Java type safety, null handling, exceptions  |
| GO       | LANG-GO   | 7     | 4           | 3        | Go error handling, concurrency, simplicity   |
| PY       | LANG-PY   | 6     | 3           | 3        | Python explicitness, typing, error handling  |
| TS       | LANG-TS   | 7     | 4           | 3        | TypeScript strictness, type safety           |
| JS       | LANG-JS   | 7     | 5           | 2        | JavaScript scoping, equality, async control  |
| RS       | LANG-RS   | 7     | 4           | 3        | Rust ownership, safety, concurrency          |
| **Total**|           | **47**| **27**      | **20**   |                                              |

No rule may exist outside these language categories.

---

## 4. Rule List and Descriptions

### STD — Standard (Core)

Language-agnostic coding standards applicable to all programming languages.
These rules form the baseline that all language-specific rules extend.

#### **LANG-STD-C-01**
- type: Constraint
- description: Code MUST exhibit deterministic and reproducible behavior.

#### **LANG-STD-C-02**
- type: Constraint
- description: Code MUST have explicit control flow and state management.

#### **LANG-STD-C-03**
- type: Constraint
- description: Code MUST NOT introduce hidden external dependencies.

#### **LANG-STD-C-04**
- type: Constraint
- description: Code MUST handle sensitive data safely with explicit protection.

#### **LANG-STD-P-01**
- type: Policy
- description: Code structure SHOULD be intent-revealing and self-documenting.

#### **LANG-STD-P-02**
- type: Policy
- description: Code SHOULD validate boundaries and make errors visible at the earliest possible point.

#### **LANG-STD-C-05**
- type: Constraint
- description: AI behavior MUST be explicitly limited to declared scopes and constraints.

---

### JAVA — Java Language Rules

Java-specific coding standards focusing on type safety, null handling,
exception management, and immutability.

#### **LANG-JAVA-C-01**
- type: Constraint
- description: Java code MUST use explicit and appropriate types.

#### **LANG-JAVA-P-01**
- type: Policy
- description: Java inheritance SHOULD be used with explicit justification and limited depth.

#### **LANG-JAVA-C-02**
- type: Constraint
- description: Java code MUST handle null explicitly using Optional or explicit null checks.

#### **LANG-JAVA-P-02**
- type: Policy
- description: Java checked exceptions SHOULD be used judiciously with proper handling.

#### **LANG-JAVA-P-03**
- type: Policy
- description: Java code SHOULD prefer immutable data structures for thread safety.

#### **LANG-JAVA-P-04**
- type: Policy
- description: Java identifiers SHOULD be intent-revealing with clear documentation.

---

### GO — Go Language Rules

Go-specific coding standards focusing on explicit error handling,
simple control flow, and concurrency safety.

#### **LANG-GO-C-01**
- type: Constraint
- description: Go code MUST handle all errors explicitly using multiple return values.

#### **LANG-GO-C-02**
- type: Constraint
- description: Go control flow MUST be simple and explicit, avoiding deep nesting.

#### **LANG-GO-C-03**
- type: Constraint
- description: Go concurrency MUST have explicit ownership and lifecycle management.

#### **LANG-GO-P-01**
- type: Policy
- description: Go code SHOULD prefer composition over inheritance.

#### **LANG-GO-P-02**
- type: Policy
- description: Go interfaces SHOULD be minimal and defined at the point of use.

#### **LANG-GO-C-04**
- type: Constraint
- description: Go code MUST exhibit deterministic behavior with explicit side effects.

#### **LANG-GO-P-03**
- type: Policy
- description: Go identifiers SHOULD be intent-revealing with clear package documentation.

---

### PY — Python Language Rules

Python-specific coding standards focusing on explicitness over cleverness,
explicit error handling, and type safety.

#### **LANG-PY-C-01**
- type: Constraint
- description: Python code MUST prioritize explicitness over cleverness or implicit features.

#### **LANG-PY-C-02**
- type: Constraint
- description: Python exceptions MUST be handled explicitly with specific exception types.

#### **LANG-PY-P-01**
- type: Policy
- description: Python data structures SHOULD use type hints for public APIs.

#### **LANG-PY-P-02**
- type: Policy
- description: Python code SHOULD validate boundary inputs explicitly.

#### **LANG-PY-C-03**
- type: Constraint
- description: Python core logic MUST be deterministic with explicit randomness control.

#### **LANG-PY-P-03**
- type: Policy
- description: Python comments and docstrings SHOULD be intent-revealing and maintained with code.

---

### TS — TypeScript Language Rules

TypeScript-specific coding standards focusing on strict type checking,
explicit type annotations, and null safety.

#### **LANG-TS-C-01**
- type: Constraint
- description: TypeScript projects MUST enable strict type checking (`strict: true`).

#### **LANG-TS-C-02**
- type: Constraint
- description: TypeScript public APIs MUST have explicit type annotations for all parameters and return values.

#### **LANG-TS-P-01**
- type: Policy
- description: TypeScript code SHOULD use interfaces and type aliases appropriately based on use case.

#### **LANG-TS-C-03**
- type: Constraint
- description: TypeScript code MUST NOT use unsafe type assertions without runtime validation.

#### **LANG-TS-C-04**
- type: Constraint
- description: TypeScript code MUST handle `null` and `undefined` explicitly.

#### **LANG-TS-P-02**
- type: Policy
- description: TypeScript async interfaces SHOULD be type-safe with explicit error types.

#### **LANG-TS-P-03**
- type: Policy
- description: TypeScript identifiers SHOULD be intent-revealing with TSDoc comments.

---

### JS — JavaScript Language Rules

JavaScript-specific coding standards focusing on explicit scoping,
strict equality, and async control flow.

#### **LANG-JS-C-01**
- type: Constraint
- description: JavaScript variables MUST be declared with explicit scope (`const`/`let`, not `var`).

#### **LANG-JS-C-02**
- type: Constraint
- description: JavaScript comparisons MUST use strict equality (`===` and `!==`).

#### **LANG-JS-C-03**
- type: Constraint
- description: JavaScript async code MUST use explicit control flow (`async`/`await` preferred).

#### **LANG-JS-C-04**
- type: Constraint
- description: JavaScript errors MUST be handled explicitly with specific error types.

#### **LANG-JS-P-01**
- type: Policy
- description: JavaScript code SHOULD prefer immutable data patterns (`const`, `Object.freeze`).

#### **LANG-JS-C-05**
- type: Constraint
- description: JavaScript code MUST NOT introduce implicit globals or use dynamic code execution.

#### **LANG-JS-P-02**
- type: Policy
- description: JavaScript identifiers SHOULD be intent-revealing with JSDoc comments.

---

### RS — Rust Language Rules

Rust-specific coding standards focusing on ownership and borrowing,
unsafe code restrictions, and error handling.

#### **LANG-RS-C-01**
- type: Constraint
- description: Rust code MUST respect ownership and borrowing rules with explicit lifetime management.

#### **LANG-RS-C-02**
- type: Constraint
- description: Rust code MUST NOT use `unsafe` blocks by default; unsafe code requires explicit justification.

#### **LANG-RS-C-03**
- type: Constraint
- description: Rust code MUST handle errors explicitly using `Result<T, E>` and `Option<T>`.

#### **LANG-RS-C-04**
- type: Constraint
- description: Rust concurrency MUST be deterministic with explicit synchronization primitives.

#### **LANG-RS-P-01**
- type: Policy
- description: Rust code SHOULD prefer immutability by default (immutable bindings).

#### **LANG-RS-P-02**
- type: Policy
- description: Rust code SHOULD have explicit lifetime annotations and clear API contracts.

#### **LANG-RS-P-03**
- type: Policy
- description: Rust identifiers SHOULD be intent-revealing with documentation comments.

---

## 5. Rule Application Model

### Layered Application

LANG rules are applied in layers:

1. **Core Layer** — All projects MUST comply with LANG-STD rules
2. **Language Layer** — Projects using a specific language MUST comply
   with the corresponding language-specific rules

### Example: Java Project

```yaml
includes:
  - ruleset_id: lang.core        # LANG-STD rules (core standards)
    version: ">=1.0.0"
  - ruleset_id: lang.java        # LANG-JAVA rules (Java-specific)
    version: ">=1.0.0"
```

### Combination with Other Domains

LANG rules compose with other domains:

```
source_code.add.java = CODE rules (operation constraints)
                     + LANG rules (language standards)
                     + GOV rules (governance principles)
```

---

## 6. Severity and Enforcement

### Constraint (C) Rules

- Use normative keywords: **MUST**, **MUST NOT**
- Violations trigger governance enforcement
- Require immediate remediation or documented exception

### Policy (P) Rules

- Use normative keywords: **SHOULD**, **SHOULD NOT**
- Violations require documented justification
- Tracked for continuous improvement

---

## 7. Notes on Rulesets and Future Extensions

- **Rulesets** only select and compose rules.
  They do not define new semantics.

- Language-specific governance severity, risk classification, and
  escalation logic are intentionally **handled by governance systems**,
  not embedded in LANG rules.

- Future languages will be added as new categories, for example:
  - `LANG-CPP-*-*` for C++
  - `LANG-KT-*-*` for Kotlin
  - `LANG-CS-*-*` for C#

---

## 8. Summary

The LANG rule catalog defines the **minimum enforceable contract**
for safe, explicit, and maintainable code in each supported language.

If a coding practice cannot be evaluated at the language-quality level,
it does not belong here.
