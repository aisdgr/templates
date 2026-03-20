# LANG Domain

語言域 - 定義結構變更類別下特定程式語言的編碼標準。

---

## 概述

LANG Domain 包含針對特定程式語言的編碼標準規則。這些規則作為應用域維度，為不同程式語言提供語言特定的約束和最佳實踐。

**總規則數**: 47 條
- **Constraints (約束)**: 27 條
- **Policies (策略)**: 20 條

**架構特性**: LANG Domain 將程式語言視為應用域維度，所有規則均屬於 ST (Structural Change) 類別。

---

## 支援的語言

### GO - Go 語言 (7 條規則)

| 規則 ID          | 類型 | 描述                                      |
| ---------------- | ---- | ----------------------------------------- |
| LANG-ST-GO-001   | 約束 | Go 代碼*必須*使用多返回值顯式處理所有錯誤 |
| LANG-ST-GO-002   | 約束 | Go 控制流*必須*簡單且顯式，避免深度嵌套   |
| LANG-ST-GO-003   | 約束 | Go 並發*必須*具有顯式的所有權和生命周期管理 |
| LANG-ST-GO-004   | 約束 | Go 代碼*必須*表現出確定性行為並具有顯式副作用 |
| LANG-ST-GO-101   | 策略 | Go 代碼*應該*優先使用組合而非��承         |
| LANG-ST-GO-102   | 策略 | Go 接口*應該*是最小的並在使用點定義       |
| LANG-ST-GO-103   | 策略 | Go 標識符*應該*是意圖揭示的並具有清晰的包文檔 |

**關注點**:
- 錯誤處理（顯式錯誤檢查）
- 並發安全（goroutine 生命週期）
- 代碼簡潔性（避免深度嵌套）
- 組合優於繼承

### JV - Java 語言 (6 條規則)

| 規則 ID          | 類型 | 描述                                                 |
| ---------------- | ---- | ---------------------------------------------------- |
| LANG-ST-JV-001   | 約束 | Java 代碼*必須*使用顯式和適當的類型                  |
| LANG-ST-JV-002   | 約束 | Java 代碼*必須*使用 Optional 或顯式空值檢查顯式處理 null |
| LANG-ST-JV-101   | 策略 | Java 繼承*應該*在顯式理由和有限深度的情況下使用      |
| LANG-ST-JV-102   | 策略 | Java 已檢查異常*應該*謹慎使用並正確處理              |
| LANG-ST-JV-103   | 策略 | Java 代碼*應該*優先使用不可變數據結構以確保線程安全  |
| LANG-ST-JV-104   | 策略 | Java 標識符*應該*是意圖揭示的並具有清晰的文檔        |

**關注點**:
- 類型安全（顯式類型聲明）
- Null 安全（Optional 模式）
- 線程安全（不可變數據結構）
- 異常處理（合理使用已檢查異常）

### JS - JavaScript 語言 (7 條規則)

| 規則 ID          | 類型 | 描述                                                                |
| ---------------- | ---- | ------------------------------------------------------------------- |
| LANG-ST-JS-001   | 約束 | JavaScript 變量*必須*使用顯式範圍聲明 (`const`/`let`，而非 `var`)   |
| LANG-ST-JS-002   | 約束 | JavaScript 比較*必須*使用嚴格相等 (`===` 和 `!==`)                  |
| LANG-ST-JS-003   | 約束 | JavaScript 異步代碼*必須*使用顯式控制流（首選 `async`/`await`）     |
| LANG-ST-JS-004   | 約束 | JavaScript 錯誤*必須*使用特定的錯誤類型顯式處理                     |
| LANG-ST-JS-005   | 約束 | JavaScript 代碼絕不能引入隱式全局變量或使用動態代碼執行             |
| LANG-ST-JS-101   | 策略 | JavaScript 代碼*應該*優先使用不可變數據模式（`const`、`Object.freeze`） |
| LANG-ST-JS-102   | 策略 | JavaScript 標識符*應該*是意圖揭示的並具有 JSDoc 注釋                |

**關注點**:
- 範圍控制（避免 var）
- 類型比較（嚴格相等）
- 異步流程（async/await）
- 全局污染防護

### PY - Python 語言 (6 條規則)

