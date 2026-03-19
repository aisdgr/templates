# AISDGR Rules Complete List

This document lists all rules in the AISDGR (AI Software Development and Governance Rules) framework.

---

## CODE Domain

Code Domain - Defines code-level structured constraints

**Total**: 38 rules

### AR - Artifact Isolation

| Rule ID      | Type       | Description                                                         |
| ------------ | ---------- | ------------------------------------------------------------------- |
| CODE-AR-C-01 | Constraint | Must not create undeclared artifact types                           |
| CODE-AR-C-02 | Constraint | Must not modify undeclared artifact types                           |
| CODE-AR-C-03 | Constraint | MUST NOT modify artifacts belonging to more than one artifact types |
| CODE-AR-P-01 | Policy     | Permission to create new artifacts *must* be explicitly defined     |
| CODE-AR-P-02 | Policy     | All generated artifacts *must* be addressable and locatable         |

### BD - Boundary & Stop

| Rule ID      | Type       | Description                                                              |
| ------------ | ---------- | ------------------------------------------------------------------------ |
| CODE-BD-C-01 | Constraint | Code **MUST NOT** modify code artifacts beyond declared boundaries       |
| CODE-BD-C-02 | Constraint | Code **MUST NOT** access modules or resources beyond boundaries          |
| CODE-BD-C-03 | Constraint | Code **MUST NOT** introduce undeclared external dependencies             |
| CODE-BD-P-01 | Policy     | Code execution *must* stop after declared boundaries                     |
| CODE-BD-P-02 | Policy     | Code execution *must* stop when boundary conflicts are detected          |
| CODE-BD-P-03 | Policy     | Code execution *must* stop when boundaries contain no executable targets |

### CN - Constraint Neutrality

| Rule ID      | Type       | Description                                      |
| ------------ | ---------- | ------------------------------------------------ |
| CODE-CN-C-01 | Constraint | Must never infer undeclared boundaries           |
| CODE-CN-C-02 | Constraint | Must never infer undeclared requirements         |
| CODE-CN-C-03 | Constraint | Must never infer undeclared verification targets |

### LG - Logging & Report

| Rule ID      | Type       | Description                                                  |
| ------------ | ---------- | ------------------------------------------------------------ |
| CODE-LG-C-01 | Constraint | Rationale must never be empty or purely repetitive           |
| CODE-LG-C-02 | Constraint | Must never silently ignore rule violations                   |
| CODE-LG-P-01 | Policy     | Each execution *must* generate locatable execution logs      |
| CODE-LG-P-02 | Policy     | Execution logs *must* link to corresponding traceability IDs |
| CODE-LG-P-03 | Policy     | Each execution *must* include rationale explanation          |
| CODE-LG-P-04 | Policy     | *Must* provide change summary                                |
| CODE-LG-P-05 | Policy     | Change summary *must* match actual code changes              |
| CODE-LG-P-06 | Policy     | *Must* generate rule evaluation report                       |
| CODE-LG-P-07 | Policy     | Rule report *must* include evaluation results for each rule  |

### ST - Structural Change

| Rule ID      | Type       | Description                                                              |
| ------------ | ---------- | ------------------------------------------------------------------------ |
| CODE-ST-C-01 | Constraint | Unauthorized structural refactoring is prohibited                        |
| CODE-ST-C-02 | Constraint | Structural refactoring and logic changes must never occur simultaneously |
| CODE-ST-C-03 | Constraint | Introduction of new features is prohibited unless explicitly allowed     |
| CODE-ST-C-04 | Constraint | Deletion of existing behavior is prohibited unless explicitly allowed    |
| CODE-ST-P-01 | Policy     | Permission for structural refactoring *must* be explicit                 |

### TI - Test Integrity

| Rule ID      | Type       | Description                                                         |
| ------------ | ---------- | ------------------------------------------------------------------- |
| CODE-TI-C-01 | Constraint | Test artifacts must never modify or affect production code          |
| CODE-TI-C-02 | Constraint | Test changes must not expand verification scope                     |
| CODE-TI-C-03 | Constraint | Tests must never redefine expected behavior                         |
| CODE-TI-C-04 | Constraint | Tests must never infer requirements or behavior from implementation |
| CODE-TI-P-01 | Policy     | Test modifications *must* preserve original structure and intent    |

