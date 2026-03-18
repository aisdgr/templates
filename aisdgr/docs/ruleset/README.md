# DOCS Rulesets

This directory contains **DOCS rulesets**, which compose
scenario-specific generation constraints from atomic DOCS rules.

Rulesets do not define new behavior.
They only **select and activate existing rule categories**
based on document type and execution intent.

---

## 1. Rules vs Rulesets

- **Rules** define *what is allowed or forbidden* at the document-content level.
- **Rulesets** define *when and where* those rules apply.

Rulesets:
- do NOT introduce normative language (MUST / MUST NOT)
- do NOT encode intent semantics
- do NOT reference source code or governance authority

---

## 2. Document Type vs Execution Intent

| Type              | Description                       | Example         |
| ----------------- | --------------------------------- | --------------- |
| Document Mutation | Creates or modifies document      | srs.generate    |
| Document Mutation | Updates existing document content | sds.update      |
| Validation Action | Validates without content change  | common.validate |

This separation prevents conflation between content generation and structural verification.

---

## 3. Ruleset Naming Convention

Rulesets follow the pattern:

```
<document_type_or_common>.<intent>
```

Examples:
- `common.generate`
- `srs.generate`
- `sds.update`
- `common.validate`

---

## 4. Available Rulesets

### Common Rulesets

| Ruleset         | Purpose                                        |
| --------------- | ---------------------------------------------- |
| common.generate | Common constraints for all document generation |
| common.update   | Common constraints for all document updates    |
| common.validate | Common constraints for all document validation |

---

### Document-Specific: Generate

| Ruleset      | Document Type | Purpose                                         |
| ------------ | ------------- | ----------------------------------------------- |
| srs.generate | SRS           | SRS-specific structural rules for generation    |
| sds.generate | SDS           | SDS-specific structural rules for generation    |
| sts.generate | STS           | STS-specific test specification rules           |
| cas.generate | CAS           | CAS-specific architectural rules for generation |
| cis.generate | CIS           | CIS-specific conceptual rules for generation    |
| css.generate | CSS           | CSS-specific structural rules for generation    |

---

### Document-Specific: Update

| Ruleset    | Document Type | Purpose                                      |
| ---------- | ------------- | -------------------------------------------- |
| srs.update | SRS           | SRS-specific structural rules for updates    |
| sds.update | SDS           | SDS-specific structural rules for updates    |
| cas.update | CAS           | CAS-specific architectural rules for updates |
| cis.update | CIS           | CIS-specific conceptual rules for updates    |
| css.update | CSS           | CSS-specific structural rules for updates    |

---

## 5. Rule Category Inclusion Model

Rulesets select rules by **rule ID**, not by category.

Common categories included across rulesets:

- **BD** — Boundary & Stop
- **AR** — Artifact Isolation
- **CN** — Inference Control
- **ST** — Structural Integrity
- **TR** — Traceability
- **TI** — Test Integrity

This model allows new rules to be added without changing existing rulesets.

---

## 6. Ruleset Composition Examples

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

### Validate any document

```yaml
includes:
  - ruleset_id: common.validate
    version: ">=1.0.0"
```

---

## 7. Design Rationale

- DOCS rules define the **minimum enforceable contract**
- Rulesets define **execution context only**
- Governance authority, approvals, and organizational roles are handled externally

---

## 8. Summary

If a behavior cannot be governed through rule composition,
it does not belong in DOCS.
