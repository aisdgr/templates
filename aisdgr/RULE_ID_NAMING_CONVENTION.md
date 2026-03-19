# Rule ID Naming Convention

本文檔定義 AISDGR 框架中所有 Rule 的 ID 命名規範。

---

## 概述

Rule ID 是規則的唯一識別符，採用結構化命名規則以確保：
- **一致性**: 所有 Domain 使用相同的結構邏輯
- **可讀性**: 從 ID 能推斷規則的大致內容
- **可擴展性**: 支援子類型、變體、關聯
- **簡潔性**: 避免過長的 ID

---

## 標準格式

### 基本格式

```
{DOMAIN}-{CATEGORY}-{SUBTYPE}-{NUMBER}
```

### 組成部分

#### 1. DOMAIN (2-4 字母)

領域代碼，標識規則所屬的治理領域。

| Domain  | 代碼 | 說明         |
|---------|------|-------------|
| Core    | CORE | 通用規則     |
| Code    | CODE | 程式碼規則   |
| Docs    | DOCS | 文檔規則     |
| Language| LANG | 語言規則     |
| Governance | GOV | 治理規則  |

---

#### 2. CATEGORY (2 字母)

行為限制類型，標識規則的限制方式。

**標準類型** (適用於 CORE、CODE、DOCS、LANG):

| Category                | 代碼 | 說明                   |
|-------------------------|------|-----------------------|
| Artifact Isolation      | AR   | 製品隔離               |
| Boundary & Stop         | BD   | 邊界與停止             |
| Constraint Neutrality   | CN   | 約束中立性             |
| Logging & Report        | LG   | 日誌與報告             |
| Structural Change       | ST   | 結構變更               |
| Test Integrity          | TI   | 測試完整性             |
| Traceability            | TR   | 可追溯性               |

**特殊類型** (僅適用於 GOV):

| Category       | 代碼 | 說明             |
|----------------|------|-----------------|
| Enforcement    | ENF  | 執行機制         |
| Principles     | PR   | 治理原則         |

---

#### 3. SUBTYPE (可選，0-4 字母)

子類型或特定範疇，提供更細緻的分類。

**通用子類型** (適用於所有 Domain):

| Subtype   | 代碼 | 說明                          |
|-----------|------|-------------------------------|
| Constraint| C    | 約束 (MUST NOT)                |
| Policy    | P    | 政策 (MUST)                    |

**語言子類型** (僅適用於 LANG Domain):

| Language   | 代碼 | 說明        |
|-----------|------|------------|
| Go        | GO   | Go 語言     |
| Java      | JV   | Java 語言   |
| JavaScript| JS   | JavaScript  |
| Python    | PY   | Python      |
| Rust      | RS   | Rust        |
| TypeScript| TS   | TypeScript  |
| Standard  | STD  | 標準/通用   |

**子類型組合規則**:
- 通用子類型 + 語言子類型可組合
- 範例: `LANG-ST-GO-001` (Go 語言的結構約束)

---

#### 4. NUMBER (3 位數字)

序號，範圍 001-999。

**編號規範**:

| 號段   | 用途             | 說明                     |
|--------|-----------------|-------------------------|
| 001-099| 核心規則        | 該分類下最重要的規則     |
| 100-199| 擴展規則        | 核心規則的延伸           |
| 200-299| 特定場景規則    | 針對特定場景的規則       |
| 300-399| 實驗性規則      | 試行中的規則             |
| 400-999| 保留            | 未來使用                 |

**編號原則**:
- 相關規則應使用連續編號
- 預留號段以便插入新規則
- 廢棄規則的編號不應重用

---

## 命名範例

### CORE Domain (通用規則)

```
CORE-AR-C-001
  │    │  │  │
  │    │  │  └─ 第 1 號規則（核心）
  │    │  └──── Constraint (MUST NOT)
  │    └─────── Artifact Isolation
  └──────────── Core Domain

說明: 通用製品隔離約束第 1 號
內容: Must not create undeclared artifact types
```

