# AISDGR 架構遷移計劃

**建立日期**: 2026-03-19
**執行狀態**: 待執行
**預估工作量**: 大規模
**風險等級**: 中高

---

## 遷移概述

本文檔描述如何將當前的 AISDGR 架構遷移到新的結構，包括：
1. 建立 CORE Domain
2. 重構 LANG Domain
3. 調整 Rule ID 格式
4. 重新組織檔案結構

---

## 遷移決策清單

在執行遷移前，請確認以下決策：

| 決策編號 | 決策問題              | 建議方案                                | 狀態 |
|---------|---------------------|---------------------------------------|------|
| D1      | 是否建立 CORE Domain? | ✅ 建立                                | 待確認 |
| D2      | CORE 的命名?          | CORE                                  | 待確認 |
| D3      | LANG Domain 的結構?   | AR-BD-CN-LG-ST-TI-TR                  | 待確認 |
| D4      | Rule ID 格式?         | 新格式 (DOMAIN-CATEGORY-SUBTYPE-NUMBER) | 待確認 |
| D5      | 號碼位數?             | 3 位 (001-999)                        | 待確認 |
| D6      | GOV Domain 是否調整?  | 保持 ENF/PR                           | 待確認 |
| D7      | DOCS 是否補充 LG?     | ✅ 補充                                | 待確認 |

---

## 遷移階段

### Phase 1: 基礎建設 ✅ (已完成)

**已完成項目**:
- ✅ 建立 DOMAIN_DEFINITIONS.md
- ✅ 建立 RULE_ID_NAMING_CONVENTION.md
- ✅ 建立 BEHAVIOR_CONSTRAINT_CATEGORY.md
- ✅ 建立 aisdgr/core/ 目錄

---

### Phase 2: 建立 CORE Domain (待執行)

**任務清單**:

#### 2.1 識別可移至 CORE 的規則

從 CODE 和 DOCS Domain 中識別通用規則。

**候選規則**:

| 當前 ID        | 內容摘要                         | 建議新 ID        | 理由             |
|----------------|----------------------------------|------------------|------------------|
| CODE-AR-C-01   | 禁止創建未聲明的製品類型         | CORE-AR-C-001    | 通用製品隔離     |
| CODE-AR-P-01   | 創建新製品的權限必須明確定義     | CORE-AR-P-001    | 通用製品隔離     |
| CODE-AR-P-02   | 所有生成的製品必須可尋址和定位   | CORE-AR-P-002    | 通用製品隔離     |
| CODE-BD-*      | 邊界控制相關                     | CORE-BD-*        | 通用邊界控制     |
| CODE-CN-*      | 約束中立性相關                   | CORE-CN-*        | 通用約束中立性   |
| CODE-TR-*      | 可追溯性相關                     | CORE-TR-*        | 通用可追溯性     |

**估計數量**: 20-30 條規則

---

#### 2.2 創建 CORE Domain 規則檔案

**目標結構**:
```
aisdgr/core/
├── README.md
├── rules/
│   ├── CORE-AR-C-001.yaml
│   ├── CORE-AR-P-001.yaml
│   ├── CORE-AR-P-002.yaml
│   ├── CORE-BD-C-001.yaml
│   ├── ...
│   └── LIST.md
└── ruleset/
    └── README.md
```

**執行步驟**:
1. 創建 `aisdgr/core/README.md`
2. 創建 `aisdgr/core/rules/LIST.md`
3. 遷移通用規則到 CORE
4. 更新原 CODE/DOCS 規則，添加 `superseded_by` 標記

---

### Phase 3: LANG Domain 重構 (待執行)

**任務清單**:

#### 3.1 重構 LANG Domain 結構

**當前結構** (不正確):
```
aisdgr/lang/
├── PLAN.md
└── rules/
    ├── LANG-GO-C-01.yaml
    ├── LANG-JAVA-C-01.yaml
    └── ...
```

