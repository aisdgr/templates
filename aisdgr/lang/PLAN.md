# 規則轉換計劃：從 AIGM g-gcg / g-gcs 到 AISDGR lang / gov

---

## 一、轉換範圍

### 1.1 來源文件

| 來源路徑                         | 文件 ID        | 層級       | 內容性質                |
| -------------------------------- | -------------- | ---------- | ----------------------- |
| `aigm/g-gcs/gcs.core.yaml`       | CCS-CORE       | core       | 語言無關的基礎編碼標準  |
| `aigm/g-gcs/gcs.java.yaml`       | CCS-JAVA       | language   | Java 專屬編碼標準       |
| `aigm/g-gcs/gcs.go.yaml`         | CCS-GO         | language   | Go 專屬編碼標準         |
| `aigm/g-gcs/gcs.python.yaml`     | CCS-PYTHON     | language   | Python 專屬編碼標準     |
| `aigm/g-gcs/gcs.typescript.yaml` | CCS-TYPESCRIPT | language   | TypeScript 專屬編碼標準 |
| `aigm/g-gcs/gcs.javascript.yaml` | CCS-JAVASCRIPT | language   | JavaScript 專屬編碼標準 |
| `aigm/g-gcs/gcs.rust.yaml`       | CCS-RUST       | language   | Rust 專屬編碼標準       |
| `aigm/g-gcg/gcg.yaml`            | CGG-CORE       | governance | 編碼治理模型            |

### 1.2 目標 Rule Domains

| Rule Domain | 資料夾         | 用途                 |
| ----------- | -------------- | -------------------- |
| **LANG**    | `aisdgr/lang/` | 程式語言編碼標準規則 |
| **GOV**     | `aisdgr/gov/`  | 編碼治理模型規則     |

---

## 二、轉換原則

### 2.1 核心原則（繼承自 code/PLAN.md）

- **去情境化**：移除文件引用、執行意圖等上下文資訊
- **規則獨立化**：一個 YAML 檔案 = 一條規則
- **結構規範化**：遵循 `rule.schema.yaml` 結構
- **關鍵分離**：constraint（規範核心）/ boundary（範圍）/ governance（描述性元數據）

### 2.2 ID 命名規則

#### LANG Domain

```
LANG-<XXXX>-<TYPE>-<NN>
```

| 欄位   | 說明                            | 範例                                        |
| ------ | ------------------------------- | ------------------------------------------- |
| `XXXX` | 語言縮寫 / `STD`（通用）        | `JAVA`, `GO`, `PY`, `TS`, `JS`, `RS`, `STD` |
| `TYPE` | `P` = Policy / `C` = Constraint | `P`, `C`                                    |
| `NN`   | 序號（兩位數）                  | `01`, `02`                                  |

**Type 判定依據：**

| 原始 severity           | → Type             | 語義                        |
| ----------------------- | ------------------ | --------------------------- |
| `MUST` / `MUST NOT`     | **C** (Constraint) | 硬性約束，違反 = 治理觸發   |
| `SHOULD` / `SHOULD NOT` | **P** (Policy)     | 原則建議，違反 = 需說明理由 |

> **混合規則**：若 description 同時包含 MUST 和 SHOULD 語句，
> 以最嚴格的 severity 為準（MUST → Constraint）。

#### GOV Domain

```
GOV-<CATEGORY>-<TYPE>-<NN>
```

| 欄位       | 說明      | 範例                                       |
| ---------- | --------- | ------------------------------------------ |
| `CATEGORY` | 治理分類  | `PR`（原則）, `ENF`（執行）, `ACC`（問責） |
| `TYPE`     | `P` / `C` | 同上                                       |
| `NN`       | 序號      | `01`, `02`                                 |

### 2.3 結構映射

