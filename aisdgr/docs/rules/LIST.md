# Rule List

## Boundary & Stop (BD)

| Type       | ID           | RNL                                                           |
| ---------- | ------------ | ------------------------------------------------------------- |
| Policy     | DOCS-BD-P-01 | Generation *MUST* be explicitly scoped to requested sections. |
| Policy     | DOCS-BD-P-02 | Human accountability and oversight *MUST* be maintained.      |
| Constraint | DOCS-BD-C-01 | Document immutability *MUST* be enforced after approval.      |
| Constraint | DOCS-BD-C-02 | Policy violation *MUST* result in execution termination.      |

---

## Isolation (AR)

| Type       | ID           | RNL                                                                                    |
| ---------- | ------------ | -------------------------------------------------------------------------------------- |
| Constraint | DOCS-AR-C-01 | AI *MUST* generate content only within declared placeholders in the document template. |
| Constraint | DOCS-AR-C-02 | AI **MUST NOT** generate content that spans multiple sections.                         |
| Constraint | DOCS-AR-C-03 | AI **MUST NOT** generate appendix content by default.                                  |
| Constraint | DOCS-AR-C-04 | AI *MUST* produce a structurally valid document artifact.                              |

---

## Traceability (TR)

| Type   | ID           | RNL                                         |
| ------ | ------------ | ------------------------------------------- |
| Policy | DOCS-TR-P-01 | Recognized semantic sources *MUST* be used. |

---

## Test Integrity (TI)

| Type   | ID           | RNL                                            |
| ------ | ------------ | ---------------------------------------------- |
| Policy | DOCS-TI-P-01 | Test specifications *MUST* follow item policy. |

---

## Structural Integrity (ST)

| Type       | ID           | RNL                                                                 |
| ---------- | ------------ | ------------------------------------------------------------------- |
| Policy     | DOCS-ST-P-01 | Introduction sections *MUST* be informative only.                   |
| Policy     | DOCS-ST-P-02 | Change history *MUST* be informative only.                          |
| Constraint | DOCS-ST-C-01 | Overall description *MUST* describe the system context.             |
| Constraint | DOCS-ST-C-02 | Non-functional requirements *MUST* be explicit and measurable.      |
| Constraint | DOCS-ST-C-03 | External interfaces *MUST* be explicitly declared.                  |
| Constraint | DOCS-ST-C-04 | Design components *MUST* declare responsibilities and interactions. |
| Constraint | DOCS-ST-C-05 | Interfaces and adapters *MUST* be explicit.                         |
| Constraint | DOCS-ST-C-06 | Interaction and data flow *MUST* be explicit.                       |
| Constraint | DOCS-ST-C-07 | Error handling strategy *MUST* be explicit.                         |
| Constraint | DOCS-ST-C-08 | Deployment and operational design *MUST* be explicit.               |
| Constraint | DOCS-ST-C-09 | Design overview *MUST* be traceable to requirements.                |
| Constraint | DOCS-ST-C-10 | Cross-cutting concerns *MUST* be traceable to NFR.                  |
| Constraint | DOCS-ST-C-11 | Human accountability for design decisions *MUST* be maintained.     |
| Constraint | DOCS-ST-C-12 | Architectural context *MUST* describe scope and boundaries.         |
| Constraint | DOCS-ST-C-13 | Module structure *MUST* define explicit boundaries.                 |
| Constraint | DOCS-ST-C-14 | Architectural constraints *MUST* be explicitly declared.            |
| Constraint | DOCS-ST-C-15 | Conceptual model *MUST* describe approach and patterns.             |
| Constraint | DOCS-ST-C-16 | Decision structure *MUST* define explicit conditions and outcomes.  |
| Constraint | DOCS-ST-C-17 | Structure overview *MUST* describe context and hierarchy.           |
| Constraint | DOCS-ST-C-18 | Structural elements *MUST* define explicit responsibilities.        |
| Constraint | DOCS-ST-C-19 | Generation *MUST* be user-driven only.                              |
| Constraint | DOCS-ST-C-20 | Generation *MUST* be declarative only.                              |
| Constraint | DOCS-ST-C-21 | Section hierarchy and required fields *MUST* be preserved.          |

---

## Inference Control (CN)

| Type       | ID           | RNL                                                                             |
| ---------- | ------------ | ------------------------------------------------------------------------------- |
| Constraint | DOCS-CN-C-01 | AI **MUST NOT** infer or generate implicit requirements, decisions, or content. |
