# Rule ID Migration Map

本文檔記錄所有規則從舊 ID 到新 ID 的遷移映射。

**遷移日期**: 2026-03-19
**總計**: 126 條規則

---

## 遷移概覽

| Domain | 舊格式 | 新格式 | 變更數 | 狀態 |
|--------|--------|--------|--------|------|
| CORE   | N/A    | CORE-{CAT}-{TYPE}-{NUM} | 18 | 新建 |
| CODE   | CODE-{CAT}-{TYPE}-{NUM} (2位) | CODE-{CAT}-{TYPE}-{NUM} (3位) | 38 | 重新編號 + 18 條移至 CORE |
| DOCS   | DOCS-{CAT}-{TYPE}-{NUM} (2位) | DOCS-{CAT}-{TYPE}-{NUM} (3位) | 37 | 重新編號 + 3 條新增 |
| LANG   | LANG-{LANG}-{TYPE}-{NUM} | LANG-ST-{LANG}-{NUM} | 47 | 結構重構 |
| GOV    | GOV-{CAT}-{TYPE}-{NUM} (2位) | GOV-{CAT}-{TYPE}-{NUM} (3位) | 7 | 重新編號 |

---

## CORE Domain (新建)

CORE Domain 為新建的通用規則域，包含從 CODE Domain 遷移的通用規則。

| 原 ID          | 新 ID           | 說明                     | 狀態 |
|----------------|-----------------|--------------------------|------|
| CODE-AR-C-01   | CORE-AR-C-001   | 禁止創建未聲明的製品類型 | Moved |
| CODE-AR-C-02   | CORE-AR-C-002   | 禁止修改未聲明的製品類型 | Moved |
| CODE-AR-P-01   | CORE-AR-P-001   | 創建權限定義             | Moved |
| CODE-AR-P-02   | CORE-AR-P-002   | 製品可尋址性             | Moved |
| CODE-BD-C-01   | CORE-BD-C-001   | 禁止越界修改             | Moved |
| CODE-BD-C-02   | CORE-BD-C-002   | 禁止越界存取             | Moved |
| CODE-BD-C-03   | CORE-BD-C-003   | 禁止未聲明依賴           | Moved |
| CODE-BD-P-01   | CORE-BD-P-001   | 邊界後停止               | Moved |
| CODE-BD-P-02   | CORE-BD-P-002   | 衝突時停止               | Moved |
| CODE-BD-P-03   | CORE-BD-P-003   | 無目標時停止             | Moved |
| CODE-CN-C-01   | CORE-CN-C-001   | 禁止推斷邊界             | Moved |
| CODE-CN-C-02   | CORE-CN-C-002   | 禁止推斷需求             | Moved |
| CODE-CN-C-03   | CORE-CN-C-003   | 禁止推斷驗證目標         | Moved |
| CODE-TR-C-01   | CORE-TR-C-001   | 禁止刪除追溯 ID          | Moved |
| CODE-TR-C-02   | CORE-TR-C-002   | 禁止孤立製品             | Moved |
| CODE-TR-P-01   | CORE-TR-P-001   | 追溯 ID 必須包含         | Moved |
| CODE-TR-P-02   | CORE-TR-P-002   | 追溯 ID 嵌入製品         | Moved |
| CODE-TR-P-03   | CORE-TR-P-003   | 單一追溯 ID              | Moved |

---

## CODE Domain (重新編號 + 遷移)

### 已移至 CORE (18 條)

見上表。

### 保留在 CODE (20 條)