### TR - Traceability

| Rule ID      | Type       | Description                                                             |
| ------------ | ---------- | ----------------------------------------------------------------------- |
| CODE-TR-C-01 | Constraint | Must never delete existing traceability IDs                             |
| CODE-TR-C-02 | Constraint | Must never generate orphaned code without traceability IDs              |
| CODE-TR-P-01 | Policy     | Generated code *must* include traceability IDs                          |
| CODE-TR-P-02 | Policy     | Traceability IDs *must* be embedded in source code artifacts themselves |
| CODE-TR-P-03 | Policy     | Single code changes *must* contain only one traceability ID             |

---

## DOCS Domain

Documentation Domain - Defines rules for documentation generation and management

**Total**: 34 rules

### AR - Artifact Isolation

| Rule ID      | Type       | Description                                                                        |
| ------------ | ---------- | ---------------------------------------------------------------------------------- |
| DOCS-AR-C-01 | Constraint | AI *must* generate content only within placeholders declared in document templates |
| DOCS-AR-C-02 | Constraint | AI must never generate content across sections                                     |
| DOCS-AR-C-03 | Constraint | AI must never generate default appendices                                          |
| DOCS-AR-C-04 | Constraint | Generated document artifacts *must* be structurally valid                          |

### BD - Boundary & Stop

| Rule ID      | Type       | Description                                              |
| ------------ | ---------- | -------------------------------------------------------- |
| DOCS-BD-C-01 | Constraint | Documents *must* be immutable after approval             |
| DOCS-BD-C-02 | Constraint | Policy violations *must* result in execution termination |
| DOCS-BD-P-01 | Policy     | Generation *should* be explicitly scoped                 |
| DOCS-BD-P-02 | Policy     | Human accountability and oversight *should* be enforced  |

### CN - Constraint Neutrality

| Rule ID      | Type       | Description                            |
| ------------ | ---------- | -------------------------------------- |
| DOCS-CN-C-01 | Constraint | AI must never implicitly infer content |

### ST - Structural Change

| Rule ID      | Type       | Description                                                               |
| ------------ | ---------- | ------------------------------------------------------------------------- |
| DOCS-ST-C-01 | Constraint | General description *must* describe system context                        |
| DOCS-ST-C-02 | Constraint | Non-functional requirements *must* be explicit and measurable             |
| DOCS-ST-C-03 | Constraint | External interfaces *must* be explicitly declared                         |
| DOCS-ST-C-04 | Constraint | Design components *must* declare responsibilities and interactions        |
| DOCS-ST-C-05 | Constraint | Interfaces and adapters *must* be explicit                                |
| DOCS-ST-C-06 | Constraint | Interactions and data flows *must* be explicit                            |
| DOCS-ST-C-07 | Constraint | Error handling strategies *must* be explicit                              |
| DOCS-ST-C-08 | Constraint | Deployment and operational design *must* be explicit                      |
| DOCS-ST-C-09 | Constraint | Design overview *must* be traceable to requirements                       |
| DOCS-ST-C-10 | Constraint | Cross-cutting concerns *must* be traceable to non-functional requirements |
| DOCS-ST-C-11 | Constraint | Design decisions *must* have human accountability                         |
| DOCS-ST-C-12 | Constraint | Architectural context *must* describe scope and boundaries                |
| DOCS-ST-C-13 | Constraint | Module structure *must* define clear boundaries                           |
| DOCS-ST-C-14 | Constraint | Architectural constraints *must* be explicitly declared                   |
| DOCS-ST-C-15 | Constraint | Conceptual models *must* describe methods and patterns                    |
| DOCS-ST-C-16 | Constraint | Decision structures *must* define conditions and outcomes                 |
| DOCS-ST-C-17 | Constraint | Structural overview *must* describe context and hierarchy                 |
| DOCS-ST-C-18 | Constraint | Structural elements *must* define clear responsibilities                  |
| DOCS-ST-C-19 | Constraint | AI *must* generate documentation only when requested                      |
| DOCS-ST-C-20 | Constraint | AI *must* use declarative prompts to generate documentation               |
| DOCS-ST-C-21 | Constraint | AI *must* preserve section hierarchy and required fields                  |
| DOCS-ST-P-01 | Policy     | Introductory sections *should* be informative                             |
| DOCS-ST-P-02 | Policy     | Change history *should* be informative                                    |

