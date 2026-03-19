# Behavior Constraint Category Definitions

本文檔定義 AISDGR 框架中的所有行為限制類型（Behavior Constraint Categories）。

---

## 概述

Behavior Constraint Category 是「對 AI 行為的限制方式的分類」，而非「AI 行為本身的分類」。

**關鍵區別**:
- ❌ 不是「AI 在做什麼」（Code Generation、Test Generation）
- ✅ 而是「如何限制 AI 的行為」（邊界控制、結構約束）

**二維矩陣結構**:
- **橫軸**: Domain（治理領域）- 應用範疇
- **縱軸**: Category（限制類型）- 限制方式

---

## 標準 Behavior Constraint Categories

### AR - Artifact Isolation (製品隔離)

**定義**:
確保生成的製品（程式碼、文檔等）之間的隔離與獨立性，防止跨製品類型的未授權修改或創建。

**核心關注點**:
- 製品類型的明確聲明
- 製品之間的邊界定義
- 製品創建與修改的權限控制

**適用 Domain**:
- ✅ CORE (通用製品隔離)
- ✅ CODE (程式碼製品隔離)
- ✅ DOCS (文檔製品隔離)
- ✅ LANG (語言製品隔離)
- ❌ GOV (不適用)

**典型��則範例**:
```yaml
# CORE-AR-C-001
description: Must not create undeclared artifact types
rationale: 確保所有製品類型都經過明確定義與授權

# CORE-AR-C-002
description: Must not modify undeclared artifact types
rationale: 防止對未授權製品的修改

# CODE-AR-C-003
description: Must not modify artifacts belonging to more than one artifact types
rationale: 確保製品修改的範圍清晰
```

**可觀測性**:
- ✅ 可觀測違規（創建了未聲明的製品類型）
- ✅ 可生成 Evidence（違規日誌）

---

### BD - Boundary & Stop (邊界與停止)

**定義**:
定義 AI 執行的邊界範圍與停止條件，確保 AI 在授權範圍內操作並在必要時停止。

**核心關注點**:
- 執行邊界的明確定義
- 邊界衝突的檢測與處理
- 停止條件的觸發機制

**適用 Domain**:
- ✅ CORE (通用邊界控制)
- ✅ CODE (程式碼邊界)
- ✅ DOCS (文檔邊界)
- ✅ LANG (語言邊界)
- ❌ GOV (不適用，使用 ENF 替代)

**典型規則範例**:
```yaml
# CORE-BD-C-001
description: Code must not modify artifacts beyond declared boundaries
rationale: 防止越權修改

# CODE-BD-P-001
description: Code execution must stop after declared boundaries
rationale: 確保執行範圍受控

# DOCS-BD-C-001
description: Documents must be immutable after approval
rationale: 確保審批後的文檔不被修改
```

**可觀測性**:
- ✅ 可觀測違規（越界操作）
- ✅ 可觀測停止條件觸發
- ✅ 可生成 Evidence（邊界違規報告）

---

### CN - Constraint Neutrality (約束中立性)

**定義**:
AI 不應推斷未聲明的約束、邊界或驗證目標，保持約束的明確性與中立性。

**核心關注點**:
- 避免隱式推斷
- 確保約束的顯式聲明
- 防止假設性約束

**適用 Domain**:
- ✅ CORE (通用約束中立性)
- ✅ CODE (程式碼約束中立性)
- ✅ DOCS (文檔約束中立性)
- ✅ LANG (語言約束中立性)
- ❌ GOV (不適用)

**典型規則範例**:
```yaml
# CODE-CN-C-001
description: Must never infer undeclared boundaries
rationale: 防止 AI 自行假設邊界

# CODE-CN-C-002
description: Must never infer undeclared requirements
rationale: 確保需求來自明確來源

# DOCS-CN-C-001
description: AI must never implicitly infer content
rationale: 確保文檔內容來自明確指示
```

**可觀測性**:
- ⚠️ 難以直接觀測「未推斷」
- ✅ 可透過審查結果推斷是否違規
- ⚠️ 需要人工審查配合

---

### LG - Logging & Report (日誌與報告)

**定義**:
執行過程的日誌記錄與報告生成，確保所有行為可追溯、可審計。

**核心關注點**:
- 執行過程的記錄
- 規則評估的報告
- 變更摘要的生成
- 理由說明的強制性

**適用 Domain**:
- ✅ CORE (通用日誌)
- ✅ CODE (程式碼執行日誌)
- ⚠️ DOCS (文檔生成日誌，需補充)
- ✅ LANG (語言相關日誌)
- ❌ GOV (不適用，ENF 涵蓋部分功能)