```
CORE-BD-P-001
  │    │  │  │
  │    │  │  └─ 第 1 號規則（核心）
  │    │  └──── Policy (MUST)
  │    └─────── Boundary & Stop
  └──────────── Core Domain

說明: 通用邊界控制政策第 1 號
內容: Permission to create new artifacts must be explicitly defined
```

---

### CODE Domain (程式碼規則)

```
CODE-ST-C-001
  │    │  │  │
  │    │  │  └─ 第 1 號規則（核心）
  │    │  └──── Constraint (MUST NOT)
  │    └─────── Structural Change
  └──────────── Code Domain

說明: 程式碼結構變更約束第 1 號
內容: Unauthorized structural refactoring is prohibited
```

```
CODE-TI-C-001
  │    │  │  │
  │    │  │  └─ 第 1 號規則（核心）
  │    │  └──── Constraint (MUST NOT)
  │    └─────── Test Integrity
  └──────────── Code Domain

說明: 測試完整性約束第 1 號
內容: Test artifacts must never modify production code
```

---

### LANG Domain (語言規則)

```
LANG-ST-GO-001
  │    │  │  │
  │    │  │  └─ 第 1 號規則（核心）
  │    │  └──── Go 語言
  │    └─────── Structural Change
  └──────────── Language Domain

說明: Go 語言結構變更規則第 1 號
內容: Go code must handle all errors explicitly
```

```
LANG-ST-JV-001
  │    │  │  │
  │    │  │  └─ 第 1 號規則（核心）
  │    │  └──── Java 語言
  │    └─────── Structural Change
  └──────────── Language Domain

說明: Java 語言結構變更規則第 1 號
內容: Java code must use explicit and appropriate types
```

---

### DOCS Domain (文檔規則)

```
DOCS-ST-C-001
  │    │  │  │
  │    │  │  └─ 第 1 號規則（核心）
  │    │  └──── Constraint (MUST NOT)
  │    └─────── Structural Change
  └──────────── Docs Domain

說明: 文檔結構��更約束第 1 號
內容: General description must describe system context
```

---

### GOV Domain (治理規則)

```
GOV-ENF-C-001
  │   │   │  │
  │   │   │  └─ 第 1 號規則（核心）
  │   │   └──── Constraint (MUST NOT)
  │   └──────── Enforcement
  └──────────── Governance Domain

說明: 治理執行機制約束第 1 號
內容: All AI-generated code must comply with coding standards
```

```
GOV-PR-C-001
  │   │   │  │
  │   │   │  └─ 第 1 號規則（核心）
  │   │   └──── Constraint (MUST NOT)
  │   └──────── Principles
  └──────────── Governance Domain

說明: 治理原則約束第 1 號
內容: AI is a constrained executor, not an autonomous designer
```

---

## 進階命名規則（可選）

### 分組編號

對於大型分類，可使用分組編號：

**格式**: `{DOMAIN}-{CATEGORY}-{SUBTYPE}-{GROUP}-{NUMBER}`

**範例**:
```
LANG-ST-GO-01-001
  │    │  │  │  │
  │    │  │  │  └─ 第 1 號規則
  │    │  │  └──── 第 1 組（錯誤處理）
  │    │  └─────── Go 語言
  │    └────────── Structural Change
  └─────────────── Language Domain

說明: Go 語言 - 結構 - 錯誤處理組 - 第 1 條
```

**分組範例**:
```
LANG-ST-GO-01-001  (錯誤處理組 - 第 1 條)
LANG-ST-GO-01-002  (錯誤處理組 - 第 2 條)
LANG-ST-GO-02-001  (並發控制組 - 第 1 條)
LANG-ST-GO-03-001  (記憶體管理組 - 第 1 條)
```

---

## 命名規則對照表

### 舊格式 → 新格式

| Domain | 舊 ID           | 新 ID            | 變更說明                          |
|--------|-----------------|------------------|-----------------------------------|
| CODE   | CODE-AR-C-01    | CORE-AR-C-001    | 移至 CORE，使用 3 位數字          |
| CODE   | CODE-BD-C-01    | CODE-BD-C-001    | 使用 3 位數字                     |
| LANG   | LANG-GO-C-01    | LANG-ST-GO-001   | 增加 ST 類型，語義更清晰          |
| LANG   | LANG-JAVA-C-01  | LANG-ST-JV-001   | Java 改為 JV，增加 ST 類型        |
| DOCS   | DOCS-ST-C-21    | DOCS-ST-C-021    | 使用 3 位數字                     |
| GOV    | GOV-ENF-C-01    | GOV-ENF-C-001    | 使用 3 位數字                     |

