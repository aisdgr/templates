---
document: SCS
id: <SCS-ID>                     # REQUIRED. Globally unique
version: 1.0.0
stage: Draft                     # Draft / Review / Approved / Released
status: In-Progress
owner: <Tech Lead / Team>
created: YYYY-MM-DD
updated: YYYY-MM-DD
visibility: Public | Internal    # Public = safe to share, Internal = restricted
related:
  - SRS-...
  - SAS-...
  - SDS-...
  - STS-...
---

# Software Coding Standard (SCS)

## Documentation Sensitivity Notice (Normative)

This document is part of the AIDDM documentation chain and
**inherits the normative assumptions defined in SRS, SAS, SDS, and STS**.

The Software Coding Standard (SCS) defines **constraints and conventions
that govern how source code is written**, including structure, style,
and safety-related rules.

When used with AI-assisted tooling, this document **directly constrains
code generation behavior** and therefore functions as an execution guardrail.

Accordingly:

- This document MUST be treated as an engineering control artifact.
- Public SCS documents MUST be limited to non-proprietary, widely accepted
  coding rules.
- Internal SCS documents MAY contain organization-specific constraints
  and MUST be protected accordingly.

---

## Human Readership & Usage (Normative)

The Software Coding Standard (SCS) is intended for:

- Engineers writing or reviewing source code
- AI-assisted code generation tools and agents
- QA and security roles validating code quality and safety
- Organizations defining minimum acceptable coding practices

The SCS is designed to be **read independently**, without requiring
detailed review of SRS, SAS, SDS, or STS.

Its primary purpose is to define **how code should look and behave**,
not what the system does.

---

## 0. Change History

| Version | Date       | Author | Description     |
| ------- | ---------- | ------ | --------------- |
| 1.0.0   | YYYY-MM-DD | <Name> | Initial release |

---

## 1. Purpose & Scope

### 1.1 Purpose
This document defines **minimum coding standards and constraints**
to ensure consistency, safety, maintainability, and AI-controllable
code generation.

### 1.2 Scope
In scope:
- Code structure and organization rules
- Naming, formatting, and readability conventions
- Safety, error handling, and defensive coding expectations

Out of scope:
- Functional requirements
- Architectural or design decisions
- Detailed implementation logic

---

## 2. Standard Layers

The SCS MAY be defined in multiple layers.

### 2.1 Public Layer

- Industry-standard, non-proprietary rules
- Safe to share publicly
- Examples:
  - Language style guides
  - General security hygiene
  - Readability and maintainability rules

### 2.2 Internal Layer

- Organization- or project-specific constraints
- MAY reference internal architecture or practices
- MUST be access-controlled

---

## 3. Coding Rules

### <Rule Category>

#### ID: SCS-RULE-XXX

##### description
Defines a coding rule or constraint in clear, enforceable terms.

##### rationale
Explains why this rule exists, focusing on safety, maintainability,
or AI code generation stability.

##### applies_to
- Language: <e.g., Java / Python / TypeScript>
- Scope: <e.g., All / Backend / Frontend>

##### enforcement
Defines how this rule is enforced:
- Manual review
- Static analysis
- AI-assisted checking

##### severity
Severity indicates enforcement strength and audit impact.
Violations of MUST-level rules MUST be reported as failures in CAR.
- MUST
- SHOULD
- MAY


##### trace
- SDS-XXX
- STS-XXX
- CAR-FIND-XXX (optional, post-audit)

---

## 4. AI Code Generation Constraints

#### ID: SCS-AI-001

##### description
Defines constraints that AI-assisted code generation MUST follow.
All SCS rules MUST define a unique and stable Rule ID.
Rules without Rule IDs are considered non-auditable and MUST NOT be used
as input for Code Audit Report (CAR).


Examples:
- Prohibited language features
- Mandatory error handling patterns
- Required logging or tracing hooks

##### enforcement
- AI prompt constraint
- Pre-generation validation
- Post-generation static check

---

## 5. Testing & Verification Expectations

#### ID: SCS-TEST-001

##### description
Defines minimum expectations for test code structure and quality,
without prescribing specific frameworks.

Examples:
- Tests MUST be deterministic
- Tests MUST be readable and self-describing
- Tests SHOULD map clearly to STS items

##### trace
- STS-XXX

---

## 6. Traceability Policy

- SCS rules **MUST NOT introduce new functional requirements**
- SCS rules **MAY trace to SDS or STS for justification**
- Public SCS documents **MUST NOT expose proprietary design logic**
- Trace completeness **MUST** be machine-checkable
- Every SCS Rule **MUST be traceable from at least one Code Audit Report (CAR)**
finding when evaluated by adk audit tooling.


---

## 7. Heading & Meta-Model Rules (Normative)

### 7.1 Heading Hierarchy

| Markdown | Meaning        |
| -------- | -------------- |
| `#`      | Document Title |
| `##`     | Section        |
| `###`    | Rule Category  |
| `####`   | Rule ID        |
| `#####`  | Rule Field     |

---

## 8. Notes

This template intentionally defines the **minimum structure required**
to constrain AI-generated code, support consistent human coding practices,
and enable automated checking without over-specifying implementation detail.