**典型規則範例**:
```yaml
# CODE-LG-C-001
description: Rationale must never be empty or purely repetitive
rationale: 確保每個決策都有實質理由

# CODE-LG-P-001
description: Each execution must generate locatable execution logs
rationale: 確保執行過程可追溯

# CODE-LG-P-006
description: Must generate rule evaluation report
rationale: 提供規則執行的完整報告
```

**可觀測性**:
- ✅ 可觀測日誌是否生成
- ✅ 可觀測報告是否完整
- ✅ 可生成 Evidence（日誌檔案、報告）

**DOCS Domain 需補充的規則**:
```yaml
# DOCS-LG-P-001 (建議新增)
description: Each documentation generation must generate execution logs

# DOCS-LG-P-002 (建議新增)
description: Documentation generation logs must link to traceability IDs

# DOCS-LG-P-003 (建議新增)
description: Each documentation generation must include rationale explanation
```

---

### ST - Structural Change (結構變更)

**定義**:
對系統結構的修改控制，確保結構變更經過授權且不與邏輯變更混淆。

**核心關注點**:
- 結構重構的授權
- 結構變更與邏輯變更的分離
- 新功能引入的控制
- 現有行為刪除的控制

**適用 Domain**:
- ✅ CORE (通用結構變更)
- ✅ CODE (程式碼結構變更)
- ✅ DOCS (文檔結構變更)
- ✅ LANG (語言結構變更)
- ❌ GOV (不適用)

**典型規則範例**:
```yaml
# CODE-ST-C-001
description: Unauthorized structural refactoring is prohibited
rationale: 確保結構變更經過授權

# CODE-ST-C-002
description: Structural refactoring and logic changes must never occur simultaneously
rationale: 防止結構與邏輯變更混淆

# DOCS-ST-C-001
description: General description must describe system context
rationale: 確保文檔結構的完整性

# LANG-ST-GO-001
description: Go code must handle all errors explicitly using multiple return values
rationale: Go 語言特定的結構要求
```

**可觀測性**:
- ✅ 可觀測結構變更（透過 AST 比對）
- ✅ 可檢測結構與邏輯變更同時發生
- ✅ 可生成 Evidence（變更摘要）

---

### TI - Test Integrity (測試完整性)

**定義**:
確保測試的獨立性與完整性，防止測試被修改以適應實現或擴大驗證範圍。

**核心關注點**:
- 測試與生產代碼的隔離
- 測試範圍的控制
- 測試意圖的保留
- 防止測試重新定義預期行為

**適用 Domain**:
- ✅ CORE (通用測試完整性)
- ✅ CODE (程式碼測試)
- ✅ DOCS (文檔測試規範)
- ✅ LANG (語言測試)
- ❌ GOV (不適用)

**典型規則範例**:
```yaml
# CODE-TI-C-001
description: Test artifacts must never modify or affect production code
rationale: 確保測試的獨立性

# CODE-TI-C-002
description: Test changes must not expand verification scope
rationale: 防止測試範圍無限制擴大

# CODE-TI-C-003
description: Tests must never redefine expected behavior
rationale: 防止測試迎合實現

# DOCS-TI-P-001
description: Test specifications should follow project policy
rationale: 確保文檔測試規範的一致性
```

**可觀測性**:
- ✅ 可觀測測試是否修改生產代碼
- ⚠️ 難以自動檢測測試範圍擴大（需人工審查）
- ⚠️ 需要比對測試歷史

---

### TR - Traceability (可追溯性)

**定義**:
確保生成的製品可追溯到原始需求，建立完整的追溯鏈。

**核心關注點**:
- 追溯 ID 的生成與嵌入
- 追溯 ID 的唯一性
- 孤立製品的防止
- 追溯鏈的完整性

**適用 Domain**:
- ✅ CORE (通用可追溯性)
- ✅ CODE (程式碼可追溯性)
- ✅ DOCS (文檔可追溯性)
- ✅ LANG (語言可追溯性)
- ❌ GOV (不適用)

**典型規則範例**:
```yaml
# CORE-TR-C-001
description: Must never delete existing traceability IDs
rationale: 保持追溯鏈的完整性

# CORE-TR-C-002
description: Must never generate orphaned artifacts without traceability IDs
rationale: 確保所有製品可追溯

# CORE-TR-P-001
description: Generated artifacts must include traceability IDs
rationale: 建立追溯關聯

# CORE-TR-P-002
description: Traceability IDs must be embedded in artifacts themselves
rationale: 確保追溯 ID 與製品不可分離

# DOCS-TR-P-001
description: AI should use approved semantic sources
rationale: 確保文檔追溯的語義正確性
```

