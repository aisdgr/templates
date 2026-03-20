# AISDGR Rules Complete List

This document lists all rules in the AISDGR (AI Software Development and Governance Rules) framework.

**Total**: 126 rules

---

## CORE Domain

Core Domain - Defines cross-domain shared behavior constraint rules applicable to all artifact types.

**Total**: 18 rules

### AR - Artifact Isolation

| Rule ID         | Type       | Description                                                         |
| --------------- | ---------- | ------------------------------------------------------------------- |
| CORE-AR-C-001   | Constraint | Must not create undeclared artifact types                           |
| CORE-AR-C-002   | Constraint | Must not modify undeclared artifact types                           |
| CORE-AR-P-001   | Policy     | Permission to create new artifacts *must* be explicitly defined     |
| CORE-AR-P-002   | Policy     | All generated artifacts *must* be addressable and locatable         |

### BD - Boundary & Stop

| Rule ID         | Type       | Description                                                              |
| --------------- | ---------- | ------------------------------------------------------------------------ |
| CORE-BD-C-001   | Constraint | Code **MUST NOT** modify code artifacts beyond declared boundaries       |
| CORE-BD-C-002   | Constraint | Code **MUST NOT** access modules or resources beyond boundaries          |
| CORE-BD-C-003   | Constraint | Code **MUST NOT** introduce undeclared external dependencies             |
| CORE-BD-P-001   | Policy     | Code execution *must* stop after declared boundaries                     |
| CORE-BD-P-002   | Policy     | Code execution *must* stop when boundary conflicts are detected          |
| CORE-BD-P-003   | Policy     | Code execution *must* stop when boundaries contain no executable targets |

### CN - Constraint Neutrality

| Rule ID         | Type       | Description                                      |
| --------------- | ---------- | ------------------------------------------------ |
| CORE-CN-C-001   | Constraint | Must never infer undeclared boundaries           |
| CORE-CN-C-002   | Constraint | Must never infer undeclared requirements         |
| CORE-CN-C-003   | Constraint | Must never infer undeclared verification targets |

### TR - Traceability

| Rule ID         | Type       | Description                                                             |
| --------------- | ---------- | ----------------------------------------------------------------------- |
| CORE-TR-C-001   | Constraint | Must never delete existing traceability IDs                             |
| CORE-TR-C-002   | Constraint | Must never generate orphaned code without traceability IDs              |
| CORE-TR-P-001   | Policy     | Generated code *must* include traceability IDs                          |
| CORE-TR-P-002   | Policy     | Traceability IDs *must* be embedded in source code artifacts themselves |
| CORE-TR-P-003   | Policy     | Single code changes *must* contain only one traceability ID             |

---

## CODE Domain

Code Domain - Defines code-specific behavior constraint rules beyond CORE.

**Total**: 20 rules

### AR - Artifact Isolation

| Rule ID         | Type       | Description                                                         |
| --------------- | ---------- | ------------------------------------------------------------------- |
| CODE-AR-C-003   | Constraint | MUST NOT modify artifacts belonging to more than one artifact types |

### LG - Logging & Report

| Rule ID         | Type       | Description                                                  |
| --------------- | ---------- | ------------------------------------------------------------ |
| CODE-LG-C-001   | Constraint | Rationale must never be empty or purely repetitive           |
| CODE-LG-C-002   | Constraint | Must never silently ignore rule violations                   |
| CODE-LG-P-001   | Policy     | Each execution *must* generate locatable execution logs      |
| CODE-LG-P-002   | Policy     | Execution logs *must* link to corresponding traceability IDs |
| CODE-LG-P-003   | Policy     | Each execution *must* include rationale explanation          |
| CODE-LG-P-004   | Policy     | *Must* provide change summary                                |
| CODE-LG-P-005   | Policy     | Change summary *must* match actual code changes              |
| CODE-LG-P-006   | Policy     | *Must* generate rule evaluation report                       |
| CODE-LG-P-007   | Policy     | Rule report *must* include evaluation results for each rule  |

### ST - Structural Change