**目標結構** (正確):
```
aisdgr/lang/
├── README.md
├── PLAN.md (保留)
├── rules/
│   ├── AR/
│   │   ├── LANG-AR-C-001.yaml (通用)
│   │   └── ...
│   ├── BD/
│   │   ├── LANG-BD-C-001.yaml (通用)
│   │   └── ...
│   ├── CN/
│   │   └── ...
│   ├── LG/
│   │   └── ...
│   ├── ST/
│   │   ├── LANG-ST-STD-001.yaml (標準/通用)
│   │   ├── LANG-ST-GO-001.yaml (Go 語言)
│   │   ├── LANG-ST-JV-001.yaml (Java 語言)
│   │   ├── LANG-ST-JS-001.yaml (JavaScript)
│   │   ├── LANG-ST-PY-001.yaml (Python)
│   │   ├── LANG-ST-RS-001.yaml (Rust)
│   │   ├── LANG-ST-TS-001.yaml (TypeScript)
│   │   └── ...
│   ├── TI/
│   │   └── ...
│   ├── TR/
│   │   └── ...
│   └── LIST.md
└── ruleset/
    └── README.md
```

---

#### 3.2 LANG Rule ID 映射表

**語言代碼對照**:
- `GO`: Go (原 LANG-GO-*)
- `JV`: Java (原 LANG-JAVA-*)
- `JS`: JavaScript (原 LANG-JS-*)
- `PY`: Python (原 LANG-PY-*)
- `RS`: Rust (原 LANG-RS-*)
- `TS`: TypeScript (原 LANG-TS-*)
- `STD`: 標準/通用 (原 LANG-STD-*)

**映射範例**:

| 舊 ID            | 新 ID             | 變更說明                          |
|------------------|-------------------|-----------------------------------|
| LANG-GO-C-01     | LANG-ST-GO-001    | 增加 ST 類型，3 位數字            |
| LANG-JAVA-C-01   | LANG-ST-JV-001    | JAVA→JV，增加 ST 類型             |
| LANG-JS-C-01     | LANG-ST-JS-001    | 增加 ST 類型，3 位數字            |
| LANG-PY-C-01     | LANG-ST-PY-001    | 增加 ST 類型，3 位數字            |
| LANG-RS-C-01     | LANG-ST-RS-001    | 增加 ST 類型，3 位數字            |
| LANG-TS-C-01     | LANG-ST-TS-001    | 增加 ST 類型，3 位數字            |
| LANG-STD-C-01    | LANG-ST-STD-001   | 增加 ST 類型，3 位數字            |

**總計**: 47 條規則需重新命名

---

#### 3.3 為 LANG 規則添加 Metadata

在每個 LANG 規則檔案中添加語言 Metadata：

```yaml
id: LANG-ST-GO-001
type: Constraint
description: Go code must handle all errors explicitly using multiple return values

metadata:
  languages: [Go]  # 新增語言標籤
  focus_area: Error Handling
  category: Structural Integrity
  # ... 其他 metadata
```

---

### Phase 4: CODE Domain 調整 (待執行)

**任務清單**:

#### 4.1 重新編號 CODE 規則

將所有 CODE 規則的 ID 從 2 位數字改為 3 位數字。

**映射範例**:

| 舊 ID         | 新 ID          |
|---------------|----------------|
| CODE-AR-C-01  | CODE-AR-C-001  |
| CODE-AR-C-02  | CODE-AR-C-002  |
| CODE-BD-C-01  | CODE-BD-C-001  |
| ...           | ...            |

**總計**: 38 條規則需重新編號

---

#### 4.2 標記已移至 CORE 的規則

對於已移至 CORE 的規則，在原 CODE 規則中添加標記：

```yaml
id: CODE-AR-C-01
status: superseded
superseded_by: CORE-AR-C-001
superseded_date: 2026-03-19
reason: "移至 CORE Domain 作為通用規則"
```

---

### Phase 5: DOCS Domain 補充 (待執行)

**任務清單**:

#### 5.1 補充 DOCS-LG 規則

創建 DOCS Domain 缺少的 LG (Logging & Report) 規則。

**建議新增規則**:

```yaml
# DOCS-LG-P-001
id: DOCS-LG-P-001
type: Policy
description: Each documentation generation must generate execution logs

# DOCS-LG-P-002
id: DOCS-LG-P-002
type: Policy
description: Documentation generation logs must link to traceability IDs

# DOCS-LG-P-003
id: DOCS-LG-P-003
type: Policy
description: Each documentation generation must include rationale explanation
```

---

#### 5.2 重新編號 DOCS 規則

