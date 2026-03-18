# DOCS Rulesets

## Overview

This directory contains rulesets for document generation, update, and validation governance. Each ruleset composes scenario-agnostic DOCS rules for specific intents and document types.

## Intent Classification

| Intent    | Description                                  | Operations                                      |
| --------- | -------------------------------------------- | ----------------------------------------------- |
| generate  | Generate new document or regenerate sections | Create new document, add sections, fill content |
| update    | Update existing document sections            | Modify content, refine sections, adjust values  |
| validate  | Validate document against governance rules   | Check immutability, verify structure            |

## Common Rulesets

| Ruleset ID         | Rules | Applicable To                | Description                          |
| ------------------ | ----- | ---------------------------- | ------------------------------------ |
| common.generate    | 14    | SRS, SDS, STS, CAS, CIS, CSS | Common rules for document generation |
| common.update      | 8     | SRS, SDS, CAS, CIS, CSS      | Common rules for document updates    |
| common.validate    | 2     | SRS, SDS, STS, CAS, CIS, CSS | Common rules for document validation |

## Document-Specific Rulesets

### By Intent

#### Generate Intent

| Ruleset ID   | Doc Type | Rules | Description                                    |
| ------------ | -------- | ----- | ---------------------------------------------- |
| srs.generate | SRS      | 3     | SRS-specific rules for generation              |
| sds.generate | SDS      | 8     | SDS-specific rules for design generation       |
| sts.generate | STS      | 1     | STS-specific rules for test spec generation    |
| cas.generate | CAS      | 3     | CAS-specific rules for architecture generation |
| cis.generate | CIS      | 2     | CIS-specific rules for conceptual generation   |
| css.generate | CSS      | 2     | CSS-specific rules for structure generation    |

#### Update Intent

| Ruleset ID | Doc Type | Rules | Description                                 |
| ---------- | -------- | ----- | ------------------------------------------- |
| srs.update | SRS      | 2     | SRS-specific rules for updates              |
| sds.update | SDS      | 4     | SDS-specific rules for design updates       |
| cas.update | CAS      | 2     | CAS-specific rules for architecture updates |
| cis.update | CIS      | 1     | CIS-specific rules for conceptual updates   |
| css.update | CSS      | 1     | CSS-specific rules for structure updates    |

---

## Ruleset Details

### common.generate (Common)

**Applicable to:** All document types (SRS, SDS, STS, CAS, CIS, CSS)

**Rules (14):**
- DOCS-AR-C-01: Content generation only within declared placeholders
- DOCS-AR-C-02: No cross-section content generation
- DOCS-AR-C-03: No default appendix generation
- DOCS-AR-C-04: Structurally valid document artifact
- DOCS-BD-C-02: Policy violation results in execution termination
- DOCS-BD-P-01: Explicitly scoped generation
- DOCS-BD-P-02: Human accountability and oversight
- DOCS-CN-C-01: No implicit inference
- DOCS-ST-C-19: User-driven generation only
- DOCS-ST-C-20: Declarative generation only
- DOCS-ST-C-21: Preserve section hierarchy and required fields
- DOCS-ST-P-01: Informative introduction sections
- DOCS-ST-P-02: Informative change history
- DOCS-TR-P-01: Use recognized semantic sources

---

### common.update (Common)

**Applicable to:** Most document types (SRS, SDS, CAS, CIS, CSS)

**Rules (8):**
- DOCS-AR-C-01: Content generation only within declared placeholders
- DOCS-AR-C-02: No cross-section content generation
- DOCS-AR-C-03: No default appendix generation
- DOCS-BD-C-02: Policy violation results in execution termination
- DOCS-BD-P-01: Explicitly scoped generation
- DOCS-CN-C-01: No implicit inference
- DOCS-ST-P-01: Informative introduction sections
- DOCS-ST-P-02: Informative change history

**Note:** STS (test specifications) do not have update-specific rules beyond common rules.

---

### common.validate (Common)

**Applicable to:** All document types (SRS, SDS, STS, CAS, CIS, CSS)

**Rules (2):**
- DOCS-BD-C-01: Document immutability after approval
- DOCS-BD-C-02: Policy violation results in execution termination

---

### srs.generate (SRS-specific)

**Applicable to:** SRS (Software Requirements Specification)

**Rules (3):**
- DOCS-ST-C-01: Overall description describes system context
- DOCS-ST-C-02: Non-functional requirements explicit and measurable
- DOCS-ST-C-03: External interfaces explicitly declared

---

### sds.generate (SDS-specific)