| 舊 ID          | 新 ID           | 說明             | 狀態        |
|----------------|-----------------|------------------|-------------|
| CODE-AR-C-03   | CODE-AR-C-003   | 多製品類型修改   | Renumbered  |
| CODE-LG-C-01   | CODE-LG-C-001   | 理由不為空       | Renumbered  |
| CODE-LG-C-02   | CODE-LG-C-002   | 禁止靜默忽略     | Renumbered  |
| CODE-LG-P-01   | CODE-LG-P-001   | 生成執行日誌     | Renumbered  |
| CODE-LG-P-02   | CODE-LG-P-002   | 日誌連結追溯 ID  | Renumbered  |
| CODE-LG-P-03   | CODE-LG-P-003   | 包含理由說明     | Renumbered  |
| CODE-LG-P-04   | CODE-LG-P-004   | 提供變更摘要     | Renumbered  |
| CODE-LG-P-05   | CODE-LG-P-005   | 摘要匹配實際變更 | Renumbered  |
| CODE-LG-P-06   | CODE-LG-P-006   | 生成規則報告     | Renumbered  |
| CODE-LG-P-07   | CODE-LG-P-007   | 規則評估結果     | Renumbered  |
| CODE-ST-C-01   | CODE-ST-C-001   | 禁止未授權重構   | Renumbered  |
| CODE-ST-C-02   | CODE-ST-C-002   | 結構與邏輯分離   | Renumbered  |
| CODE-ST-C-03   | CODE-ST-C-003   | 禁止新功能       | Renumbered  |
| CODE-ST-C-04   | CODE-ST-C-004   | 禁止刪除行為     | Renumbered  |
| CODE-ST-P-01   | CODE-ST-P-001   | 重構權限明確     | Renumbered  |
| CODE-TI-C-01   | CODE-TI-C-001   | 測試不影響生產   | Renumbered  |
| CODE-TI-C-02   | CODE-TI-C-002   | 測試範圍控制     | Renumbered  |
| CODE-TI-C-03   | CODE-TI-C-003   | 測試不重新定義   | Renumbered  |
| CODE-TI-C-04   | CODE-TI-C-004   | 測試不推斷       | Renumbered  |
| CODE-TI-P-01   | CODE-TI-P-001   | 保留原始結構     | Renumbered  |

---

## DOCS Domain (重新編號 + 新增)

### 新增規則 (3 條)

| 舊 ID | 新 ID           | 說明             | 狀態   |
|-------|-----------------|------------------|--------|
| N/A   | DOCS-LG-P-001   | 文檔執行日誌     | New    |
| N/A   | DOCS-LG-P-002   | 日誌追溯 ID      | New    |
| N/A   | DOCS-LG-P-003   | 理由說明         | New    |

### 重新編號 (34 條)

| 舊 ID          | 新 ID           | 狀態       |
|----------------|-----------------|------------|
| DOCS-AR-C-01   | DOCS-AR-C-001   | Renumbered |
| DOCS-AR-C-02   | DOCS-AR-C-002   | Renumbered |
| DOCS-AR-C-03   | DOCS-AR-C-003   | Renumbered |
| DOCS-AR-C-04   | DOCS-AR-C-004   | Renumbered |
| DOCS-BD-C-01   | DOCS-BD-C-001   | Renumbered |
| DOCS-BD-C-02   | DOCS-BD-C-002   | Renumbered |
| DOCS-BD-P-01   | DOCS-BD-P-001   | Renumbered |
| DOCS-BD-P-02   | DOCS-BD-P-002   | Renumbered |
| DOCS-CN-C-01   | DOCS-CN-C-001   | Renumbered |
| DOCS-ST-C-01~21| DOCS-ST-C-001~021| Renumbered |
| DOCS-ST-P-01   | DOCS-ST-P-001   | Renumbered |
| DOCS-ST-P-02   | DOCS-ST-P-002   | Renumbered |
| DOCS-TI-P-01   | DOCS-TI-P-001   | Renumbered |
| DOCS-TR-P-01   | DOCS-TR-P-001   | Renumbered |

---

## LANG Domain (結構重構)

LANG Domain 經歷了最大幅度的重構，所有規則移動到 ST (Structural Change) 類別。

### Go 語言規則 (7 條)

| 舊 ID          | 新 ID           | 說明             |
|----------------|-----------------|------------------|
| LANG-GO-C-01   | LANG-ST-GO-001  | 錯誤處理         |
| LANG-GO-C-02   | LANG-ST-GO-002  | 控制流           |
| LANG-GO-C-03   | LANG-ST-GO-003  | 並發             |
| LANG-GO-C-04   | LANG-ST-GO-004  | 確定性           |
| LANG-GO-P-01   | LANG-ST-GO-101  | 組合優先         |
| LANG-GO-P-02   | LANG-ST-GO-102  | 接口最小         |
| LANG-GO-P-03   | LANG-ST-GO-103  | 標識符           |