```
原始格式 (gcs/gcg)           →  目標格式 (rule.schema.yaml)
─────────────────────────────────────────────────────────
standards[].id               →  rule.id (重新命名)
standards[].title            →  檔案標題註解
standards[].severity         →  rule.id 中的 P/C 分類
standards[].description      →  rule.constraint
standards[].applies_to       →  rule.boundary (重組)
standards[].roles            →  rule.governance.responsibilities
standards[].intent           →  rule.governance.intent.rationale
(無)                         →  rule.execution_view (新增)
(無)                         →  rule.boundary.rule_domain: LANG
meta.governance.mutability   →  rule.governance (描述性)
```

### 2.4 execution_view 分配策略

| 語言        | execution_view          |
| ----------- | ----------------------- |
| STD（通用） | `code_quality_engineer` |
| JAVA        | `java_engineer`         |
| GO          | `go_engineer`           |
| PYTHON      | `python_engineer`       |
| TYPESCRIPT  | `typescript_engineer`   |
| JAVASCRIPT  | `javascript_engineer`   |
| RUST        | `rust_engineer`         |
| GOV         | `governance_engineer`   |

---

## 三、LANG 規則轉換清單

### 3.1 gcs.core.yaml → LANG-STD（7 條）

| #   | 原始 ID     | severity | → Rule ID       | Type       | Title                                    |
| --- | ----------- | -------- | --------------- | ---------- | ---------------------------------------- |
| 1   | CCS-STD-001 | MUST     | `LANG-STD-C-01` | Constraint | Deterministic and reproducible behavior  |
| 2   | CCS-STD-002 | MUST     | `LANG-STD-C-02` | Constraint | Explicit control flow and state          |
| 3   | CCS-STD-003 | MUST     | `LANG-STD-C-03` | Constraint | No hidden external dependencies          |
| 4   | CCS-STD-004 | MUST     | `LANG-STD-C-04` | Constraint | Safe handling of sensitive data          |
| 5   | CCS-STD-005 | SHOULD   | `LANG-STD-P-01` | Policy     | Intent-revealing structure               |
| 6   | CCS-STD-006 | SHOULD   | `LANG-STD-P-02` | Policy     | Boundary validation and error visibility |
| 7   | CCS-STD-007 | MUST     | `LANG-STD-C-05` | Constraint | AI behavior limitation                   |

---

### 3.2 gcs.java.yaml → LANG-JAVA（6 條）

| #   | 原始 ID      | severity | → Rule ID        | Type       | Title                                     |
| --- | ------------ | -------- | ---------------- | ---------- | ----------------------------------------- |
| 1   | CCS-JAVA-001 | MUST     | `LANG-JAVA-C-01` | Constraint | Explicit type usage                       |
| 2   | CCS-JAVA-002 | SHOULD   | `LANG-JAVA-P-01` | Policy     | Controlled use of inheritance             |
| 3   | CCS-JAVA-003 | MUST     | `LANG-JAVA-C-02` | Constraint | Explicit null handling                    |
| 4   | CCS-JAVA-004 | SHOULD   | `LANG-JAVA-P-02` | Policy     | Checked exception discipline              |
| 5   | CCS-JAVA-005 | SHOULD   | `LANG-JAVA-P-03` | Policy     | Immutable data preference                 |
| 6   | CCS-JAVA-006 | SHOULD   | `LANG-JAVA-P-04` | Policy     | Intent-revealing naming and documentation |

---

### 3.3 gcs.go.yaml → LANG-GO（7 條）

| #   | 原始 ID    | severity | → Rule ID      | Type       | Title                                     |
| --- | ---------- | -------- | -------------- | ---------- | ----------------------------------------- |
| 1   | CCS-GO-001 | MUST     | `LANG-GO-C-01` | Constraint | Explicit error handling                   |
| 2   | CCS-GO-002 | MUST     | `LANG-GO-C-02` | Constraint | Simple and explicit control flow          |
| 3   | CCS-GO-003 | MUST     | `LANG-GO-C-03` | Constraint | Explicit concurrency ownership            |
| 4   | CCS-GO-004 | SHOULD   | `LANG-GO-P-01` | Policy     | Prefer composition over inheritance       |
| 5   | CCS-GO-005 | SHOULD   | `LANG-GO-P-02` | Policy     | Minimal and explicit interfaces           |
| 6   | CCS-GO-006 | MUST     | `LANG-GO-C-04` | Constraint | Deterministic behavior and side effects   |
| 7   | CCS-GO-007 | SHOULD   | `LANG-GO-P-03` | Policy     | Intent-revealing naming and documentation |

