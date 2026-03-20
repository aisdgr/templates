# AISDGR 架構調整總結

**日期**: 2026-03-19
**基於**: TASK-2026031903.md
**狀態**: 基礎文檔已建立，大規模遷移待執行

---

## 已完成的工作

### 1. 基礎文檔建立 ✅

已創建以下核心定義文檔：

| 文檔名稱                              | 說明                         | 狀態 |
|---------------------------------------|------------------------------|------|
| `DOMAIN_DEFINITIONS.md`               | 所有 Domain 的定義與說明     | ✅   |
| `RULE_ID_NAMING_CONVENTION.md`        | Rule ID 命名規範             | ✅   |
| `BEHAVIOR_CONSTRAINT_CATEGORY.md`     | 行為限制類型定義             | ✅   |
| `MIGRATION_PLAN.md`                   | 詳細的遷移執行計劃           | ✅   |

### 2. 目錄結構建立 ✅

已建立 CORE Domain 的基本目錄結構：
```
aisdgr/
├── core/
│   └── rules/ (已建立)
```

---

## 核心架構決策

根據 TASK-2026031903.md 的評估，確定以下架構：

### Domain 架構

```
AISDGR Rule Library
├── CORE  - 通用規則（跨域共用）
├── CODE  - 程式���特定規則
├── DOCS  - 文檔特定規則
├── LANG  - 語言特定規則（作為應用領域）
└── GOV   - 治理規則（維持 ENF/PR）
```

### Rule ID 格式

```
{DOMAIN}-{CATEGORY}-{SUBTYPE}-{NUMBER}

範例:
CORE-AR-C-001      (通用製品隔離)
CODE-ST-C-001      (程式碼結構約束)
LANG-ST-GO-001     (Go語言結構約束)
GOV-ENF-C-001      (治理執行機制)
```

### LANG Domain 定位

- **定位**: 語言作為「應用領域」維度（類似金融產業、醫療產業）
- **結構**: 使用標準的 AR-BD-CN-LG-ST-TI-TR
- **語言代碼**: GO (Go), JV (Java), JS (JavaScript), PY (Python), RS (Rust), TS (TypeScript), STD (標準)

---

## 待執行的大規模調整

### 檔案調整統計

| 調整類型       | 數量      | 說明                     |
|---------------|-----------|-------------------------|
| 需重命名的檔案 | ~126 個   | 所有規則檔案             |
| 需修改內容     | ~126 個   | ID、Metadata 更新        |
| 需新增檔案     | ~30 個    | CORE 規則、DOCS-LG 規則  |
| 需更新文檔     | 4 個      | RULE.md、RULE.zh-tw.md 等 |

### 遷移階段

| Phase | 任務                    | 預估時間 | 風險等級 |
|-------|------------------------|----------|----------|
| 1     | 基礎建設               | ✅ 完成  | 低       |
| 2     | 建立 CORE Domain       | 2-3 天   | 中       |
| 3     | LANG Domain 重構       | 3-5 天   | 高       |
| 4     | CODE Domain 調整       | 2-3 天   | 中       |
| 5     | DOCS Domain 補充       | 1-2 天   | 低       |
| 6     | GOV Domain 調整        | 1 天     | 低       |
| 7     | 文檔更新               | 2-3 天   | 低       |
| 8     | 驗證與測試             | 1-2 天   | 低       |

**總計**: 12-19 天

---

## 關鍵決策點（待確認）

在執行大規模遷移前，需要確認以下決策：

| 決策編號 | 決策問題              | 建議方案                              | 需確認 |
|---------|---------------------|---------------------------------------|--------|
| D1      | 是否建立 CORE Domain? | ✅ 建立                                | ❓     |
| D2      | CORE 的命名?          | CORE                                  | ❓     |
| D3      | LANG Domain 的結構?   | AR-BD-CN-LG-ST-TI-TR                  | ❓     |
| D4      | Rule ID 格式?         | 新格式 (DOMAIN-CATEGORY-SUBTYPE-NUMBER) | ❓     |
| D5      | 號碼位數?             | 3 位 (001-999)                        | ❓     |
| D6      | GOV Domain 是否調整?  | 保持 ENF/PR                           | ❓     |
| D7      | DOCS 是否補充 LG?     | ✅ 補充                                | ❓     |

---

## 執行選項

### 選項 A: 立即執行完整遷移

**說明**: 立即開始執行所有 8 個 Phase，完成全部架構調整。

**優點**:
- 一次性完成所有調整
- 架構立即符合 TASK-2026031903.md 建議

**缺點**:
- 需要大量時間（12-19 天）
- 風險較高
- 可能影響現有工作

**建議**: 僅在有充足時間和資源時執行

---

### 選項 B: 分階段執行（推薦）

**說明**: 按 Phase 順序逐步執行，每完成一個 Phase 後評估再繼續。

