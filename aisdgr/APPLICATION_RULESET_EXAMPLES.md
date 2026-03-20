# Application Ruleset Examples

本文檔提供 Application Ruleset 的實際使用範例，展示如何組合 CORE、CODE、LANG、DOCS 和 GOV 規則。

---

## 什麼是 Application Ruleset？

Application Ruleset 是基於特定原則（如工作流、領域、風險等）組合的規則集合。透過 Application Ruleset，可以靈活地為不同場景組合所需的規則。

**關鍵特性**：
- **靈活組合**：一條規則可被多個 Application Ruleset 引用
- **基於原則**：可按工作流、領域、風險等任何原則組合
- **動態應用**：執行時可選擇應用一個或多個 Ruleset

---

## 範例 1: Go 語言程式碼生成

**場景**：生成符合 Go 語言規範的程式碼

**Application Ruleset 定義**:

```yaml
name: Go Code Generation
description: 適用於 Go 語言程式碼生成的規則集
version: 1.0.0
created_date: 2026-03-19

# 規則組合
includes:
  # 通用基礎規則
  - CORE-AR-*        # 製品隔離（通用）
  - CORE-BD-*        # 邊界控制（通用）
  - CORE-CN-*        # 約束中立性（通用）
  - CORE-TR-*        # 可追溯性（通用）

  # 程式碼特定規則
  - CODE-LG-*        # 日誌與報告
  - CODE-ST-*        # 結構變更
  - CODE-TI-*        # 測試完整性
  - CODE-AR-C-003    # 多製品類型修改（僅 CODE 特定）

  # Go 語言特定規則
  - LANG-ST-GO-*     # Go 語言編碼標準

  # 治理規則
  - GOV-ENF-*        # 執行機制

# 預期規則總數：約 56 條
expected_rule_count: 56

# 適用場景
use_cases:
  - Go 語言新專案開發
  - Go 語言程式碼重構
  - Go 語言 API 開發
  - Go 語言微服務開發
```

**實際包含的規則**:

```yaml
rules:
  # CORE (18 條)
  - CORE-AR-C-001    # 禁止創建未聲明的製品類型
  - CORE-AR-C-002    # 禁止修改未聲明的製品類型
  - CORE-AR-P-001    # 創建權限定義
  - CORE-AR-P-002    # 製品可尋址性
  - CORE-BD-C-001    # 禁止越界修改
  - CORE-BD-C-002    # 禁止越界存取
  - CORE-BD-C-003    # 禁止未聲明依賴
  - CORE-BD-P-001    # 邊界後停止
  - CORE-BD-P-002    # 衝突時停止
  - CORE-BD-P-003    # 無目標時停止
  - CORE-CN-C-001    # 禁止推斷邊界
  - CORE-CN-C-002    # 禁止推斷需求
  - CORE-CN-C-003    # 禁止推斷驗證目標
  - CORE-TR-C-001    # 禁止刪除追溯 ID
  - CORE-TR-C-002    # 禁止孤立製品
  - CORE-TR-P-001    # 追溯 ID 必須包含
  - CORE-TR-P-002    # 追溯 ID 嵌入製品
  - CORE-TR-P-003    # 單一追溯 ID

  # CODE (13 條)
  - CODE-AR-C-003    # 多製品類型修改
  - CODE-LG-C-001    # 理由不為空
  - CODE-LG-C-002    # 禁止靜默忽略
  - CODE-LG-P-001    # 生成執行日誌
  - CODE-LG-P-002    # 日誌連結追溯 ID
  - CODE-LG-P-003    # 包含理由說明
  - CODE-LG-P-004    # 提供變更摘要
  - CODE-LG-P-005    # 摘要匹配實際變更
  - CODE-LG-P-006    # 生成規則報告
  - CODE-LG-P-007    # 規則評估結果
  - CODE-ST-C-001    # 禁止未授權重構
  - CODE-ST-C-002    # 結構與邏輯分離
  - CODE-ST-C-003    # 禁止新功能
  - CODE-ST-C-004    # 禁止刪除行為
  - CODE-ST-P-001    # 重構權限明確
  - CODE-TI-C-001    # 測試不影響生產
  - CODE-TI-C-002    # 測試範圍控制
  - CODE-TI-C-003    # 測試不重新定義
  - CODE-TI-C-004    # 測試不推斷
  - CODE-TI-P-001    # 保留原始結構

  # LANG (7 條)
  - LANG-ST-GO-001   # Go 錯誤處理
  - LANG-ST-GO-002   # Go 控制流
  - LANG-ST-GO-003   # Go 並發
  - LANG-ST-GO-004   # Go 確定性
  - LANG-ST-GO-101   # Go 組合優先
  - LANG-ST-GO-102   # Go 接口最小
  - LANG-ST-GO-103   # Go 標識符

  # GOV (3 條)
  - GOV-ENF-C-001    # 程式碼標準遵守
  - GOV-ENF-C-002    # 違規報告生成
  - GOV-ENF-P-001    # 執行持續性
```