---

### 3.4 gcs.python.yaml → LANG-PY（6 條）

| #   | 原始 ID    | severity | → Rule ID      | Type       | Title                                    |
| --- | ---------- | -------- | -------------- | ---------- | ---------------------------------------- |
| 1   | CCS-PY-001 | MUST     | `LANG-PY-C-01` | Constraint | Explicitness over cleverness             |
| 2   | CCS-PY-002 | MUST     | `LANG-PY-C-02` | Constraint | Explicit exception handling              |
| 3   | CCS-PY-003 | SHOULD   | `LANG-PY-P-01` | Policy     | Typed data structures                    |
| 4   | CCS-PY-004 | SHOULD   | `LANG-PY-P-02` | Policy     | Boundary input validation                |
| 5   | CCS-PY-005 | MUST     | `LANG-PY-C-03` | Constraint | Deterministic core logic                 |
| 6   | CCS-PY-006 | SHOULD   | `LANG-PY-P-03` | Policy     | Intent-revealing comments and docstrings |

---

### 3.5 gcs.typescript.yaml → LANG-TS（7 條）

| #   | 原始 ID    | severity | → Rule ID      | Type       | Title                                            |
| --- | ---------- | -------- | -------------- | ---------- | ------------------------------------------------ |
| 1   | CCS-TS-001 | MUST     | `LANG-TS-C-01` | Constraint | Strict type checking enabled                     |
| 2   | CCS-TS-002 | MUST     | `LANG-TS-C-02` | Constraint | Explicit type annotations for public APIs        |
| 3   | CCS-TS-003 | SHOULD   | `LANG-TS-P-01` | Policy     | Prefer interfaces and type aliases appropriately |
| 4   | CCS-TS-004 | MUST     | `LANG-TS-C-03` | Constraint | No unsafe type assertions                        |
| 5   | CCS-TS-005 | MUST     | `LANG-TS-C-04` | Constraint | Explicit null and undefined handling             |
| 6   | CCS-TS-006 | SHOULD   | `LANG-TS-P-02` | Policy     | Type-safe async interfaces                       |
| 7   | CCS-TS-007 | SHOULD   | `LANG-TS-P-03` | Policy     | Intent-revealing naming and documentation        |

---

### 3.6 gcs.javascript.yaml → LANG-JS（7 條）

| #   | 原始 ID    | severity | → Rule ID      | Type       | Title                                     |
| --- | ---------- | -------- | -------------- | ---------- | ----------------------------------------- |
| 1   | CCS-JS-001 | MUST     | `LANG-JS-C-01` | Constraint | Explicit variable declaration             |
| 2   | CCS-JS-002 | MUST     | `LANG-JS-C-02` | Constraint | Strict equality usage                     |
| 3   | CCS-JS-003 | MUST     | `LANG-JS-C-03` | Constraint | Explicit async control flow               |
| 4   | CCS-JS-004 | MUST     | `LANG-JS-C-04` | Constraint | Explicit error handling                   |
| 5   | CCS-JS-005 | SHOULD   | `LANG-JS-P-01` | Policy     | Immutable data preference                 |
| 6   | CCS-JS-006 | MUST     | `LANG-JS-C-05` | Constraint | No implicit globals or dynamic execution  |
| 7   | CCS-JS-007 | SHOULD   | `LANG-JS-P-02` | Policy     | Intent-revealing naming and documentation |

---

### 3.7 gcs.rust.yaml → LANG-RS（7 條）