將所有 DOCS 規則的 ID 從 2 位數字改為 3 位數字。

**總計**: 34 條規則需重新編號 + 3 條新增

---

### Phase 6: GOV Domain 調整 (待執行)

**任務清單**:

#### 6.1 重新編號 GOV 規則

將所有 GOV 規則的 ID 從 2 位數字改為 3 位數字。

**映射範例**:

| 舊 ID         | 新 ID          |
|---------------|----------------|
| GOV-ENF-C-01  | GOV-ENF-C-001  |
| GOV-ENF-C-02  | GOV-ENF-C-002  |
| GOV-PR-C-01   | GOV-PR-C-001   |

**總計**: 7 條規則需重新編號

---

### Phase 7: 文檔更新 (待執行)

**任務清單**:

#### 7.1 更新 RULE.md

根據新架構重新編寫 RULE.md。

**新結構**:
```markdown
# AISDGR 規則完整列表

## 概述
- Domain 定義
- Category 定義
- Rule ID 命名規範

## CORE Domain
### AR - Artifact Isolation
### BD - Boundary & Stop
...

## CODE Domain
### AR - Artifact Isolation (CODE 特定)
### ST - Structural Change
...

## DOCS Domain
### ST - Structural Change
### LG - Logging & Report (新增)
...

## LANG Domain
### ST - Structural Change
#### 通用規則 (STD)
#### Go 語言 (GO)
#### Java 語言 (JV)
...

## GOV Domain
### ENF - Enforcement
### PR - Principles
...

## 統計
```

---

#### 7.2 建立 Rule ID 遷移對照表

創建 `aisdgr/RULE_ID_MIGRATION_MAP.md`，記錄所有舊 ID 到新 ID 的映射。

**格式**:
```markdown
# Rule ID Migration Map

## CODE Domain
| 舊 ID         | 新 ID          | 狀態        | 說明                 |
|---------------|----------------|-------------|----------------------|
| CODE-AR-C-01  | CORE-AR-C-001  | Moved       | 移至 CORE            |
| CODE-BD-C-01  | CODE-BD-C-001  | Renumbered  | 重新編號             |

## LANG Domain
| 舊 ID            | 新 ID             | 狀態        | 說明                 |
|------------------|-------------------|-------------|----------------------|
| LANG-GO-C-01     | LANG-ST-GO-001    | Restructured| 增加 ST 類型         |

...
```

---

#### 7.3 建立 Application Ruleset 範例

創建 `aisdgr/APPLICATION_RULESET_EXAMPLES.md`，展示如何組合規則。

**範例**:
```yaml
# Go 語言程式碼生成
Application_Ruleset("Go Code Generation"):
  includes:
    - CORE-AR-*        # 通用製品隔離
    - CORE-BD-*        # 通用邊界控制
    - CORE-TR-*        # 通用可追溯性
    - CODE-ST-*        # 程式碼結構約束
    - CODE-TI-*        # 測試完整性
    - LANG-ST-GO-*     # Go 語言特定約束
    - GOV-ENF-*        # 治理執行機制
```

---

### Phase 8: 驗證與測試 (待執行)

**任務清單**:

#### 8.1 建立 Rule 驗證工具

創建驗證腳本檢查：
- Rule ID 格式正確性
- Metadata 完整性
- Domain 與 Category 的組合合理性

---

#### 8.2 執行驗證

- 驗證所有 Rule ID 符合新規範
- 驗證無重複 ID
- 驗證所有引用關係正確

---

## 檔案調整統計

### 需要創建的檔案

| 類型         | 數量    | 說明                     |
|-------------|---------|-------------------------|
| 新文檔       | 4 個    | 定義文檔、遷移文檔       |
| CORE 規則    | ~20-30  | 從 CODE/DOCS 遷移       |
| DOCS-LG 規則 | 3 個    | 新增                    |
| 目錄         | 8 個    | LANG 子目錄等           |

---

### 需要重命名的檔案

| Domain | 數量    | 說明                          |
|--------|---------|-------------------------------|
| CODE   | ~38     | 2 位數字 → 3 位數字           |
| DOCS   | ~34     | 2 位數字 → 3 位數字           |
| LANG   | 47      | 增加 CATEGORY，改語言代碼     |
| GOV    | 7       | 2 位數字 → 3 位數字           |
| **總計** | **~126** | **所有規則檔案**            |