---

## 特殊情況處理

### 1. 規則移動

當規則從一個 Domain 移至另一個 Domain 時：

**處理方式**:
- 保留原 ID 作為別名（Alias）
- 建立對照表記錄移動歷史

**範例**:
```yaml
# 原 ID: CODE-AR-C-01
# 新 ID: CORE-AR-C-001

aliases:
  - CODE-AR-C-01  # 舊 ID 作為別名
moved_from: CODE
moved_to: CORE
moved_date: 2026-03-19
```

---

### 2. 規則合併

當多條規則合併為一條時：

**處理方式**:
- 使用新的 ID
- 記錄合併來源

**範例**:
```yaml
id: CORE-AR-C-001
merged_from:
  - CODE-AR-C-01
  - DOCS-AR-C-01
merged_date: 2026-03-19
```

---

### 3. 規則廢棄

當規則不再使用時：

**處理方式**:
- 不刪除 ID，標記為 `deprecated`
- 保留文件記錄

**範例**:
```yaml
id: CODE-ST-C-099
status: deprecated
deprecated_date: 2026-03-19
reason: "被 CORE-ST-C-001 取代"
replaced_by: CORE-ST-C-001
```

---

## 驗證規則

### 格式驗證

使用正則表達式驗證 Rule ID 格式：

```regex
^(CORE|CODE|DOCS|LANG|GOV)-(AR|BD|CN|LG|ST|TI|TR|ENF|PR)-([A-Z]{2,4})-([0-9]{3})$

範例匹配:
✓ CORE-AR-C-001
✓ CODE-ST-C-001
✓ LANG-ST-GO-001
✓ GOV-ENF-C-001

範例不匹配:
✗ CORE-AR-C-01     (號碼不是 3 位)
✗ LANG-GO-C-001    (缺少 CATEGORY)
✗ CODE-ST-001      (缺少 SUBTYPE)
```

---

### 語義驗證

檢查 Rule ID 的語義正確性：

**驗證項目**:
1. DOMAIN 與 CATEGORY 的組合是否合理
   - ✗ `GOV-ST-*` (GOV 不應有 ST 類型)
   - ✓ `GOV-ENF-*`

2. SUBTYPE 與 DOMAIN 的組合是否合理
   - ✗ `CORE-ST-GO-*` (CORE 不應有語言子類型)
   - ✓ `LANG-ST-GO-*`

3. NUMBER 是否在合理範圍
   - ✗ `*-001-000` (不能為 000)
   - ✓ `*-001-099`

---

## 命名最佳實踐

### 1. 保持一致性

✅ **好的做法**:
```
CORE-AR-C-001
CORE-AR-C-002
CORE-AR-C-003
```

❌ **不好的做法**:
```
CORE-AR-C-001
CORE-AR-C-02   (不一致的位數)
CORE-AR-C-003
```

---

### 2. 預留擴展空間

✅ **好的做法**:
```
CORE-AR-C-001  (核心規則 1)
CORE-AR-C-002  (核心規則 2)
CORE-AR-C-003  (核心規則 3)
...預留 004-099...
CORE-AR-C-100  (擴展規則 1)
```

---

### 3. 相關規則連續編號

✅ **好的做法**:
```
LANG-ST-GO-001  (錯誤處理相關)
LANG-ST-GO-002  (錯誤處理相關)
LANG-ST-GO-003  (錯誤處理相關)
LANG-ST-GO-100  (並發相關)
LANG-ST-GO-101  (並發相關)
```

---

## 版本歷史

| 版本 | 日期       | 變更說明                     |
|------|-----------|------------------------------|
| 1.0.0| 2026-03-19| 初版，定義命名規範           |

---

**維護者**: AISDGR
**最後更新**: 2026-03-19