| #   | 原始 ID    | severity | → Rule ID      | Type       | Title                                          |
| --- | ---------- | -------- | -------------- | ---------- | ---------------------------------------------- |
| 1   | CCS-RS-001 | MUST     | `LANG-RS-C-01` | Constraint | Ownership and borrowing correctness            |
| 2   | CCS-RS-002 | MUST     | `LANG-RS-C-02` | Constraint | No unsafe code by default                      |
| 3   | CCS-RS-003 | MUST     | `LANG-RS-C-03` | Constraint | Explicit error handling with Result and Option |
| 4   | CCS-RS-004 | MUST     | `LANG-RS-C-04` | Constraint | Deterministic and explicit concurrency         |
| 5   | CCS-RS-005 | SHOULD   | `LANG-RS-P-01` | Policy     | Prefer immutability by default                 |
| 6   | CCS-RS-006 | SHOULD   | `LANG-RS-P-02` | Policy     | Explicit lifetime and API contracts            |
| 7   | CCS-RS-007 | SHOULD   | `LANG-RS-P-03` | Policy     | Intent-revealing naming and documentation      |

---

## 四、GOV 規則轉換清單

### 4.1 gcg.yaml → GOV 規則映射

#### 4.1.1 Principles（CGG-PR）→ GOV-PR

| #   | 原始 ID    | → Rule ID     | Type       | Title                                   | Constraint 摘要                                                                                                       |
| --- | ---------- | ------------- | ---------- | --------------------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| 1   | CGG-PR-001 | `GOV-PR-C-01` | Constraint | AI as constrained executor              | AI MUST comply with all applicable coding standards and MUST NOT reinterpret or weaken them.                          |
| 2   | CGG-PR-002 | `GOV-PR-P-01` | Policy     | Separation of validity and correctness  | AI is responsible for structural and rule validity. Humans are responsible for semantic and business correctness.     |
| 3   | CGG-PR-003 | `GOV-PR-C-02` | Constraint | Explicit governance over implicit trust | All AI behavior MUST be explicitly governed. No AI action is permitted based on assumed intent or inferred authority. |
| 4   | CGG-PR-004 | `GOV-PR-C-03` | Constraint | Visibility over silent correction       | Violations MUST be surfaced explicitly. Silent mutation or auto-correction is prohibited.                             |

#### 4.1.2 Enforcement Rules（CGG-ENF）→ GOV-ENF

| #   | 原始 ID     | → Rule ID      | Type       | Title                          | Constraint 摘要                                                                                            |
| --- | ----------- | -------------- | ---------- | ------------------------------ | ---------------------------------------------------------------------------------------------------------- |
| 1   | CGG-ENF-001 | `GOV-ENF-C-01` | Constraint | CCS compliance is mandatory    | All AI-generated code MUST comply with CCS_Core and applicable language-specific CCS documents.            |
| 2   | CGG-ENF-002 | `GOV-ENF-C-02` | Constraint | Violations must produce CVR    | Detected violations MUST result in a Code Validation Report. Violations MUST NOT be auto-fixed.            |
| 3   | CGG-ENF-003 | `GOV-ENF-P-01` | Policy     | Violations must remain visible | AI execution MAY continue in the presence of violations, but violations MUST remain visible and traceable. |

#### 4.1.3 不適合轉換的區塊

| 區塊                  | 原因               | 處理方式                                |
| --------------------- | ------------------ | --------------------------------------- |
| `audit`               | 元數據宣告，非約束 | 不轉換；保留為 GOV 參考文件             |
| `accountability`      | 角色定義，非約束   | 不轉換；角色資訊併入 `responsibilities` |
| `scope_definition`    | 範圍宣告，非約束   | 不轉換；範圍資訊併入 `boundary`         |
| `canonical_statement` | 文件摘要性質       | 不轉換                                  |

---

## 五、統計總覽

### 5.1 LANG Domain