---

### 需要修改內容的檔案

| Domain | 數量    | 修改內容                     |
|--------|---------|------------------------------|
| CODE   | ~38     | ID、Metadata、superseded 標記 |
| DOCS   | ~34     | ID、Metadata                  |
| LANG   | 47      | ID、Metadata、語言標籤        |
| GOV    | 7       | ID、Metadata                  |
| **總計** | **~126** | **所有規則檔案**            |

---

## 執行方式建議

### 選項 A: 自動化批量執行（高風險）

**優點**:
- 執行速度快
- 一致性高

**缺點**:
- 錯誤風險高
- 難以回滾
- 需要完善的腳本

**建議**: 僅在充分測試後執行

---

### 選項 B: 分階段手動執行（低風險，推薦）

**優點**:
- 風險可控
- 可隨時調整
- 易於審查

**缺點**:
- 耗時較長
- 需要更多人工

**建議**: 按 Domain 分批執行

**執行順序**:
1. CORE Domain (建立新規則)
2. GOV Domain (數量少，風險低)
3. DOCS Domain (中等風險)
4. CODE Domain (需處理遷移，風險較高)
5. LANG Domain (數量最多，結構變更最大)

---

### 選項 C: 混合執行（平衡風險與效率）

**策略**:
- 文檔創建: 自動化
- 檔案重命名: 半自動（腳本生成命令，人工審查後執行）
- 內容修改: 手動

**建議**: 推薦此方式

---

## 風險評估

### 高風險項目

1. **LANG Domain 重構**
   - 結構變更最大
   - 47 條規則需調整
   - 可能影響現有引用

2. **CODE Domain 遷移**
   - 需識別哪些規則移至 CORE
   - 可能影響現有 Application Ruleset

---

### 中風險項目

1. **Rule ID 重新編號**
   - 所有 126 條規則需重新編號
   - 需建立完整的對照表

2. **DOCS-LG 規則補充**
   - 需設計新規則
   - 可能與 CODE-LG 規則重複

---

### 低風險項目

1. **文檔創建**
   - 不影響現有規則
   - 可獨立執行

2. **GOV Domain 調整**
   - 數量少（7 條）
   - 結構不變

---

## 回滾計劃

### 版本控制

- 在執行前建立 Git 分支
- 每個 Phase 完成後提交
- 保留完整的變更歷史

### 回滾策略

1. **Phase 1-2**: 可直接回滾（無破壞性變更）
2. **Phase 3-6**: 需透過 Git 回滾
3. **Phase 7-8**: 可選擇性回滾

---

## 預估時間表

| Phase | 任務                 | 預估時間 | 執行方式     |
|-------|----------------------|----------|-------------|
| 1     | 基礎建設             | ✅ 完成  | -           |
| 2     | 建立 CORE Domain     | 2-3 天   | 手動        |
| 3     | LANG Domain 重構     | 3-5 天   | 半自動      |
| 4     | CODE Domain 調整     | 2-3 天   | 半自動      |
| 5     | DOCS Domain 補充     | 1-2 天   | 手動        |
| 6     | GOV Domain 調整      | 1 天     | 半自動      |
| 7     | 文檔更新             | 2-3 天   | 手動        |
| 8     | 驗證與測試           | 1-2 天   | 自動化      |
| **總計** |                     | **12-19 天** |          |

---

## 執行前檢查清單

在開始執行遷移前，請確認：

- [ ] 所有決策點已確認
- [ ] 已創建 Git 分支
- [ ] 已備份當前版本
- [ ] 已審查本遷移計劃
- [ ] 已準備回滾方案
- [ ] 已通知相關人員

---

## 下一步行動

### 立即執行（推薦）

1. **確認決策清單** (D1-D7)
2. **開始 Phase 2**: 建立 CORE Domain
3. **逐步執行後續 Phase**

### 需要進一步討論

如果對以下事項有疑問，請先討論：
- LANG Domain 的具體分類方式
- 哪些規則應移至 CORE
- DOCS-LG 規則的具體內容
- 執行方式的最終選擇

---

**維護者**: AISDGR
**最後更新**: 2026-03-19
**版本**: 1.0.0