### Java 語言規則 (7 條)

| 舊 ID          | 新 ID           | 說明             |
|----------------|-----------------|------------------|
| LANG-JAVA-C-01 | LANG-ST-JV-001  | 類型             |
| LANG-JAVA-C-02 | LANG-ST-JV-002  | null 處理        |
| LANG-JAVA-P-01 | LANG-ST-JV-101  | 繼承             |
| LANG-JAVA-P-02 | LANG-ST-JV-102  | 異常             |
| LANG-JAVA-P-03 | LANG-ST-JV-103  | 不可變           |
| LANG-JAVA-P-04 | LANG-ST-JV-104  | 標識符           |

### JavaScript 規則 (7 條)

| 舊 ID          | 新 ID           | 說明             |
|----------------|-----------------|------------------|
| LANG-JS-C-01   | LANG-ST-JS-001  | 變量聲明         |
| LANG-JS-C-02   | LANG-ST-JS-002  | 嚴格相等         |
| LANG-JS-C-03   | LANG-ST-JS-003  | 異步             |
| LANG-JS-C-04   | LANG-ST-JS-004  | 錯誤處理         |
| LANG-JS-C-05   | LANG-ST-JS-005  | 全局變量         |
| LANG-JS-P-01   | LANG-ST-JS-101  | 不可變           |
| LANG-JS-P-02   | LANG-ST-JS-102  | JSDoc            |

### Python 規則 (6 條)

| 舊 ID          | 新 ID           | 說明             |
|----------------|-----------------|------------------|
| LANG-PY-C-01   | LANG-ST-PY-001  | 顯式性           |
| LANG-PY-C-02   | LANG-ST-PY-002  | 異常             |
| LANG-PY-C-03   | LANG-ST-PY-003  | 確定性           |
| LANG-PY-P-01   | LANG-ST-PY-101  | 類型提示         |
| LANG-PY-P-02   | LANG-ST-PY-102  | 邊界驗證         |
| LANG-PY-P-03   | LANG-ST-PY-103  | 文檔字符串       |

### Rust 規則 (7 條)

| 舊 ID          | 新 ID           | 說明             |
|----------------|-----------------|------------------|
| LANG-RS-C-01   | LANG-ST-RS-001  | 所有權           |
| LANG-RS-C-02   | LANG-ST-RS-002  | unsafe           |
| LANG-RS-C-03   | LANG-ST-RS-003  | 錯誤處理         |
| LANG-RS-C-04   | LANG-ST-RS-004  | 並發             |
| LANG-RS-P-01   | LANG-ST-RS-101  | 不可變           |
| LANG-RS-P-02   | LANG-ST-RS-102  | 生命周期         |
| LANG-RS-P-03   | LANG-ST-RS-103  | 文檔註釋         |

### 標準規則 (7 條)

| 舊 ID          | 新 ID           | 說明             |
|----------------|-----------------|------------------|
| LANG-STD-C-01  | LANG-ST-STD-001 | 確定性           |
| LANG-STD-C-02  | LANG-ST-STD-002 | 控制流           |
| LANG-STD-C-03  | LANG-ST-STD-003 | 外部依賴         |
| LANG-STD-C-04  | LANG-ST-STD-004 | 敏感數據         |
| LANG-STD-C-05  | LANG-ST-STD-005 | AI 行為          |
| LANG-STD-P-01  | LANG-ST-STD-101 | 自文檔化         |
| LANG-STD-P-02  | LANG-ST-STD-102 | 邊界驗證         |

### TypeScript 規則 (6 條)