| Rule ID         | Type       | Description                                                              |
| --------------- | ---------- | ------------------------------------------------------------------------ |
| CODE-ST-C-001   | Constraint | Unauthorized structural refactoring is prohibited                        |
| CODE-ST-C-002   | Constraint | Structural refactoring and logic changes must never occur simultaneously |
| CODE-ST-C-003   | Constraint | Introduction of new features is prohibited unless explicitly allowed     |
| CODE-ST-C-004   | Constraint | Deletion of existing behavior is prohibited unless explicitly allowed    |
| CODE-ST-P-001   | Policy     | Permission for structural refactoring *must* be explicit                 |

### TI - Test Integrity

| Rule ID         | Type       | Description                                                         |
| --------------- | ---------- | ------------------------------------------------------------------- |
| CODE-TI-C-001   | Constraint | Test artifacts must never modify or affect production code          |
| CODE-TI-C-002   | Constraint | Test changes must not expand verification scope                     |
| CODE-TI-C-003   | Constraint | Tests must never redefine expected behavior                         |
| CODE-TI-C-004   | Constraint | Tests must never infer requirements or behavior from implementation |
| CODE-TI-P-001   | Policy     | Test modifications *must* preserve original structure and intent    |

---

## DOCS Domain

Documentation Domain - Defines rules for documentation generation and management.

**Total**: 37 rules

### AR - Artifact Isolation

| Rule ID         | Type       | Description                                                                        |
| --------------- | ---------- | ---------------------------------------------------------------------------------- |
| DOCS-AR-C-001   | Constraint | AI *must* generate content only within placeholders declared in document templates |
| DOCS-AR-C-002   | Constraint | AI must never generate content across sections                                     |
| DOCS-AR-C-003   | Constraint | AI must never generate default appendices                                          |
| DOCS-AR-C-004   | Constraint | Generated document artifacts *must* be structurally valid                          |

### BD - Boundary & Stop

| Rule ID         | Type       | Description                                              |
| --------------- | ---------- | -------------------------------------------------------- |
| DOCS-BD-C-001   | Constraint | Documents *must* be immutable after approval             |
| DOCS-BD-C-002   | Constraint | Policy violations *must* result in execution termination |
| DOCS-BD-P-001   | Policy     | Generation *should* be explicitly scoped                 |
| DOCS-BD-P-002   | Policy     | Human accountability and oversight *should* be enforced  |

### CN - Constraint Neutrality

| Rule ID         | Type       | Description                            |
| --------------- | ---------- | -------------------------------------- |
| DOCS-CN-C-001   | Constraint | AI must never implicitly infer content |

### LG - Logging & Report

| Rule ID         | Type       | Description                                                  |
| --------------- | ---------- | ------------------------------------------------------------ |
| DOCS-LG-P-001   | Policy     | Each documentation generation *must* generate execution logs |
| DOCS-LG-P-002   | Policy     | Documentation logs *must* link to traceability IDs           |
| DOCS-LG-P-003   | Policy     | Each documentation generation *must* include rationale       |

### ST - Structural Change

