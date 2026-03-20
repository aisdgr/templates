# CODE Domain

代碼域 - 定義 CORE 之外的代碼特定行為約束規則。

---

## 概述

CODE Domain 包含專門針對程式碼生成的行為約束規則。這些規則處理程式碼特定的關注點，如日誌記錄、結構變更和測試完整性，而通用規則（如製品隔離、邊界控制、可追溯性）則由 CORE Domain 提供。

**總規則數**: 20 條
- **Constraints (約束)**: 9 條
- **Policies (策略)**: 11 條

---

## 規則類別

### AR - Artifact Isolation (製品隔離)

| 規則 ID       | 類型 | 描述                         |
| ------------- | ---- | ---------------------------- |
| CODE-AR-C-003 | 約束 | 禁止修改屬於多個製品類型的製品 |

### LG - Logging & Report (日誌與報告)

| 規則 ID       | 類型 | 描述                             |
| ------------- | ---- | -------------------------------- |
| CODE-LG-C-001 | 約束 | 理由絕不能為空或純粹重複         |
| CODE-LG-C-002 | 約束 | 絕不能靜默忽略規則違規           |
| CODE-LG-P-001 | 策略 | 每次執行*必須*生成可定位的執行記錄 |
| CODE-LG-P-002 | 策略 | 執行��錄*必須*連結到相應的追溯 ID |
| CODE-LG-P-003 | 策略 | 每次執行*必須*包含理由說明       |
| CODE-LG-P-004 | 策略 | *必須*提供更改摘要               |
| CODE-LG-P-005 | 策略 | 更改摘要*必須*與實際代碼更改匹配 |
| CODE-LG-P-006 | 策略 | *必須*生成規則評估報告           |
| CODE-LG-P-007 | 策略 | 規則報告*必須*包含每個規則的評估結果 |

### ST - Structural Change (結構變更)

| 規則 ID       | 類型 | 描述                               |
| ------------- | ---- | ---------------------------------- |
| CODE-ST-C-001 | 約束 | 禁止未經授權的結構重構             |
| CODE-ST-C-002 | 約束 | 結構重構和邏輯更改絕不能同時發生   |
| CODE-ST-C-003 | 約束 | 除非明確允許，否則禁止引入新功能   |
| CODE-ST-C-004 | 約束 | 除非明確允許，否則禁止刪除現有行為 |
| CODE-ST-P-001 | 策略 | 結構重構的權限*必須*明確           |

### TI - Test Integrity (測試完整性)

| 規則 ID       | 類型 | 描述                           |
| ------------- | ---- | ------------------------------ |
| CODE-TI-C-001 | 約束 | 測試製品絕不能修改或影響生產代碼 |
| CODE-TI-C-002 | 約束 | 測試更改絕不能擴大驗證範圍     |
| CODE-TI-C-003 | 約束 | 測試絕不能重新定義預期行為     |
| CODE-TI-C-004 | 約束 | 測試絕不能從實現推斷需求或行為 |
| CODE-TI-P-001 | 策略 | 測試修改*必須*保留原始結構和意圖 |

---

## 遷移說明

### 從舊架構遷移

在 2026-03-19 的架構重構中，以下規則已從 CODE Domain 遷移至 CORE Domain：

| 舊 ID          | 新 ID           | 說明                     |
| -------------- | --------------- | ------------------------ |
| CODE-AR-C-01   | CORE-AR-C-001   | 禁止創建未聲明的製品類型 |
| CODE-AR-C-02   | CORE-AR-C-002   | 禁止修改未聲明的製品類型 |
| CODE-AR-P-01   | CORE-AR-P-001   | 創建權限定義             |
| CODE-AR-P-02   | CORE-AR-P-002   | 製品可尋址性             |
| CODE-BD-C-01   | CORE-BD-C-001   | 禁止越界修改             |
| CODE-BD-C-02   | CORE-BD-C-002   | 禁止越界存取             |
| CODE-BD-C-03   | CORE-BD-C-003   | 禁止未聲明依賴           |
| CODE-BD-P-01   | CORE-BD-P-001   | 邊界後停止               |
| CODE-BD-P-02   | CORE-BD-P-002   | 衝突時停止               |
| CODE-BD-P-03   | CORE-BD-P-003   | 無目標時停止             |
| CODE-CN-C-01   | CORE-CN-C-001   | 禁止推斷邊界             |
| CODE-CN-C-02   | CORE-CN-C-002   | 禁止推斷需求             |
| CODE-CN-C-03   | CORE-CN-C-003   | 禁止推斷驗證目標         |
| CODE-TR-C-01   | CORE-TR-C-001   | 禁止刪除追溯 ID          |
| CODE-TR-C-02   | CORE-TR-C-002   | 禁止孤立製品             |
| CODE-TR-P-01   | CORE-TR-P-001   | 追溯 ID 必須包含         |
| CODE-TR-P-02   | CORE-TR-P-002   | 追溯 ID 嵌入製品         |
| CODE-TR-P-03   | CORE-TR-P-003   | 單一追溯 ID              |

### 編號變更

保留在 CODE Domain 的 20 條規則已從 2 位數字編號更新為 3 位數字編號：

| 舊 ID          | 新 ID           |
| -------------- | --------------- |
| CODE-AR-C-03   | CODE-AR-C-003   |
| CODE-LG-C-01   | CODE-LG-C-001   |
| CODE-LG-C-02   | CODE-LG-C-002   |
| CODE-LG-P-01   | CODE-LG-P-001   |
| ...            | ...             |

詳細映射請參見 [RULE_ID_MIGRATION_MAP.md](../RULE_ID_MIGRATION_MAP.md)。

---

## 使用建議

### 與 CORE Domain 配合

CODE Domain 規則應與 CORE Domain 規則一起使用，以獲得完整的程式碼生成約束：

```yaml
# Application Ruleset 範例
includes:
  # CORE 規則（通用）
  - CORE-AR-*
  - CORE-BD-*
  - CORE-CN-*
  - CORE-TR-*

  # CODE 規則（程式碼特定）
  - CODE-LG-*
  - CODE-ST-*
  - CODE-TI-*
  - CODE-AR-C-003
```

### 語言特定場景

對於特定程式語言，應同時包含 LANG Domain 規則：

```yaml
# Go 語言程式碼生成
includes:
  - CORE-*
  - CODE-*
  - LANG-ST-GO-*
```

---

## 相關文檔

- [CORE Domain](../core/README.md) - 通用規則
- [LANG Domain](../lang/README.md) - 語言特定規則
- [Application Ruleset Examples](../APPLICATION_RULESET_EXAMPLES.md) - 應用規則集範例
- [Rule ID Migration Map](../RULE_ID_MIGRATION_MAP.md) - 完整遷移映射

---

**維護者**: AISDGR
**建立日期**: 2026-03-19
**最後更新**: 2026-03-19
**版本**: 2.0.0
