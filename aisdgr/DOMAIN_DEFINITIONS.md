# Domain Definitions

本文檔定義 AISDGR 框架中的所有 Domain 及其職責範圍。

---

## 概述

AISDGR 採用二維矩陣結構：
- **Domain 維度**: 治理領域（應用範疇）
- **Category 維度**: 行為限制類型（如何限制）

```
                Behavior Constraint Categories
                ├─ AR (Artifact Isolation)
                ├─ BD (Boundary & Stop)
                ├─ CN (Constraint Neutrality)
                ├─ LG (Logging & Report)
                ├─ ST (Structural Change)
                ├─ TI (Test Integrity)
                └─ TR (Traceability)

    ┌──────────┼──────────────────────────────────────────┐
    │          │                                          │
CORE│    ✓     │  通用規則（跨域共用）                    │
    │          │                                          │
CODE│    ✓     │  程式碼特定規則                          │
    │          │                                          │
DOCS│    ✓     │  文檔特定規則                            │
    │          │                                          │
LANG│    ✓     │  語言特定規則                            │
    │          │                                          │
GOV │    特殊  │  治理規則（ENF、PR）                     │
    │          │                                          │
    └──────────┴──────────────────────────────────────────┘
```

---

## Domain 定義

### CORE Domain (通用規則)

**全稱**: Core Rules

**定義**:
跨領域共用的通用行為限制規則，可被多個應用場景重用。

**特性**:
- 語義通用性：不依賴特定產出物類型（程式碼、文檔等）
- 可重用性：透過 Application Ruleset 組合到不同場景
- 基礎性：為其他 Domain 提供基礎約束框架

**適用範圍**:
- Artifact Isolation (製品隔離)
- Boundary & Stop (邊界與停止)
- Constraint Neutrality (約束中立性)
- Logging & Report (日誌與報告)
- Traceability (可追溯性)

**不適用範圍**:
- 特定產出物的結構約束（屬於 CODE、DOCS）
- 特定領域的測試約束（屬於 CODE、DOCS）

**Rule ID 範例**:
```
CORE-AR-C-001: Must not create undeclared artifact types
CORE-BD-P-001: Permission to create new artifacts must be explicitly defined
CORE-TR-P-001: Generated artifacts must include traceability IDs
```

**Application Ruleset 組合範例**:
```yaml
Application_Ruleset("Code Generation"):
  includes:
    - CORE-AR-*    # 引用通用製品隔離規則
    - CORE-BD-*    # 引用通用邊界控制規則
    - CODE-ST-*    # 加上程式碼特定規則
```

---

### CODE Domain (程式碼規則)

**全稱**: Code Rules

**定義**:
專門針對程式碼生成與修改的行為限制規則。

**特性**:
- 產出物特定性：專注於程式碼制品
- 語言中立性：不綁定特定程式語言（語言特定規則屬於 LANG Domain）
- 技術約束性：關注程式碼結構、測試、重構等技術層面

**適用範圍**:
- Structural Change (結構變更)
- Test Integrity (測試完整性)
- 程式碼特定的 Artifact Isolation、Boundary Control 等

**與 LANG Domain 的關係**:
- CODE: 定義通用的程式碼行為約束（適用所有語言）
- LANG: 定義特定語言的程式碼行為約束

**Rule ID 範例**:
```
CODE-ST-C-001: Unauthorized structural refactoring is prohibited
CODE-TI-C-001: Test artifacts must never modify production code
CODE-ST-C-002: Structural refactoring and logic changes must never occur simultaneously
```

---

### DOCS Domain (文檔規則)

**全稱**: Documentation Rules

**定義**:
專門針對文檔生成的行為限制規則。

**特性**:
- 產出物特定性：專注於文檔制品
- 結構約束性：關注文檔的結構、內容、層次
- 合規性：確保文檔符合規範要求

**適用範圍**:
- Structural Change (文檔結構變更)
- Test Integrity (文檔測試規範)
- Artifact Isolation (文檔製品隔離)
- Boundary & Stop (文檔邊界控制)

**特殊考量**:
- 文檔生成的日誌需求可能與程式碼生成不同
- 文檔的邊界控制涉及審批流程

**Rule ID 範例**:
```
DOCS-ST-C-001: General description must describe system context
DOCS-ST-C-02: Non-functional requirements must be explicit and measurable
DOCS-LG-P-001: Each documentation generation must generate execution logs
```

---

### LANG Domain (語言規則)

**全稱**: Language-Specific Rules

**定義**:
針對特定程式語言的行為限制規則，作為應用��域維度。

**定位說明**:
LANG Domain 將「程式語言」視為一種「應用領域」，類似於金融產業、醫療產業有其特殊的產出物需求，不同程式語言也有其特殊的產出物需求（如類型安全、記憶體管理、並發控制等）。

**特性**:
- 語言特定性：針對特定語言的特性與慣例
- 結構對齊性：使用標準的 AR-BD-CN-LG-ST-TI-TR 結構
- 可組合性：透過 Rule Metadata 標註適用語言

**適用範圍**:
- 所有標準的 Behavior Constraint Categories
- 特定語言的編碼標準
- 語言特定的最佳實踐

**結構**:
```
LANG Domain
├── AR - Artifact Isolation (語言版本的製品隔離)
├── BD - Boundary & Stop (語言版本的邊界控制)
├── CN - Constraint Neutrality (語言版本的約束中立性)
├── LG - Logging & Report (語言版本的日誌與報告)
├── ST - Structural Change (語言特定的結構約束)
├── TI - Test Integrity (語言版本的測試完整性)
└── TR - Traceability (語言版本的可追溯性)
```