| Rule ID         | Type       | Description                                                               |
| --------------- | ---------- | ------------------------------------------------------------------------- |
| DOCS-ST-C-001   | Constraint | General description *must* describe system context                        |
| DOCS-ST-C-002   | Constraint | Non-functional requirements *must* be explicit and measurable             |
| DOCS-ST-C-003   | Constraint | External interfaces *must* be explicitly declared                         |
| DOCS-ST-C-004   | Constraint | Design components *must* declare responsibilities and interactions        |
| DOCS-ST-C-005   | Constraint | Interfaces and adapters *must* be explicit                                |
| DOCS-ST-C-006   | Constraint | Interactions and data flows *must* be explicit                            |
| DOCS-ST-C-007   | Constraint | Error handling strategies *must* be explicit                              |
| DOCS-ST-C-008   | Constraint | Deployment and operational design *must* be explicit                      |
| DOCS-ST-C-009   | Constraint | Design overview *must* be traceable to requirements                       |
| DOCS-ST-C-010   | Constraint | Cross-cutting concerns *must* be traceable to non-functional requirements |
| DOCS-ST-C-011   | Constraint | Design decisions *must* have human accountability                         |
| DOCS-ST-C-012   | Constraint | Architectural context *must* describe scope and boundaries                |
| DOCS-ST-C-013   | Constraint | Module structure *must* define clear boundaries                           |
| DOCS-ST-C-014   | Constraint | Architectural constraints *must* be explicitly declared                   |
| DOCS-ST-C-015   | Constraint | Conceptual models *must* describe methods and patterns                    |
| DOCS-ST-C-016   | Constraint | Decision structures *must* define conditions and outcomes                 |
| DOCS-ST-C-017   | Constraint | Structural overview *must* describe context and hierarchy                 |
| DOCS-ST-C-018   | Constraint | Structural elements *must* define clear responsibilities                  |
| DOCS-ST-C-019   | Constraint | AI *must* generate documentation only when requested                      |
| DOCS-ST-C-020   | Constraint | AI *must* use declarative prompts to generate documentation               |
| DOCS-ST-C-021   | Constraint | AI *must* preserve section hierarchy and required fields                  |
| DOCS-ST-P-001   | Policy     | Introductory sections *should* be informative                             |
| DOCS-ST-P-002   | Policy     | Change history *should* be informative                                    |

### TI - Test Integrity

| Rule ID         | Type   | Description                                        |
| --------------- | ------ | -------------------------------------------------- |
| DOCS-TI-P-001   | Policy | Test specifications *should* follow project policy |

### TR - Traceability

| Rule ID         | Type   | Description                               |
| --------------- | ------ | ----------------------------------------- |
| DOCS-TR-P-001   | Policy | AI *should* use approved semantic sources |

---

## LANG Domain

Language Domain - Defines coding standards for specific programming languages under Structural Change category.

**Total**: 47 rules

### GO - Go Language

| Rule ID          | Type       | Description                                                                     |
| ---------------- | ---------- | ------------------------------------------------------------------------------- |
| LANG-ST-GO-001   | Constraint | Go code *must* handle all errors explicitly using multiple return values        |
| LANG-ST-GO-002   | Constraint | Go control flow *must* be simple and explicit, avoiding deep nesting            |
| LANG-ST-GO-003   | Constraint | Go concurrency *must* have explicit ownership and lifecycle management          |
| LANG-ST-GO-004   | Constraint | Go code *must* exhibit deterministic behavior with explicit side effects        |
| LANG-ST-GO-101   | Policy     | Go code *should* prefer composition over inheritance                            |
| LANG-ST-GO-102   | Policy     | Go interfaces *should* be minimal and defined at point of use                   |
| LANG-ST-GO-103   | Policy     | Go identifiers *should* be intention-revealing with clear package documentation |

### JV - Java Language

| Rule ID          | Type       | Description                                                                    |
| ---------------- | ---------- | ------------------------------------------------------------------------------ |
| LANG-ST-JV-001   | Constraint | Java code *must* use explicit and appropriate types                            |
| LANG-ST-JV-002   | Constraint | Java code *must* handle null explicitly using Optional or explicit null checks |
| LANG-ST-JV-101   | Policy     | Java inheritance *should* be used with explicit rationale and limited depth    |
| LANG-ST-JV-102   | Policy     | Java checked exceptions *should* be used sparingly and handled correctly       |
| LANG-ST-JV-103   | Policy     | Java code *should* prefer immutable data structures for thread safety          |
| LANG-ST-JV-104   | Policy     | Java identifiers *should* be intention-revealing with clear documentation      |

### JS - JavaScript Language

