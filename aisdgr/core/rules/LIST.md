# CORE Domain Rules List

本文檔列出 CORE Domain 的所有規則。

---

## AR - Artifact Isolation (製品隔離)

### Constraints (MUST NOT)

| Rule ID       | Description                              |
|---------------|------------------------------------------|
| CORE-AR-C-001 | Must not create undeclared artifact types |
| CORE-AR-C-002 | Must not modify undeclared artifact types |

### Policies (MUST)

| Rule ID       | Description                                          |
|---------------|------------------------------------------------------|
| CORE-AR-P-001 | Permission to create new artifacts must be explicitly defined |
| CORE-AR-P-002 | All generated artifacts must be addressable and locatable |

---

## BD - Boundary & Stop (邊界與停止)

### Constraints (MUST NOT)

| Rule ID       | Description                                              |
|---------------|----------------------------------------------------------|
| CORE-BD-C-001 | Code must not modify artifacts beyond declared boundaries |
| CORE-BD-C-002 | Code must not access modules or resources beyond boundaries |
| CORE-BD-C-003 | Code must not introduce undeclared external dependencies |

### Policies (MUST)

| Rule ID       | Description                                                        |
|---------------|--------------------------------------------------------------------|
| CORE-BD-P-001 | Code execution must stop after declared boundaries                 |
| CORE-BD-P-002 | Code execution must stop when boundary conflicts are detected      |
| CORE-BD-P-003 | Code execution must stop when boundaries contain no executable targets |

---

## CN - Constraint Neutrality (約束中立性)

### Constraints (MUST NOT)

| Rule ID       | Description                                      |
|---------------|--------------------------------------------------|
| CORE-CN-C-001 | Must never infer undeclared boundaries           |
| CORE-CN-C-002 | Must never infer undeclared requirements         |
| CORE-CN-C-003 | Must never infer undeclared verification targets |

---

## TR - Traceability (可追溯性)

### Constraints (MUST NOT)

| Rule ID       | Description                                             |
|---------------|---------------------------------------------------------|
| CORE-TR-C-001 | Must never delete existing traceability IDs             |
| CORE-TR-C-002 | Must never generate orphaned artifacts without traceability IDs |

### Policies (MUST)

| Rule ID       | Description                                                        |
|---------------|--------------------------------------------------------------------|
| CORE-TR-P-001 | Generated artifacts must include traceability IDs                   |
| CORE-TR-P-002 | Traceability IDs must be embedded in source artifacts themselves    |
| CORE-TR-P-003 | Single code changes must contain only one traceability ID           |

---

## 規則統計

| Category | Constraints | Policies | 總計 |
|----------|-------------|----------|------|
| AR       | 2           | 2        | 4    |
| BD       | 3           | 3        | 6    |
| CN       | 3           | 0        | 3    |
| TR       | 2           | 3        | 5    |
| **總計** | **10**      | **8**    | **18** |

---

**最後更新**: 2026-03-19