---

## 範例 2: Python 語言程式碼生成

**場景**：生成符合 Python 語言規範的程式碼

**Application Ruleset 定義**:

```yaml
name: Python Code Generation
description: 適用於 Python 語言程式碼生成的規則集
version: 1.0.0
created_date: 2026-03-19

includes:
  # 通用基礎規則（與 Go 相同）
  - CORE-AR-*
  - CORE-BD-*
  - CORE-CN-*
  - CORE-TR-*

  # 程式碼特定規則（與 Go 相同）
  - CODE-LG-*
  - CODE-ST-*
  - CODE-TI-*
  - CODE-AR-C-003

  # Python 語言特定規則
  - LANG-ST-PY-*     # Python 語言編碼標準

  # 治理規則（與 Go 相同）
  - GOV-ENF-*

expected_rule_count: 55
```

---

## 範例 3: API 文檔生成

**場景**：生成 API 文檔（如 OpenAPI 規範文檔）

**Application Ruleset 定義**:

```yaml
name: API Documentation Generation
description: 適用於 API 文檔生成的規則集
version: 1.0.0
created_date: 2026-03-19

includes:
  # 通用基礎規則
  - CORE-AR-*        # 製品隔離
  - CORE-BD-*        # 邊界控制
  - CORE-CN-*        # 約束中立性
  - CORE-TR-*        # 可追溯性

  # 文檔特定規則
  - DOCS-AR-*        # 文檔製品隔離
  - DOCS-BD-*        # 文檔邊界控制
  - DOCS-CN-*        # 文檔約束中立性
  - DOCS-ST-*        # 文檔結構變更（21 條）
  - DOCS-LG-*        # 文檔日誌與報告（新增）
  - DOCS-TI-*        # 文檔測試規範
  - DOCS-TR-*        # 文檔可追溯性

  # 治理規則
  - GOV-ENF-*        # 執行機制

expected_rule_count: 52

use_cases:
  - OpenAPI 規範文檔生成
  - API 使用手冊生成
  - API 變更日誌生成
```

---

## 範例 4: 完整的 Go 語言專案工作流

**場景**：完整的 Go 語言專案開發工作流（包含程式碼、文檔、測試）

**Application Ruleset 定義**:

```yaml
name: Complete Go Project Workflow
description: 完整的 Go 語言專案工作流規則集
version: 1.0.0
created_date: 2026-03-19

# 組合多個子 Ruleset
includes:
  # Go 程式碼生成
  - LANG-ST-GO-*     # Go 語言規則

  # 程式碼規則
  - CODE-LG-*
  - CODE-ST-*
  - CODE-TI-*
  - CODE-AR-C-003

  # 文檔規則
  - DOCS-ST-C-001    # 系統上下文描述
  - DOCS-ST-C-002    # 非功能性需求明確
  - DOCS-ST-C-003    # 外部接口聲明
  - DOCS-LG-*        # 文檔日誌

  # 通用規則
  - CORE-AR-*
  - CORE-BD-*
  - CORE-CN-*
  - CORE-TR-*

  # 治理規則
  - GOV-ENF-*
  - GOV-PR-*         # 包含治理原則

expected_rule_count: 75

use_cases:
  - Go 語言專案初始化
  - Go 語言全端開發
  - Go 語言微服務專案
```

---

## 範例 5: 安全關鍵型系統

**場景**：對安全性要求極高的系統（如金融、醫療）

**Application Ruleset 定義**:

```yaml
name: Safety-Critical System
description: 安全關鍵型系統的嚴格規則集
version: 1.0.0
created_date: 2026-03-19

includes:
  # 所有通用規則
  - CORE-AR-C-*      # 僅 Constraints（更嚴格）
  - CORE-BD-C-*      # 僅 Constraints
  - CORE-CN-C-*      # 僅 Constraints
  - CORE-TR-C-*      # 僅 Constraints
  - CORE-TR-P-*      # 包含追溯性 Policies

  # 程式碼規則（全部 Constraints）
  - CODE-LG-C-*
  - CODE-ST-C-*
  - CODE-TI-C-*
  - CODE-AR-C-003

  # 語言規則（選擇性）
  - LANG-ST-STD-001  # 確定性
  - LANG-ST-STD-002  # 控制流
  - LANG-ST-STD-004  # 敏感數據

  # 治理規則（全部）
  - GOV-ENF-*
  - GOV-PR-*

# 排除的規則（風險較高的 Policies）
excludes:
  - CORE-AR-P-*
  - CORE-BD-P-*
  # 排除可能允許繼續執行的 Policies

expected_rule_count: 35

use_cases:
  - 金融交易系統
  - 醫療設備軟體
  - 航空控制系統

note: |
  此 Ruleset 採用更保守的策略，主要包含 Constraints (MUST NOT)，
  排除可能允許風險行為的 Policies。
```

---

## 範例 6: 快速原型開發

**場景**：快速原型開發，允許較大的靈活性

**Application Ruleset 定義**:

```yaml
name: Rapid Prototyping
description: 快速原型開發的寬鬆規則集
version: 1.0.0
created_date: 2026-03-19

includes:
  # 最小通用規則集
  - CORE-BD-C-001    # 僅邊界控制（最核心）
  - CORE-TR-P-001    # 僅追溯 ID（最小化）

  # 最小程式碼規則
  - CODE-LG-P-001    # 僅執行日誌
  - CODE-ST-P-001    # 僅重構權限

  # 語言規則（可選）
  # 允許不使用語言特定規則

  # 治理規則（最小化）
  - GOV-PR-C-01      # 僅核心原則

expected_rule_count: 5

use_cases:
  - 概念驗證 (PoC)
  - 快速原型
  - 實驗性功能開發

note: |
  此 Ruleset 僅包含最核心的規則，允許快速迭代。
  不建議用於生產環境。
```

---

## Ruleset 組合最佳實踐

### 1. 按領域組合

```yaml
# 基礎層（通用）
base_rules:
  - CORE-AR-*
  - CORE-BD-*
  - CORE-CN-*
  - CORE-TR-*

# 領域層（選擇一個）
domain_rules:
  code:
    - CODE-LG-*
    - CODE-ST-*
    - CODE-TI-*
  docs:
    - DOCS-ST-*
    - DOCS-LG-*

# 語言層（選擇一個或多個）
language_rules:
  - LANG-ST-{LANG}-*

# 治理層（可選）
governance_rules:
  - GOV-ENF-*
  - GOV-PR-*
```

### 2. 按風險等級組合

```yaml
# 高風險（嚴格）
high_risk:
  constraints_only: true
  includes:
    - "*-C-*"        # 僅 Constraints

# 中風險（平衡）
medium_risk:
  includes:
    - "*-C-*"        # 所有 Constraints
    - "*-P-*"        # 部分 Policies

# 低風險（寬鬆）
low_risk:
  includes:
    - "CORE-*-P-*"   # 僅 Policies
```

### 3. 按工作流階段組合

```yaml
# 設計階段
design_phase:
  includes:
    - DOCS-ST-*
    - CORE-TR-*

# 開發階段
development_phase:
  includes:
    - CODE-ST-*
    - LANG-ST-{LANG}-*
    - CODE-LG-*

# 測試階段
testing_phase:
  includes:
    - CODE-TI-*
    - DOCS-TI-*

# 部署階段
deployment_phase:
  includes:
    - GOV-ENF-*
    - CORE-BD-*
```

---

## 驗證 Application Ruleset

### 檢查清單

創建 Application Ruleset 後，應驗證：

- [ ] 規則 ID 格式正確
- [ ] 規則存在（未引用不存在的規則）
- [ ] 規則數量合理（通常 20-80 條）
- [ ] 無衝突規則（避免同時包含互相矛盾的規則）
- [ ] 覆蓋關鍵領域（至少包含製品隔離、邊界控制、追溯性）
- [ ] 符合應用場景（規則集與使用場景匹配）

---

## 版本歷史

| 版本 | 日期       | 說明                     |
|------|-----------|--------------------------|
| 1.0.0| 2026-03-19| 初版，6 個範例           |

---

**維護者**: AISDGR
**建立日期**: 2026-03-19
**最後更新**: 2026-03-19