### TI - Test Integrity

| Rule ID      | Type   | Description                                        |
| ------------ | ------ | -------------------------------------------------- |
| DOCS-TI-P-01 | Policy | Test specifications *should* follow project policy |

### TR - Traceability

| Rule ID      | Type   | Description                               |
| ------------ | ------ | ----------------------------------------- |
| DOCS-TR-P-01 | Policy | AI *should* use approved semantic sources |

---

## LANG Domain

Language Domain - Defines coding standards for specific programming languages

**Total**: 47 rules

### GO - Go

| Rule ID      | Type       | Description                                                                     |
| ------------ | ---------- | ------------------------------------------------------------------------------- |
| LANG-GO-C-01 | Constraint | Go code *must* handle all errors explicitly using multiple return values        |
| LANG-GO-C-02 | Constraint | Go control flow *must* be simple and explicit, avoiding deep nesting            |
| LANG-GO-C-03 | Constraint | Go concurrency *must* have explicit ownership and lifecycle management          |
| LANG-GO-C-04 | Constraint | Go code *must* exhibit deterministic behavior with explicit side effects        |
| LANG-GO-P-01 | Policy     | Go code *should* prefer composition over inheritance                            |
| LANG-GO-P-02 | Policy     | Go interfaces *should* be minimal and defined at point of use                   |
| LANG-GO-P-03 | Policy     | Go identifiers *should* be intention-revealing with clear package documentation |

### JAVA - Java

| Rule ID        | Type       | Description                                                                    |
| -------------- | ---------- | ------------------------------------------------------------------------------ |
| LANG-JAVA-C-01 | Constraint | Java code *must* use explicit and appropriate types                            |
| LANG-JAVA-C-02 | Constraint | Java code *must* handle null explicitly using Optional or explicit null checks |
| LANG-JAVA-P-01 | Policy     | Java inheritance *should* be used with explicit rationale and limited depth    |
| LANG-JAVA-P-02 | Policy     | Java checked exceptions *should* be used sparingly and handled correctly       |
| LANG-JAVA-P-03 | Policy     | Java code *should* prefer immutable data structures for thread safety          |
| LANG-JAVA-P-04 | Policy     | Java identifiers *should* be intention-revealing with clear documentation      |

### JS - JavaScript

| Rule ID      | Type       | Description                                                                                  |
| ------------ | ---------- | -------------------------------------------------------------------------------------------- |
| LANG-JS-C-01 | Constraint | JavaScript variables *must* be declared with explicit scope (`const`/`let`, not `var`)       |
| LANG-JS-C-02 | Constraint | JavaScript comparisons *must* use strict equality (`===` and `!==`)                          |
| LANG-JS-C-03 | Constraint | JavaScript async code *must* use explicit control flow (`async`/`await` preferred)           |
| LANG-JS-C-04 | Constraint | JavaScript errors *must* be handled explicitly with specific error types                     |
| LANG-JS-C-05 | Constraint | JavaScript code must never introduce implicit global variables or use dynamic code execution |
| LANG-JS-P-01 | Policy     | JavaScript code *should* prefer immutable data patterns (`const`, `Object.freeze`)           |
| LANG-JS-P-02 | Policy     | JavaScript identifiers *should* be intention-revealing with JSDoc comments                   |

### PY - Python

| Rule ID      | Type       | Description                                                                                |
| ------------ | ---------- | ------------------------------------------------------------------------------------------ |
| LANG-PY-C-01 | Constraint | Python code *must* prioritize explicitness over cleverness or implicit features            |
| LANG-PY-C-02 | Constraint | Python exceptions *must* be handled explicitly with specific exception types               |
| LANG-PY-C-03 | Constraint | Python core logic *must* be deterministic with explicit randomness control                 |
| LANG-PY-P-01 | Policy     | Python data structures *should* use type hints for public APIs                             |
| LANG-PY-P-02 | Policy     | Python code *should* explicitly validate boundary inputs                                   |
| LANG-PY-P-03 | Policy     | Python annotations and docstrings *should* be intention-revealing and maintained with code |

### RS - Rust