| Rule ID          | Type       | Description                                                                                  |
| ---------------- | ---------- | -------------------------------------------------------------------------------------------- |
| LANG-ST-JS-001   | Constraint | JavaScript variables *must* be declared with explicit scope (`const`/`let`, not `var`)       |
| LANG-ST-JS-002   | Constraint | JavaScript comparisons *must* use strict equality (`===` and `!==`)                          |
| LANG-ST-JS-003   | Constraint | JavaScript async code *must* use explicit control flow (`async`/`await` preferred)           |
| LANG-ST-JS-004   | Constraint | JavaScript errors *must* be handled explicitly with specific error types                     |
| LANG-ST-JS-005   | Constraint | JavaScript code must never introduce implicit global variables or use dynamic code execution |
| LANG-ST-JS-101   | Policy     | JavaScript code *should* prefer immutable data patterns (`const`, `Object.freeze`)           |
| LANG-ST-JS-102   | Policy     | JavaScript identifiers *should* be intention-revealing with JSDoc comments                   |

### PY - Python Language

| Rule ID          | Type       | Description                                                                                |
| ---------------- | ---------- | ------------------------------------------------------------------------------------------ |
| LANG-ST-PY-001   | Constraint | Python code *must* prioritize explicitness over cleverness or implicit features            |
| LANG-ST-PY-002   | Constraint | Python exceptions *must* be handled explicitly with specific exception types               |
| LANG-ST-PY-003   | Constraint | Python core logic *must* be deterministic with explicit randomness control                 |
| LANG-ST-PY-101   | Policy     | Python data structures *should* use type hints for public APIs                             |
| LANG-ST-PY-102   | Policy     | Python code *should* explicitly validate boundary inputs                                   |
| LANG-ST-PY-103   | Policy     | Python annotations and docstrings *should* be intention-revealing and maintained with code |

### RS - Rust Language

| Rule ID          | Type       | Description                                                                               |
| ---------------- | ---------- | ----------------------------------------------------------------------------------------- |
| LANG-ST-RS-001   | Constraint | Rust code *must* respect ownership and borrowing rules with explicit lifecycle management |
| LANG-ST-RS-002   | Constraint | Rust code must never default to `unsafe` blocks; unsafe code requires explicit rationale  |
| LANG-ST-RS-003   | Constraint | Rust code *must* handle errors explicitly using `Result<T, E>` and `Option<T>`            |
| LANG-ST-RS-004   | Constraint | Rust concurrency *must* be deterministic with explicit synchronization primitives         |
| LANG-ST-RS-101   | Policy     | Rust code *should* prefer immutability by default (immutable bindings)                    |
| LANG-ST-RS-102   | Policy     | Rust code *should* have explicit lifetime annotations and clear API contracts             |
| LANG-ST-RS-103   | Policy     | Rust identifiers *should* be intention-revealing with documentation comments              |

### STD - Standard (Language-Agnostic)

| Rule ID          | Type       | Description                                                                          |
| ---------------- | ---------- | ------------------------------------------------------------------------------------ |
| LANG-ST-STD-001  | Constraint | Code *must* exhibit deterministic and reproducible behavior                          |
| LANG-ST-STD-002  | Constraint | Code *must* have explicit control flow and state management                          |
| LANG-ST-STD-003  | Constraint | Code must never introduce hidden external dependencies                               |
| LANG-ST-STD-004  | Constraint | Code *must* handle sensitive data safely with explicit protection                    |
| LANG-ST-STD-005  | Constraint | AI behavior *must* be explicitly constrained to declared scope and constraints       |
| LANG-ST-STD-101  | Policy     | Code structure *should* be intention-revealing and self-documenting                  |
| LANG-ST-STD-102  | Policy     | Code *should* validate boundaries at earliest possible point and make errors visible |

### TS - TypeScript Language

| Rule ID          | Type       | Description                                                                                          |
| ---------------- | ---------- | ---------------------------------------------------------------------------------------------------- |
| LANG-ST-TS-001   | Constraint | TypeScript projects *must* enable strict type checking (`strict: true`)                              |
| LANG-ST-TS-002   | Constraint | TypeScript public APIs *must* provide explicit type annotations for all parameters and return values |
| LANG-ST-TS-003   | Constraint | TypeScript code must never use unsafe type assertions without runtime validation                     |
| LANG-ST-TS-004   | Constraint | TypeScript code *must* handle `null` and `undefined` explicitly                                      |
| LANG-ST-TS-101   | Policy     | TypeScript code *should* use interfaces and type aliases appropriately for use cases                 |
| LANG-ST-TS-102   | Policy     | TypeScript async interfaces *should* be type-safe with explicit error types                          |
| LANG-ST-TS-103   | Policy     | TypeScript identifiers *should* be intention-revealing with TSDoc comments                           |