| 規則 ID          | 類型 | 描述                                                  |
| ---------------- | ---- | ----------------------------------------------------- |
| LANG-ST-PY-001   | 約束 | Python 代碼*必須*優先考慮顯式性而非巧妙性或隱式特性   |
| LANG-ST-PY-002   | 約束 | Python 異常*必須*使用特定的異常類型顯式處理           |
| LANG-ST-PY-003   | 約束 | Python 核心邏輯*必須*是確定性的並具有顯式的隨機性控制 |
| LANG-ST-PY-101   | 策略 | Python 數據結構*應該*為公共 API 使用類型提示          |
| LANG-ST-PY-102   | 策略 | Python 代碼*應該*顯式驗證邊界輸入                     |
| LANG-ST-PY-103   | 策略 | Python 注釋和文檔字符串*應該*是意圖揭示的並與代碼一起維護 |

**關注點**:
- 顯式性（Python 之禪）
- 異常處理（特定異常類型）
- 類型提示（公共 API）
- 確定性（可重現行為）

### RS - Rust 語言 (7 條規則)

| 規則 ID          | 類型 | 描述                                                       |
| ---------------- | ---- | ---------------------------------------------------------- |
| LANG-ST-RS-001   | 約束 | Rust 代碼*必須*遵守所有權和借用規則並具有顯式的生命周期管理 |
| LANG-ST-RS-002   | 約束 | Rust 代碼絕不能默認使用 `unsafe` 塊；不安全代碼需要顯式理由 |
| LANG-ST-RS-003   | 約束 | Rust 代碼*必須*使用 `Result<T, E>` 和 `Option<T>` 顯式處理錯誤 |
| LANG-ST-RS-004   | 約束 | Rust 並發*必須*是確定性的並具有顯式同步原語                |
| LANG-ST-RS-101   | 策略 | Rust 代碼*應該*默認優先使用不可變性（不可變綁定）          |
| LANG-ST-RS-102   | 策略 | Rust 代碼*應該*具有顯式的生命周期注釋和清晰的 API 契約     |
| LANG-ST-RS-103   | 策略 | Rust 標識符*應該*是意圖揭示的並具有文檔注釋                |

**關注點**:
- 所有權系統（借用檢查器）
- 錯誤處理（Result/Option）
- 內存安全（最小化 unsafe）
- 並發安全（顯式同步）

### STD - 標準（語言無關）(7 條規則)

| 規則 ID          | 類型 | 描述                                     |
| ---------------- | ---- | ---------------------------------------- |
| LANG-ST-STD-001  | 約束 | 代碼*必須*表現出確定性和可重現的行為     |
| LANG-ST-STD-002  | 約束 | 代碼*必須*具有顯式的控制流和狀態管理     |
| LANG-ST-STD-003  | 約束 | 代碼絕不能引入隱藏的外部依賴             |
| LANG-ST-STD-004  | 約束 | 代碼*必須*安全地處理敏感數據並提供顯式保護 |
| LANG-ST-STD-005  | 約束 | AI 行為*必須*顯式限制在聲明的範圍和約束內 |
| LANG-ST-STD-101  | 策略 | 代碼結構*應該*是意圖揭示和自文檔化的     |
| LANG-ST-STD-102  | 策略 | 代碼*應該*在最早的可能點驗證邊界並使錯誤可見 |

**關注點**:
- 確定性（可重現行為）
- 顯式控制流（避免魔術）
- 安全性（敏感數據處理）
- 自文檔化（清晰意圖）

### TS - TypeScript 語言 (7 條規則)

| 規則 ID          | 類型 | 描述                                                          |
| ---------------- | ---- | ------------------------------------------------------------- |
| LANG-ST-TS-001   | 約束 | TypeScript 項目*必須*啟用嚴格類型檢查 (`strict: true`)        |
| LANG-ST-TS-002   | 約束 | TypeScript 公共 API *必須*為所有參數和返回值提供顯式類型注釋  |
| LANG-ST-TS-003   | 約束 | TypeScript 代碼絕不能在沒有運行時驗證的情況下使用不安全的類型斷言 |
| LANG-ST-TS-004   | 約束 | TypeScript 代碼*必須*顯式處理 `null` 和 `undefined`           |
| LANG-ST-TS-101   | 策略 | TypeScript 代碼*應該*根據用例適當地使用接口和類型別名         |
| LANG-ST-TS-102   | 策略 | TypeScript 異步接口*應該*是類型安全的並具有顯式錯誤類型       |
| LANG-ST-TS-103   | 策略 | TypeScript 標識符*應該*是意圖揭示的並具有 TSDoc 注釋          |