| Rule ID      | Type       | Description                                                                               |
| ------------ | ---------- | ----------------------------------------------------------------------------------------- |
| LANG-RS-C-01 | Constraint | Rust code *must* respect ownership and borrowing rules with explicit lifecycle management |
| LANG-RS-C-02 | Constraint | Rust code must never default to `unsafe` blocks; unsafe code requires explicit rationale  |
| LANG-RS-C-03 | Constraint | Rust code *must* handle errors explicitly using `Result<T, E>` and `Option<T>`            |
| LANG-RS-C-04 | Constraint | Rust concurrency *must* be deterministic with explicit synchronization primitives         |
| LANG-RS-P-01 | Policy     | Rust code *should* prefer immutability by default (immutable bindings)                    |
| LANG-RS-P-02 | Policy     | Rust code *should* have explicit lifetime annotations and clear API contracts             |
| LANG-RS-P-03 | Policy     | Rust identifiers *should* be intention-revealing with documentation comments              |

### STD - Standard

| Rule ID       | Type       | Description                                                                          |
| ------------- | ---------- | ------------------------------------------------------------------------------------ |
| LANG-STD-C-01 | Constraint | Code *must* exhibit deterministic and reproducible behavior                          |
| LANG-STD-C-02 | Constraint | Code *must* have explicit control flow and state management                          |
| LANG-STD-C-03 | Constraint | Code must never introduce hidden external dependencies                               |
| LANG-STD-C-04 | Constraint | Code *must* handle sensitive data safely with explicit protection                    |
| LANG-STD-C-05 | Constraint | AI behavior *must* be explicitly constrained to declared scope and constraints       |
| LANG-STD-P-01 | Policy     | Code structure *should* be intention-revealing and self-documenting                  |
| LANG-STD-P-02 | Policy     | Code *should* validate boundaries at earliest possible point and make errors visible |

### TS - TypeScript

| Rule ID      | Type       | Description                                                                                          |
| ------------ | ---------- | ---------------------------------------------------------------------------------------------------- |
| LANG-TS-C-01 | Constraint | TypeScript projects *must* enable strict type checking (`strict: true`)                              |
| LANG-TS-C-02 | Constraint | TypeScript public APIs *must* provide explicit type annotations for all parameters and return values |
| LANG-TS-C-03 | Constraint | TypeScript code must never use unsafe type assertions without runtime validation                     |
| LANG-TS-C-04 | Constraint | TypeScript code *must* handle `null` and `undefined` explicitly                                      |
| LANG-TS-P-01 | Policy     | TypeScript code *should* use interfaces and type aliases appropriately for use cases                 |
| LANG-TS-P-02 | Policy     | TypeScript async interfaces *should* be type-safe with explicit error types                          |
| LANG-TS-P-03 | Policy     | TypeScript identifiers *should* be intention-revealing with TSDoc comments                           |

---

## GOV Domain

Governance Domain - Defines governance principles for AI-assisted development

**Total**: 7 rules

### ENF - Enforcement

| Rule ID      | Type       | Description                                                                                               |
| ------------ | ---------- | --------------------------------------------------------------------------------------------------------- |
| GOV-ENF-C-01 | Constraint | All AI-generated code *must* comply with core and language-specific coding standards                      |
| GOV-ENF-C-02 | Constraint | Detected violations *must* generate a Code Validation Report (CVR), never auto-fixed                      |
| GOV-ENF-P-01 | Policy     | AI execution *may* continue in presence of violations, but violations *must* remain visible and traceable |

### PR - Principles

| Rule ID     | Type       | Description                                              |
| ----------- | ---------- | -------------------------------------------------------- |
| GOV-PR-C-01 | Constraint | AI is a constrained executor, not an autonomous designer |
| GOV-PR-C-02 | Constraint | All AI behavior *must* be explicitly governed            |
| GOV-PR-C-03 | Constraint | Violations *must* explicitly surface                     |
| GOV-PR-P-01 | Policy     | Validity and correctness are separate responsibilities   |

---

## Rule Statistics

| Domain    | Total Rules | Constraints | Policies |
| --------- | ----------- | ----------- | -------- |
| CODE      | 38          | 21          | 17       |
| DOCS      | 34          | 28          | 6        |
| LANG      | 47          | 27          | 20       |
| GOV       | 7           | 5           | 2        |
| **Total** | **126**     | **81**      | **45**   |

---

**Version**: 1.0.0
**Last Updated**: 2026-03-19
**Maintainer**: AISDGR