| 來源                          | Constraint (C) | Policy (P) | 小計   |
| ----------------------------- | -------------- | ---------- | ------ |
| gcs.core.yaml → LANG-STD      | 5              | 2          | 7      |
| gcs.java.yaml → LANG-JAVA     | 2              | 4          | 6      |
| gcs.go.yaml → LANG-GO         | 4              | 3          | 7      |
| gcs.python.yaml → LANG-PY     | 3              | 3          | 6      |
| gcs.typescript.yaml → LANG-TS | 4              | 3          | 7      |
| gcs.javascript.yaml → LANG-JS | 5              | 2          | 7      |
| gcs.rust.yaml → LANG-RS       | 4              | 3          | 7      |
| **LANG 合計**                 | **27**         | **20**     | **47** |

### 5.2 GOV Domain

| 來源                             | Constraint (C) | Policy (P) | 小計  |
| -------------------------------- | -------------- | ---------- | ----- |
| gcg.yaml (principles) → GOV-PR   | 3              | 1          | 4     |
| gcg.yaml (enforcement) → GOV-ENF | 2              | 1          | 3     |
| **GOV 合計**                     | **5**          | **2**      | **7** |

### 5.3 總計

| Domain   | 規則數 | 檔案數 |
| -------- | ------ | ------ |
| LANG     | 47     | 47     |
| GOV      | 7      | 7      |
| **總計** | **54** | **54** |

---

## 六、目標資料夾結構

```
aisdgr/
├── code/              ← rule_domain: CODE（既有）
│   ├── rules/
│   └── ruleset/
├── docs/              ← rule_domain: DOCS（既有）
│   ├── PLAN.md
│   ├── rules/
│   └── ruleset/
├── lang/              ← rule_domain: LANG（新增）★
│   ├── PLAN.md        ← 本計劃
│   ├── rules/
│   │   ├── LANG-STD-C-01.yaml
│   │   ├── LANG-STD-C-02.yaml
│   │   ├── ...
│   │   ├── LANG-JAVA-C-01.yaml
│   │   ├── LANG-JAVA-P-01.yaml
│   │   ├── ...
│   │   ├── LANG-GO-C-01.yaml
│   │   ├── ...
│   │   ├── LANG-PY-C-01.yaml
│   │   ├── ...
│   │   ├── LANG-TS-C-01.yaml
│   │   ├── ...
│   │   ├── LANG-JS-C-01.yaml
│   │   ├── ...
│   │   └── LANG-RS-C-01.yaml
│   └── ruleset/
│       ├── LIST.md
│       ├── lang.core.yaml
│       ├── lang.java.yaml
│       ├── lang.go.yaml
│       ├── lang.python.yaml
│       ├── lang.typescript.yaml
│       ├── lang.javascript.yaml
│       └── lang.rust.yaml
├── gov/               ← rule_domain: GOV（新增）★
│   ├── PLAN.md
│   ├── rules/
│   │   ├── GOV-PR-C-01.yaml
│   │   ├── GOV-PR-C-02.yaml
│   │   ├── GOV-PR-C-03.yaml
│   │   ├── GOV-PR-P-01.yaml
│   │   ├── GOV-ENF-C-01.yaml
│   │   ├── GOV-ENF-C-02.yaml
│   │   └── GOV-ENF-P-01.yaml
│   └── ruleset/
│       ├── LIST.md
│       └── gov.core.yaml
└── schema/            ← 跨 domain 共用（既有）
```

---

## 七、轉換範例

### 7.1 LANG Rule 範例：LANG-JAVA-C-01.yaml