**Applicable to:** SDS (Software Design Specification)

**Rules (8):**
- DOCS-ST-C-04: Design components declare responsibilities and interactions
- DOCS-ST-C-05: Interfaces and adapters explicit
- DOCS-ST-C-06: Interaction and data flow explicit
- DOCS-ST-C-07: Error handling strategy explicit
- DOCS-ST-C-08: Deployment and operational design explicit
- DOCS-ST-C-09: Design overview traceable to requirements
- DOCS-ST-C-10: Cross-cutting concerns traceable to NFR
- DOCS-ST-C-11: Human accountability for design decisions

---

### sts.generate (STS-specific)

**Applicable to:** STS (System Test Specification)

**Rules (1):**
- DOCS-TI-P-01: Test specifications follow item policy

---

### cas.generate (CAS-specific)

**Applicable to:** CAS (Coding Architecture Specification)

**Rules (3):**
- DOCS-ST-C-12: Architectural context describes scope and boundaries
- DOCS-ST-C-13: Module structure defines explicit boundaries
- DOCS-ST-C-14: Architectural constraints explicitly declared

---

### cis.generate (CIS-specific)

**Applicable to:** CIS (Conceptual Implementation Specification)

**Rules (2):**
- DOCS-ST-C-15: Conceptual model describes approach and patterns
- DOCS-ST-C-16: Decision structure defines conditions and outcomes

---

### css.generate (CSS-specific)

**Applicable to:** CSS (Coding Structure Specification)

**Rules (2):**
- DOCS-ST-C-17: Structure overview describes context and hierarchy
- DOCS-ST-C-18: Structural elements define explicit responsibilities

---

### srs.update (SRS-specific)

**Applicable to:** SRS (Software Requirements Specification)

**Rules (2):**
- DOCS-ST-C-02: Non-functional requirements explicit and measurable
- DOCS-ST-C-03: External interfaces explicitly declared

---

### sds.update (SDS-specific)

**Applicable to:** SDS (Software Design Specification)

**Rules (4):**
- DOCS-ST-C-05: Interfaces and adapters explicit
- DOCS-ST-C-06: Interaction and data flow explicit
- DOCS-ST-C-07: Error handling strategy explicit
- DOCS-ST-C-11: Human accountability for design decisions

---

### cas.update (CAS-specific)

**Applicable to:** CAS (Coding Architecture Specification)

**Rules (2):**
- DOCS-ST-C-13: Module structure defines explicit boundaries
- DOCS-ST-C-14: Architectural constraints explicitly declared

---

### cis.update (CIS-specific)

**Applicable to:** CIS (Conceptual Implementation Specification)

**Rules (1):**
- DOCS-ST-C-16: Decision structure defines conditions and outcomes

---

### css.update (CSS-specific)

**Applicable to:** CSS (Coding Structure Specification)

**Rules (1):**
- DOCS-ST-C-18: Structural elements define explicit responsibilities

---

## Usage Examples

### Generate a new SRS document

```yaml
includes:
  - ruleset_id: common.generate
    version: ">=1.0.0"
  - ruleset_id: srs.generate
    version: ">=1.0.0"
```

### Update an existing SDS document

```yaml
includes:
  - ruleset_id: common.update
    version: ">=1.0.0"
  - ruleset_id: sds.update
    version: ">=1.0.0"
```

### Validate a CAS document

```yaml
includes:
  - ruleset_id: common.validate
    version: ">=1.0.0"
```

## Design Principles

1. **Intent-Based Organization**: Rulesets are organized by operation intent (generate, update, validate)
2. **Scenario-Agnostic Rules**: Individual rules are document-type and intent independent
3. **Ruleset Composition**: Rulesets select and compose rules based on intent and document type
4. **Separation of Concerns**:
   - Common rules apply across all document types
   - Document-specific rules address unique structural requirements
   - Intent-specific rulesets capture operation semantics

## Rule Distribution Summary

| Document Type | Generate | Update | Validate | Total |
|---------------|----------|--------|----------|-------|
| **Common**    | 14       | 8      | 2        | 14    |
| **SRS**       | 3        | 2      | -        | 3     |
| **SDS**       | 8        | 4      | -        | 8     |
| **STS**       | 1        | -      | -        | 1     |
| **CAS**       | 3        | 2      | -        | 3     |
| **CIS**       | 2        | 1      | -        | 2     |
| **CSS**       | 2        | 1      | -        | 2     |
| **Total**     | **31**   | **16** | **2**    | **34**|

**Note:** Common rules are counted once in the total. Document-specific totals show only unique rules per type.