**可觀測性**:
- ✅ 可觀測追溯 ID 是否存在
- ✅ 可觀測追溯 ID 是否被刪除
- ✅ 可生成 Evidence（追溯 ID 列表）

---

## 特殊 Behavior Constraint Categories (僅 GOV)

### ENF - Enforcement (執行機制)

**定義**:
確保規則被執行的機制與流程，包括規則遵守檢查、違規處理、報告生成。

**核心關注點**:
- 規則遵守的強制性
- 違規的檢測與報告
- 執行的持續性控制

**僅適用 Domain**:
- ✅ GOV (治理專用)
- ❌ 其他 Domain (使用 LG 和 BD 替代)

**與標準 Category 的關係**:
- 涉及 LG (Logging & Report) 的概念
- 涉及 BD (Boundary & Stop) 的概念
- 但更聚焦於「治理層面」的執行機制

**典型規���範例**:
```yaml
# GOV-ENF-C-001
description: All AI-generated code must comply with core and language-specific coding standards
rationale: 確保程式碼符合標準

# GOV-ENF-C-002
description: Detected violations must generate a Code Validation Report (CVR), never auto-fixed
rationale: 確保違規可見且需人工處理

# GOV-ENF-P-001
description: AI execution may continue in presence of violations, but violations must remain visible and traceable
rationale: 平衡執行持續性與違規可見性
```

**可觀測性**:
- ✅ 可觀測規則是否被遵守
- ✅ 可觀測違規報告是否生成
- ✅ 可生成 Evidence (CVR)

---

### PR - Principles (治理原則)

**定義**:
高層次的 AI 治理哲學與原則，定義 AI 的角色定位與責任邊界。

**核心關注點**:
- AI 的角色定位
- 治理的強制性
- 責任的歸屬
- 透明性與問責性

**僅適用 Domain**:
- ✅ GOV (治理專用)
- ❌ 其他 Domain (不適用)

**與標準 Category 的關係**:
- 為所有 Domain 的元規則 (Meta-Rules)
- 超出技術約束範疇
- 建立治理哲學基礎

**典型規則範例**:
```yaml
# GOV-PR-C-001
description: AI is a constrained executor, not an autonomous designer
rationale: 定義 AI 的角色邊界

# GOV-PR-C-002
description: All AI behavior must be explicitly governed
rationale: 確保 AI 行為受到治理

# GOV-PR-C-003
description: Violations must explicitly surface
rationale: 確保違規透明化

# GOV-PR-P-001
description: Validity and correctness are separate responsibilities
rationale: 區分有效性與正確性的責任
```

**可觀測性**:
- ⚠️ 難以直接觀測「原則是否被遵守」
- ✅ 可透過間接指標推斷
- ⚠️ 需要治理審查配合

---

## Category 選擇決策樹

```
開始
  │
  ├─ 規則涉及治理機制或原則？
  │   ├─ 機制 → ENF
  │   └─ 原則 → PR
  │
  ├─ 規則涉及製品隔離或權限？
  │   └─ AR
  │
  ├─ 規則涉及執行範圍或停止？
  │   └─ BD
  │
  ├─ 規則涉及推斷或假設？
  │   └─ CN
  │
  ├─ 規則涉及日誌或報告？
  │   └─ LG
  │
  ├─ 規則涉及結構或重構？
  │   └─ ST
  │
  ├─ 規則涉及測試獨立性？
  │   └─ TI
  │
  └─ 規則涉及追溯或關聯？
      └─ TR
```

---

## Category 統計

| Category | CODE | DOCS | LANG | GOV | 總計  |
|----------|------|------|------|-----|-------|
| AR       | 5    | 4    | TBD  | -   | 9+    |
| BD       | 6    | 4    | TBD  | -   | 10+   |
| CN       | 3    | 1    | TBD  | -   | 4+    |
| LG       | 7    | TBD  | TBD  | -   | 7+    |
| ST       | 5    | 21   | 47   | -   | 73+   |
| TI       | 5    | 1    | TBD  | -   | 6+    |
| TR       | 5    | 1    | TBD  | -   | 6+    |
| ENF      | -    | -    | -    | 3   | 3     |
| PR       | -    | -    | -    | 4   | 4     |
| **總計** | 36   | 32   | 47   | 7   | 122+  |

**註**: TBD = To Be Determined（待 LANG Domain 重構後確定）

---

## 版本歷史

| 版本 | 日期       | 變更說明                     |
|------|-----------|------------------------------|
| 1.0.0| 2026-03-19| 初版，定義所有 Category      |

---

**維護者**: AISDGR
**最後更新**: 2026-03-19