**關注點**:
- 嚴格類型檢查（strict mode）
- 類型安全（避免 any 和不安全斷言）
- Null 安全（顯式處理 null/undefined）
- 類型設計（接口 vs 類型別名）

---

## 架構重構

### ID 格式變更

在 2026-03-19 的架構重構中，LANG Domain 經歷了最大幅度的重構：

**舊格式**: `LANG-{LANGUAGE}-{TYPE}-{NUMBER}`
- 例: `LANG-GO-C-01`, `LANG-JAVA-P-04`

**新格式**: `LANG-ST-{LANGUAGE}-{NUMBER}`
- 例: `LANG-ST-GO-001`, `LANG-ST-JV-104`

### 語言代碼標準化

| 舊代碼 | 新代碼 | 語言       |
| ------ | ------ | ---------- |
| GO     | GO     | Go         |
| JAVA   | JV     | Java       |
| JS     | JS     | JavaScript |
| PY     | PY     | Python     |
| RS     | RS     | Rust       |
| STD    | STD    | Standard   |
| TS     | TS     | TypeScript |

### 編號規則

- **001-099**: Constraints (約束)
- **100-199**: Policies (策略)

詳細映射請參見 [RULE_ID_MIGRATION_MAP.md](../RULE_ID_MIGRATION_MAP.md)。

---

## 使用建議

### 單一語言場景

```yaml
# Go 語言程式碼生成
includes:
  # CORE 規則（通用）
  - CORE-*

  # CODE 規則（程式碼特定）
  - CODE-*

  # Go 語言規則
  - LANG-ST-GO-*
```

### 多語言場景

```yaml
# 全端專案（TypeScript + Python）
includes:
  - CORE-*
  - CODE-*
  - LANG-ST-TS-*  # 前端 TypeScript
  - LANG-ST-PY-*  # 後端 Python
```

### 跨語言標準

```yaml
# 強調通用標準
includes:
  - CORE-*
  - CODE-*
  - LANG-ST-STD-*  # 語言無關的標準規則
```

---

## 目錄結構

```
lang/
├── ST/                    # Structural Change 類別
│   ├── LANG-ST-GO-001.yaml
│   ├── LANG-ST-GO-002.yaml
│   ├── ...
│   ├── LANG-ST-JV-001.yaml
│   ├── LANG-ST-JS-001.yaml
│   ├── LANG-ST-PY-001.yaml
│   ├── LANG-ST-RS-001.yaml
│   ├── LANG-ST-STD-001.yaml
│   └── LANG-ST-TS-001.yaml
└── REFACTORING_SUMMARY.md  # 重構摘要文檔
```

---

## 規則統計

| 語言       | 約束 | 策略 | 總計 |
| ---------- | ---- | ---- | ---- |
| Go         | 4    | 3    | 7    |
| Java       | 2    | 4    | 6    |
| JavaScript | 5    | 2    | 7    |
| Python     | 3    | 3    | 6    |
| Rust       | 4    | 3    | 7    |
| Standard   | 5    | 2    | 7    |
| TypeScript | 4    | 3    | 7    |
| **總計**   | **27** | **20** | **47** |

---

## 相關文檔

- [CORE Domain](../core/README.md) - 通用規則
- [CODE Domain](../code/README.md) - 程式碼特定規則
- [Application Ruleset Examples](../APPLICATION_RULESET_EXAMPLES.md) - 應用規則集範例
- [Rule ID Migration Map](../RULE_ID_MIGRATION_MAP.md) - 完整遷移映射
- [REFACTORING_SUMMARY.md](./rules/ST/REFACTORING_SUMMARY.md) - LANG Domain 重構摘要

---

**維護者**: AISDGR
**建立日期**: 2026-03-19
**最後更新**: 2026-03-19
**版本**: 2.0.0