```yaml
# ==============================================================================
# LANG-JAVA-C-01.yaml
# Java code MUST use explicit and appropriate types.
# ==============================================================================

rule:
  id: LANG-JAVA-C-01
  execution_view: java_engineer

  constraint: >
    Java code MUST use explicit and appropriate types.
    Overuse of raw types, unchecked casts, or suppressed warnings
    MUST NOT be introduced.

  # ---------------------------------------------------------------------------
  # Boundary
  # ---------------------------------------------------------------------------
  boundary:
    domain:
      - code
    artifact:
      - source_code
    rule_category:
      - type_safety
    rule_domain:
      - LANG
    language:
      - java

  # ---------------------------------------------------------------------------
  # Governance
  # ---------------------------------------------------------------------------
  governance:
    version: 1.0.0
    status: active
    owner: asdgr

    # -------------------------------------------------------------------------
    # Intent
    # -------------------------------------------------------------------------
    intent:
      rationale:
        - preserve_compile_time_safety
        - reduce_runtime_type_errors

    # -------------------------------------------------------------------------
    # Responsibilities
    # -------------------------------------------------------------------------
    responsibilities:
      ai:
        - code_generator
        - code_reviewer
      human:
        - code_reviewer
        - final_approver

    # -------------------------------------------------------------------------
    # Applicability Context
    # -------------------------------------------------------------------------
    applicability_context:
      stage:
        - develop
      scope:
        - java_source_code
      reason:
        - raw_type_usage_detected
        - unchecked_cast_detected
        - suppressed_warning_detected

    # -------------------------------------------------------------------------
    # Governance Impact
    # -------------------------------------------------------------------------
    governance_impact:
      level: enforce
      affected_capabilities:
        - type_safety
        - compile_time_validation
```

### 7.2 GOV Rule 範例：GOV-PR-C-01.yaml

```yaml
# ==============================================================================
# GOV-PR-C-01.yaml
# AI MUST comply with all applicable coding standards.
# ==============================================================================

rule:
  id: GOV-PR-C-01
  execution_view: governance_engineer

  constraint: >
    AI MUST comply with all applicable coding standards
    and MUST NOT reinterpret or weaken them.

  # ---------------------------------------------------------------------------
  # Boundary
  # ---------------------------------------------------------------------------
  boundary:
    domain:
      - code
    artifact:
      - source_code
      - ai_generated_code
    rule_category:
      - governance_principle
    rule_domain:
      - GOV

  # ---------------------------------------------------------------------------
  # Governance
  # ---------------------------------------------------------------------------
  governance:
    version: 1.0.0
    status: active
    owner: asdgr

    # -------------------------------------------------------------------------
    # Intent
    # -------------------------------------------------------------------------
    intent:
      rationale:
        - ai_is_constrained_executor
        - prevent_standard_reinterpretation
        - prevent_standard_weakening

    # -------------------------------------------------------------------------
    # Responsibilities
    # -------------------------------------------------------------------------
    responsibilities:
      ai:
        - constrained_executor
      human:
        - standard_author
        - standard_maintainer
      system:
        - compliance_auditor

    # -------------------------------------------------------------------------
    # Applicability Context
    # -------------------------------------------------------------------------
    applicability_context:
      stage:
        - develop
      scope:
        - all_ai_generated_code
      reason:
        - coding_standard_reinterpretation_detected
        - coding_standard_weakening_detected

    # -------------------------------------------------------------------------
    # Governance Impact
    # -------------------------------------------------------------------------
    governance_impact:
      level: enforce
      affected_capabilities:
        - ai_compliance
        - coding_standard_integrity
```

### 7.3 Ruleset 範例：lang.java.yaml

```yaml
# ==============================================================================
# lang.java.yaml
#
# Ruleset Role:
#   Composes all LANG rules applicable to Java source code,
#   including LANG-STD (core) and LANG-JAVA (language-specific).
#
# Governance Semantics:
#   - LANG-STD rules apply to ALL languages including Java
#   - LANG-JAVA rules apply to Java source code ONLY
#   - GOV rules are NOT included here (composed at execution level)
# ==============================================================================

ruleset:
  id: lang.java

  includes:

    # -------------------------------------------------------------------------
    # LANG-STD: Core Standards (language-agnostic)
    # -------------------------------------------------------------------------
    - rule_id: LANG-STD-C-01
      version: ">=1.0.0"
    - rule_id: LANG-STD-C-02
      version: ">=1.0.0"
    - rule_id: LANG-STD-C-03
      version: ">=1.0.0"
    - rule_id: LANG-STD-C-04
      version: ">=1.0.0"
    - rule_id: LANG-STD-C-05
      version: ">=1.0.0"
    - rule_id: LANG-STD-P-01
      version: ">=1.0.0"
    - rule_id: LANG-STD-P-02
      version: ">=1.0.0"

    # -------------------------------------------------------------------------
    # LANG-JAVA: Java-Specific Standards
    # -------------------------------------------------------------------------
    - rule_id: LANG-JAVA-C-01
      version: ">=1.0.0"
    - rule_id: LANG-JAVA-C-02
      version: ">=1.0.0"
    - rule_id: LANG-JAVA-P-01
      version: ">=1.0.0"
    - rule_id: LANG-JAVA-P-02
      version: ">=1.0.0"
    - rule_id: LANG-JAVA-P-03
      version: ">=1.0.0"
    - rule_id: LANG-JAVA-P-04
      version: ">=1.0.0"
```

