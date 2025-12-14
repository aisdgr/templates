---
document: SCS
id: SCS-PYTHON
version: 1.0.0
layer: Language
language: Python
status: Active
owner: AIDDM / Community
applies_with:
  - SCS_STD.md
---

# Software Coding Standard — Python

## Role & Positioning (Normative)

This document defines **Python-specific coding constraints and conventions**
within the AIDDM Software Coding Standard (SCS) model.

This document represents **Layer 2 (Language Foundation)** and MUST be applied
together with `SCS_STD.md`.

In case of conflict with organizational or customer-specific coding rules,
**language constraints take precedence** unless a safe, equivalent alternative
exists.

---

## Language References

The Python coding standard aligns with the following publicly available
and widely adopted references:

- **PEP 8** — Style Guide for Python Code
- **PEP 257** — Docstring Conventions

These references define the baseline for Python syntax, naming,
formatting, and documentation practices.

This document **does not restate** the referenced standards.

---

## Python-Specific Rules

### SCS-PY-001 — Readability over cleverness

**description**  
Python code MUST prioritize readability and explicitness over compact or
clever expressions.

**rationale**  
Readable code improves long-term maintainability and reduces ambiguity for
both human reviewers and AI-assisted tooling.

---

### SCS-PY-002 — Explicit error handling

**description**  
Exceptions MUST be handled explicitly. Broad or silent exception handling
(e.g., bare `except`) SHOULD be avoided.

**rationale**  
Explicit error handling improves diagnosability and prevents unintended
control flow masking.

---

### SCS-PY-003 — Clear function and variable naming

**description**  
Function and variable names SHOULD be descriptive and follow standard
Python naming conventions.

**rationale**  
Clear naming is essential for readability, testability, and AI code
generation stability.

---

### SCS-PY-004 — Docstrings for public interfaces

**description**  
Public functions, classes, and modules SHOULD include docstrings that
describe intent, inputs, and outputs.

**rationale**  
Docstrings serve as both human documentation and machine-readable intent
for tooling and AI systems.

---

### SCS-PY-005 — Deterministic behavior

**description**  
Python code SHOULD avoid hidden state, non-deterministic behavior, or
side effects that are not clearly expressed.

**rationale**  
Deterministic code is easier to test, reason about, and safely generate
using AI-assisted workflows.

---

## Compatibility & Extension

- This document MAY be extended by community-contributed Python standards.
- Additional rules MUST NOT conflict with `SCS_STD.md`.
- Organization-specific preferences MUST be defined in a separate
  Layer 3 document (e.g., `SCS_Org.md`).

---

## Notes

This document intentionally provides a **minimal but sufficient**
Python language standard to demonstrate SCS composability and layering.