**Rule ID 格式**:
```
LANG-{CATEGORY}-{LANGUAGE}-{NUMBER}

範例:
LANG-ST-GO-001: Go code must handle all errors explicitly
LANG-ST-JV-001: Java code must use explicit and appropriate types
LANG-ST-JS-001: JavaScript variables must use explicit scope
LANG-ST-PY-001: Python code must prioritize explicitness over cleverness
LANG-ST-RS-001: Rust code must respect ownership and borrowing rules
LANG-ST-TS-001: TypeScript projects must enable strict type checking
```

**語言代碼**:
- `GO`: Go
- `JV`: Java
- `JS`: JavaScript
- `PY`: Python
- `RS`: Rust
- `TS`: TypeScript
- `STD`: 標準/通用（適用所有語言）

**與 Concept.md 的一致性**:
- ✅ LANG 下的 AR、BD、ST 等仍是「對行為的限制分類」
- ✅ 語言作為「應用領域」維度，而非「決策行為」
- ✅ 符合 Domain-based Application Ruleset 原則

---

### GOV Domain (治理規則)

**全稱**: Governance Rules

**定義**:
定義 AI 輔助開發的高層次治理原則與執行機制。

**特殊分類說明**:
GOV Domain 使用專門的治理分類（ENF、PR），而非技術性的 AR-BD-CN-LG-ST-TI-TR 結構。

**分類**:

#### ENF - Enforcement (執行機制)
- **定義**: 確保規則被執行的機制與流程
- **關注點**: 規則遵守、違規處理、報告生成
- **與標準分類的關係**: 涉及 LG (Logging) 和 BD (Boundary) 的概念

#### PR - Principles (治理原則)
- **定義**: 高層次的 AI 治理哲學與原則
- **關注點**: AI 角色定位、責任歸屬、透明性
- **與標準分類的關係**: 為所有 Domain 的元規則 (Meta-Rules)

**特性**:
- 元治理性：規範「如何治理 AI」而非「AI 如何行為」
- 跨域適用性：適用於所有 Domain
- 哲學基礎性：建立在治理理念之上

**Rule ID 範例**:
```
GOV-ENF-C-001: All AI-generated code must comply with coding standards
GOV-ENF-C-002: Detected violations must generate a Code Validation Report (CVR), never auto-fixed
GOV-PR-C-001: AI is a constrained executor, not an autonomous designer
GOV-PR-C-002: All AI behavior must be explicitly governed
```

---

## Domain 之間的關係

### 繼承與特化關係

```
CORE (通用基礎)
  ├── CODE (程式碼特化)
  │     └── LANG (語言進一步特化)
  └── DOCS (文檔特化)

GOV (元治理，橫切所有 Domain)
```

### 組合關係 (透過 Application Ruleset)

```yaml
# 範例：Go 語言程式碼生成
Application_Ruleset("Go Code Generation"):
  includes:
    - CORE-AR-*        # 通用製品隔離
    - CORE-BD-*        # 通用邊界控制
    - CORE-TR-*        # 通用可追溯性
    - CODE-ST-*        # 程式碼結構約束
    - CODE-TI-*        # 測試完整性
    - LANG-ST-GO-*     # Go 語言特定約束
    - GOV-ENF-*        # 治理執行機制

# 範例：Python 語言程式碼生成
Application_Ruleset("Python Code Generation"):
  includes:
    - CORE-AR-*        # 相同的通用規則
    - CORE-BD-*
    - CORE-TR-*
    - CODE-ST-*
    - CODE-TI-*
    - LANG-ST-PY-*     # Python 語言特定約束
    - GOV-ENF-*
```

---

## Domain 選擇決策樹

```
開始
  │
  ├─ 規則是否涉及治理機制或原則？
  │   └─ YES → GOV Domain
  │
  ├─ 規則是否可跨域共用（程式碼、文檔皆適用）？
  │   └─ YES → CORE Domain
  │
  ├─ 規則是否針對特定產出物類型？
  │   ├─ 程式碼 → CODE Domain
  │   │   └─ 是否針對特定語言？
  │   │       └─ YES → LANG Domain
  │   │
  │   └─ 文檔 → DOCS Domain
  │
  └─ 無法判斷 → CORE Domain (預設)
```

---

## Domain 覆蓋矩陣

| Domain | AR | BD | CN | LG | ST | TI | TR | 特殊類別 |
|--------|----|----|----|----|----|----|----|----------|
| CORE   | ✓  | ✓  | ✓  | ✓  | ✓  | ✓  | ✓  | -        |
| CODE   | ✓  | ✓  | ✓  | ✓  | ✓  | ✓  | ✓  | -        |
| DOCS   | ✓  | ✓  | ✓  | ⚠️ | ✓  | ✓  | ✓  | -        |
| LANG   | ✓  | ✓  | ✓  | ✓  | ✓  | ✓  | ✓  | 語言標籤 |
| GOV    | -  | -  | -  | -  | -  | -  | -  | ENF, PR  |

**圖例**:
- ✓ = 完整覆蓋
- ⚠️ = 部分覆蓋或需要補充
- - = 不適用

---

## 版本歷史

| 版本 | 日期       | 變更說明                     |
|------|-----------|------------------------------|
| 1.0.0| 2026-03-19| 初版，定義所有 Domain 架構   |

---

**維護者**: AISDGR
**最後更新**: 2026-03-19