---

## 八、Ruleset 組合矩陣

### 8.1 LANG Ruleset 清單

| Ruleset ID        | 包含 LANG-STD                 | 包含語言規則                   |
| ----------------- | ----------------------------- | ------------------------------ |
| `lang.core`       | LANG-STD-C-01~C-05, P-01~P-02 | —                              |
| `lang.java`       | 全部 LANG-STD                 | LANG-JAVA-C-01~C-02, P-01~P-04 |
| `lang.go`         | 全部 LANG-STD                 | LANG-GO-C-01~C-04, P-01~P-03   |
| `lang.python`     | 全部 LANG-STD                 | LANG-PY-C-01~C-03, P-01~P-03   |
| `lang.typescript` | 全部 LANG-STD                 | LANG-TS-C-01~C-04, P-01~P-03   |
| `lang.javascript` | 全部 LANG-STD                 | LANG-JS-C-01~C-05, P-01~P-02   |
| `lang.rust`       | 全部 LANG-STD                 | LANG-RS-C-01~C-04, P-01~P-03   |

### 8.2 執行時組合（跨 Domain）

```
source_code.add.java = source_code.add + lang.java + gov.core
source_code.add.go   = source_code.add + lang.go   + gov.core
```

CODE（操作約束）+ LANG（語言標準）+ GOV（治理原則）在執行時疊加。

---

## 九、執行步驟

### Phase 1：建立資料夾結構

```
mkdir -p aisdgr/lang/rules
mkdir -p aisdgr/lang/ruleset
mkdir -p aisdgr/gov/rules
mkdir -p aisdgr/gov/ruleset
```

### Phase 2：產生 LANG Rules（47 個檔案）

1. LANG-STD-C-01 ~ C-05, P-01 ~ P-02（7 個）
2. LANG-JAVA-C-01 ~ C-02, P-01 ~ P-04（6 個）
3. LANG-GO-C-01 ~ C-04, P-01 ~ P-03（7 個）
4. LANG-PY-C-01 ~ C-03, P-01 ~ P-03（6 個）
5. LANG-TS-C-01 ~ C-04, P-01 ~ P-03（7 個）
6. LANG-JS-C-01 ~ C-05, P-01 ~ P-02（7 個）
7. LANG-RS-C-01 ~ C-04, P-01 ~ P-03（7 個）

### Phase 3：產生 GOV Rules（7 個檔案）

1. GOV-PR-C-01 ~ C-03, P-01（4 個）
2. GOV-ENF-C-01 ~ C-02, P-01（3 個）

### Phase 4：產生 Rulesets

1. `lang.core.yaml`
2. `lang.java.yaml` ~ `lang.rust.yaml`（6 個）
3. `gov.core.yaml`

### Phase 5：產生 LIST.md

1. `aisdgr/lang/ruleset/LIST.md`
2. `aisdgr/gov/ruleset/LIST.md`

### Phase 6：驗證

1. 所有 rule 檔符合 `rule.schema.yaml` 結構
2. 所有 ruleset 引用的 rule_id 存在
3. 所有原始 gcs/gcg 標準項目已被轉換（無遺漏）