**建議順序**:
1. **Phase 2**: 建立 CORE Domain（低風險，高價值）
2. **Phase 6**: GOV Domain 調整（數量少，易完成）
3. **Phase 5**: DOCS Domain 補充（中等風險）
4. **Phase 4**: CODE Domain 調整（需處理遷移）
5. **Phase 3**: LANG Domain 重構（風險最高）
6. **Phase 7-8**: 文檔更新與驗證

**優點**:
- 風險可控
- 可隨時暫停
- 每個階段都有產出

**缺點**:
- 完成時間較長
- 需要多次協調

---

### 選項 C: 僅完成基礎文檔（當前狀態）

**說明**: 不執行檔案調整，僅保留已建立的基礎文檔作為參考。

**優點**:
- 零風險
- 可立即使用基礎文檔

**缺點**:
- 實際規則檔案未調整
- 新舊架構並存，可能造成混淆

**建議**: 如果時間有限，可暫時採用此選項

---

## 檔案清單

### 已創建的檔案 ✅

```
aisdgr/
├── DOMAIN_DEFINITIONS.md               ✅ 新建
├── RULE_ID_NAMING_CONVENTION.md        ✅ 新建
├── BEHAVIOR_CONSTRAINT_CATEGORY.md     ✅ 新建
├── MIGRATION_PLAN.md                   ✅ 新建
├── TASK-2026031901.md                  ✅ 已存在
├── TASK-2026031902.md                  ✅ 已存在
├── TASK-2026031903.md                  ✅ 已存在
├── Concept.md                          ✅ 已存在
├── RULE.md                             ⚠️ 待更新
├── RULE.zh-tw.md                       ⚠️ 待更新
└── core/
    └── rules/                          ✅ 已建立目錄
```

### 待創建/更新的檔案 ⚠️

```
aisdgr/
├── RULE_ID_MIGRATION_MAP.md            ⚠️ 待創建
├── APPLICATION_RULESET_EXAMPLES.md     ⚠️ 待創建
├── core/
│   ├── README.md                       ⚠️ 待創建
│   └── rules/
│       ├── CORE-AR-C-001.yaml          ⚠️ 待創建（~20-30 個）
│       └── LIST.md                     ⚠️ 待創建
├── code/rules/
│   └── CODE-*.yaml                     ⚠️ 待重命名/修改（38 個）
├── docs/rules/
│   ├── DOCS-LG-P-001.yaml              ⚠️ 待創建（3 個）
│   └── DOCS-*.yaml                     ⚠️ 待重命名/修改（34 個）
├── lang/rules/
│   ├── AR/                             ⚠️ 待創建目錄
│   ├── BD/                             ⚠️ 待創建目錄
│   ├── CN/                             ⚠️ 待創建目錄
│   ├── LG/                             ⚠️ 待創建目錄
│   ├── ST/                             ⚠️ 待創建目錄
│   │   └── LANG-ST-*.yaml              ⚠️ 待重命名/修改（47 個）
│   ├── TI/                             ⚠️ 待創建目錄
│   └── TR/                             ⚠️ 待創建目錄
└── gov/rules/
    └── GOV-*.yaml                      ⚠️ 待重命名/修改（7 個）
```

---

## 下一步建議

### 如果您選擇立即執行

1. **確認決策清單** (D1-D7)
2. **創建 Git 分支**: `git checkout -b feature/architecture-migration`
3. **開始 Phase 2**: 建立 CORE Domain
4. **逐步執行**: 按照遷移計劃執行

### 如果您選擇分階段執行（推薦）

1. **確認決策清單** (D1-D7)
2. **創建 Git 分支**
3. **執行 Phase 2**: 建立 CORE Domain
4. **評估結果**: 確認無誤後繼續下一階段

### 如果您選擇暫不執行

1. **保留當前狀態**: 已建立的基礎文檔可作為參考
2. **規劃執行時間**: 安排未來的執行時程
3. **持續使用現有架構**: 現有規則仍可正常使用

---

## 相關文檔

- **評估文檔**:
  - `TASK-2026031901.md` (已過時)
  - `TASK-2026031902.md` (評估版本)
  - `TASK-2026031903.md` (最終評估)

- **定義文檔**:
  - `DOMAIN_DEFINITIONS.md`
  - `RULE_ID_NAMING_CONVENTION.md`
  - `BEHAVIOR_CONSTRAINT_CATEGORY.md`

- **執行文檔**:
  - `MIGRATION_PLAN.md`

- **核心文檔**:
  - `Concept.md` (BRA 框架核心概念)
  - `RULE.md` (規則列表，待更新)
  - `RULE.zh-tw.md` (繁體中文版，待更新)

---

## 聯絡與支援

如有疑問或需要進一步討論，請參考：
- 詳細評估: `TASK-2026031903.md`
- 遷移計劃: `MIGRATION_PLAN.md`
- 概念文檔: `Concept.md`

---

**維護者**: AISDGR
**最後更新**: 2026-03-19
**版本**: 1.0.0