---

## GOV Domain

Governance Domain - Defines governance principles and enforcement mechanisms for AI-assisted development.

**Total**: 7 rules

### ENF - Enforcement

| Rule ID         | Type       | Description                                                                                               |
| --------------- | ---------- | --------------------------------------------------------------------------------------------------------- |
| GOV-ENF-C-001   | Constraint | All AI-generated code *must* comply with core and language-specific coding standards                      |
| GOV-ENF-C-002   | Constraint | Detected violations *must* generate a Code Validation Report (CVR), never auto-fixed                      |
| GOV-ENF-P-001   | Policy     | AI execution *may* continue in presence of violations, but violations *must* remain visible and traceable |

### PR - Principles

| Rule ID         | Type       | Description                                              |
| --------------- | ---------- | -------------------------------------------------------- |
| GOV-PR-C-001    | Constraint | AI is a constrained executor, not an autonomous designer |
| GOV-PR-C-002    | Constraint | All AI behavior *must* be explicitly governed            |
| GOV-PR-C-003    | Constraint | Violations *must* explicitly surface                     |
| GOV-PR-P-001    | Policy     | Validity and correctness are separate responsibilities   |

---

## Rule Statistics

| Domain    | Total Rules | Constraints | Policies |
| --------- | ----------- | ----------- | -------- |
| CORE      | 18          | 11          | 7        |
| CODE      | 20          | 9           | 11       |
| DOCS      | 37          | 28          | 9        |
| LANG      | 47          | 27          | 20       |
| GOV       | 7           | 5           | 2        |
| **Total** | **126**     | **81**      | **45**   |

---

## Architecture Overview

### Domain Layer

- **CORE**: Cross-domain shared rules applicable to all artifact types
- **CODE**: Code-specific rules beyond CORE
- **DOCS**: Documentation-specific rules
- **LANG**: Language-specific coding standards (application domain dimension)
- **GOV**: Governance principles and enforcement

### Behavior Constraint Category Layer

- **AR**: Artifact Isolation
- **BD**: Boundary & Stop
- **CN**: Constraint Neutrality
- **LG**: Logging & Report
- **ST**: Structural Change
- **TI**: Test Integrity
- **TR**: Traceability
- **ENF**: Enforcement (GOV special)
- **PR**: Principles (GOV special)

### Rule ID Format

```
{DOMAIN}-{CATEGORY}-{SUBTYPE}-{NUMBER}
```

- **DOMAIN**: CORE | CODE | DOCS | LANG | GOV
- **CATEGORY**: AR | BD | CN | LG | ST | TI | TR | ENF | PR
- **SUBTYPE**: C (Constraint) | P (Policy) | Language code (GO, JV, JS, PY, RS, TS, STD)
- **NUMBER**: 001-099 (core), 100-199 (extended)

---

## Migration Notes

This architecture was restructured on 2026-03-19. Key changes:

1. **CORE Domain created**: 18 rules migrated from CODE
2. **CODE Domain reduced**: 18 rules moved to CORE, 20 rules remain
3. **DOCS Domain expanded**: 3 new LG rules added
4. **LANG Domain restructured**: All rules moved to ST category with new ID format
5. **Rule ID numbering**: Standardized to 3-digit format

For detailed migration mapping, see [RULE_ID_MIGRATION_MAP.md](./RULE_ID_MIGRATION_MAP.md).

For Application Ruleset examples, see [APPLICATION_RULESET_EXAMPLES.md](./APPLICATION_RULESET_EXAMPLES.md).

---

**Version**: 2.0.0
**Last Updated**: 2026-03-19
**Maintainer**: AISDGR