| 舊 ID          | 新 ID           | 說明             |
|----------------|-----------------|------------------|
| LANG-TS-C-01   | LANG-ST-TS-001  | 嚴格類型         |
| LANG-TS-C-02   | LANG-ST-TS-002  | 類型註釋         |
| LANG-TS-C-03   | LANG-ST-TS-003  | 類型斷言         |
| LANG-TS-C-04   | LANG-ST-TS-004  | null 處理        |
| LANG-TS-P-01   | LANG-ST-TS-101  | 接口/類型        |
| LANG-TS-P-02   | LANG-ST-TS-102  | 異步接口         |
| LANG-TS-P-03   | LANG-ST-TS-103  | TSDoc            |

---

## GOV Domain (重新編號)

| 舊 ID          | 新 ID           | 狀態       |
|----------------|-----------------|------------|
| GOV-ENF-C-01   | GOV-ENF-C-001   | Renumbered |
| GOV-ENF-C-02   | GOV-ENF-C-002   | Renumbered |
| GOV-ENF-P-01   | GOV-ENF-P-001   | Renumbered |
| GOV-PR-C-01    | GOV-PR-C-001    | Renumbered |
| GOV-PR-C-02    | GOV-PR-C-002    | Renumbered |
| GOV-PR-C-03    | GOV-PR-C-003    | Renumbered |
| GOV-PR-P-01    | GOV-PR-P-001    | Renumbered |

---

## 遷移統計

### 按變更類型

| 變更類型       | 數量  | 百分比 |
|----------------|-------|--------|
| 新建 (CORE)    | 18    | 14.3%  |
| 新增 (DOCS-LG) | 3     | 2.4%   |
| 移動 (CODE→CORE) | 18  | 14.3%  |
| 重新編號       | 40    | 31.7%  |
| 結構重構 (LANG) | 47   | 37.3%  |
| **總計**       | **126** | **100%** |

### 按 Domain

| Domain | 變更數 | 說明                           |
|--------|--------|--------------------------------|
| CORE   | 18     | 全部為從 CODE 遷移             |
| CODE   | 38     | 18 條移至 CORE，20 條重新編號  |
| DOCS   | 37     | 3 條新增，34 條重新編號        |
| LANG   | 47     | 全部重新結構化                 |
| GOV    | 7      | 全部重新編號                   |

---

## 向後兼容性

### 已廢棄的規則 ID

以下 ID 已標記為 `status: superseded`，但仍保留��原檔案中：

- CODE-AR-C-01/02, CODE-AR-P-01/02
- CODE-BD-C-01/02/03, CODE-BD-P-01/02/03
- CODE-CN-C-01/02/03
- CODE-TR-C-01/02, CODE-TR-P-01/02/03

這些規則的檔案包含 `superseded_by` 欄位指向新的 CORE 規則。

### 別名支援

建議在實作中支援舊 ID 作為別名，以平滑過渡：

```yaml
# 範例：支援舊 ID 作為別名
rule:
  id: CORE-AR-C-001
  aliases:
    - CODE-AR-C-01
```

---

## 遷移建議

### 對於工具開發者

1. **更新 Rule ID 解析邏輯**：
   - 支援新的 3 位數字格式
   - 支援 LANG 的新結構 `LANG-ST-{LANG}-{NUM}`

2. **支援別名**：
   - 建議支援舊 ID 作為別名至少 6 個月
   - 在查詢時自動將舊 ID 映射到新 ID

3. **更新驗證規則**：
   - Rule ID 格式驗證需更新
   - DOMAIN-CATEGORY-SUBTYPE 組合驗證

### 對於規則使用者

1. **更新引用**：
   - 將所有舊 ID 引用更新為新 ID
   - 優先使用 CORE 規則而非 CODE 規則

2. **更新 Application Ruleset**：
   - 重新組合 Ruleset 以包含 CORE 規則
   - 更新 LANG 規則引用

3. **測試驗證**：
   - 確保所有規則引用正確
   - 驗證 Application Ruleset 組合正確

---

## 版本歷史

| 版本 | 日期       | 說明                     |
|------|-----------|--------------------------|
| 1.0.0| 2026-03-19| 初版，完整遷移映射       |

---

**維護者**: AISDGR
**建立日期**: 2026-03-19
**最後更新**: 2026-03-19
