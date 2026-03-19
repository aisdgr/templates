# GOV Domain

治理域 - 定義 AI 輔助開發的治理原則和執行機制。

---

## 概述

GOV Domain 包含治理和執行相關的規則，確保 AI 行為受到適當的監督和控制。這些規則定義了 AI 的角色定位、治理原則和違規處理機制。

**總規則數**: 7 條
- **Constraints (約束)**: 5 條
- **Policies (策略)**: 2 條

**架構特性**: GOV Domain 使用特殊的類別（ENF、PR），而非標準的行為約束類別。

---

## 規則類別

### ENF - Enforcement (執行)

| 規則 ID         | 類型 | 描述                                                          |
| --------------- | ---- | ------------------------------------------------------------- |
| GOV-ENF-C-001   | 約束 | 所有 AI 生成的代碼*必須*遵守核心和語言特定的編碼標準          |
| GOV-ENF-C-002   | 約束 | 檢測到的違規*必須*生成代碼驗證報告（CVR），絕不能自動修復     |
| GOV-ENF-P-001   | 策略 | AI 執行*可以*在存在違規的情況下繼續，但違規*必須*保持可見和可追蹤 |

**關注點**:
- **標準遵守**: 確保 AI 生成的代碼符合編碼標準
- **違規報告**: 生成 Code Validation Report (CVR)
- **可見性**: 違規必須保持可見，不能自動修復

**Code Validation Report (CVR)**:
- 記錄所有檢測到的違規
- 包含違規的詳細信息（規則 ID、位置、描述）
- 提供修復建議
- 保持追溯性

### PR - Principles (原則)

| 規則 ID         | 類型 | 描述                            |
| --------------- | ---- | ------------------------------- |
| GOV-PR-C-001    | 約束 | AI 是受約束的執行者，而非自主設計者 |
| GOV-PR-C-002    | 約束 | 所有 AI 行為*必須*受到顯式治理   |
| GOV-PR-C-003    | 約束 | 違規*必須*顯式浮出              |
| GOV-PR-P-001    | 策略 | 有效性和正確性是不同的職責      |

**核心原則**:

1. **受約束的執行者** (GOV-PR-C-001)
   - AI 不是自主決策者
   - AI 在人類定義的約束內執行
   - 所有決策需有人類問責

2. **顯式治理** (GOV-PR-C-002)
   - 所有 AI 行為必須有明確的治理規則
   - 不允許隱式或默認行為
   - 治理規則必須可追溯

3. **違規可見性** (GOV-PR-C-003)
   - 違規不能被隱藏或忽略
   - 必須生成明確的違規報告
   - 違規必須傳遞給人類審查

4. **職責分離** (GOV-PR-P-001)
   - 有效性（是否滿足需求）≠ 正確性（是否符合標準）
   - AI 負責正確性（遵守規則）
   - 人類負責有效性（驗證需求）

---

## 編號變更

所有 GOV 規則已從 2 位數字編號更新為 3 位數字編號：

| 舊 ID          | 新 ID           |
| -------------- | --------------- |
| GOV-ENF-C-01   | GOV-ENF-C-001   |
| GOV-ENF-C-02   | GOV-ENF-C-002   |
| GOV-ENF-P-01   | GOV-ENF-P-001   |
| GOV-PR-C-01    | GOV-PR-C-001    |
| GOV-PR-C-02    | GOV-PR-C-002    |
| GOV-PR-C-03    | GOV-PR-C-003    |
| GOV-PR-P-01    | GOV-PR-P-001    |

詳細映射請參見 [RULE_ID_MIGRATION_MAP.md](../RULE_ID_MIGRATION_MAP.md)。

---

## 治理框架

### 三層治理模型

```
┌─────────────────────────────────────┐
│    Principle Layer (PR)            │
│    - 角色定位                       │
│    - 治理原則                       │
│    - 職責分離                       │
└─────────────────────────────────────┘
                 ↓
┌─────────────────────────────────────┐
│    Enforcement Layer (ENF)         │
│    - 標準執行                       │
│    - 違規檢測                       │
│    - 報告生成                       │
└─────────────────────────────────────┘
                 ↓
┌─────────────────────────────────────┐
│    Operation Layer (CORE/CODE/...) │
│    - 實際行為約束                   │
│    - 規則評估                       │
│    - 製品生成                       │
└─────────────────────────────────────┘
```

### 治理流程

1. **定義治理原則** (PR)
   - 確定 AI 角色和職責
   - 定義治理邊界
   - 建立問責機制

2. **執行治理** (ENF)
   - 監控 AI 行為
   - 檢測違規
   - 生成報告

3. **應用行為約束** (CORE/CODE/DOCS/LANG)
   - 評估規則
   - 約束 AI 行為
   - 生成製品

4. **人類審查**
   - 審查違規報告
   - 決定是否接受或拒絕
   - 更新治理規則

---

## 使用建議

### 基礎治理配置

```yaml
# 最小治理配置
includes:
  - GOV-PR-C-001    # AI 角色定位
  - GOV-PR-C-002    # 顯式治理
  - GOV-ENF-C-001   # 標準遵守
```

### 完整治理配置

```yaml
# 完整治理配置
includes:
  # 治理原則
  - GOV-PR-*        # 所有治理原則

  # 執行機制
  - GOV-ENF-*       # 所有執行規則

  # 行為約束
  - CORE-*
  - CODE-*
  - LANG-ST-{LANG}-*
```

### 嚴格治理配置

```yaml
# 嚴格治理（高風險場景）
includes:
  # 僅 Constraints（更嚴格）
  - GOV-PR-C-*
  - GOV-ENF-C-*

  # 僅核心約束
  - CORE-*-C-*
  - CODE-*-C-*

  # 語言特定約束
  - LANG-ST-{LANG}-001  # 確定性
  - LANG-ST-{LANG}-002  # 控制流
  - LANG-ST-{LANG}-004  # 敏感數據
```

---

## 違規處理

### 違規生命週期

```
違規檢測 → 報告生成 → 人類審查 → 決策 → 執行
```

1. **違規檢測**: GOV-ENF-C-001 規則評估
2. **報告生成**: GOV-ENF-C-002 生成 CVR
3. **人類審查**: 人類審查 CVR
4. **決策**: 接受、拒絕或修改
5. **執行**: 根據決策採取行動

### CVR (Code Validation Report) 結構

```yaml
report:
  id: CVR-20260319-001
  timestamp: 2026-03-19T10:30:00Z
  violations:
    - rule_id: CORE-AR-C-001
      severity: major
      location: src/api/handler.go:45
      description: 創建了未聲明的製品類型 "CacheManager"
      recommendation: 在製品清單中聲明 "CacheManager" 類型
    - rule_id: LANG-ST-GO-001
      severity: minor
      location: src/db/connection.go:23
      description: 未處理錯誤返回值
      recommendation: 使用 if err != nil 檢查錯誤
  summary:
    total: 2
    major: 1
    minor: 1
    critical: 0
```

---

## 與其他 Domain 的關係

### GOV 作為元規則

GOV Domain 規則是「元規則」，它們約束其他規則的應用：

```
GOV (治理)
 ├── 約束 → CORE (通用行為)
 ├── 約束 → CODE (程式碼行為)
 ├── 約束 → DOCS (文檔行為)
 └── 約束 → LANG (語言行為)
```

### 治理層級

1. **最頂層**: GOV-PR (治理原則)
   - 定義 AI 的角色和職責

2. **第二層**: GOV-ENF (執行機制)
   - 確保其他規則被遵守

3. **第三層**: CORE/CODE/DOCS/LANG
   - 定義具體的行為約束

---

## 常見場景

### 場景 1: 違規檢測與報告

**情境**: AI 生成的代碼違反了 CORE-AR-C-001

**處理流程**:
1. GOV-ENF-C-001 檢測到違規
2. GOV-ENF-C-002 生成 CVR
3. GOV-ENF-P-001 允許繼續執行（但違規可見）
4. 人類審查 CVR
5. 人類決定是否接受

### 場景 2: 嚴格治理模式

**情境**: 金融系統開發（高風險）

**配置**:
```yaml
includes:
  - GOV-PR-C-*      # 僅約束
  - GOV-ENF-C-*     # 僅約束
  - CORE-*-C-*      # 僅約束
  - CODE-*-C-*      # 僅約束
excludes:
  - GOV-ENF-P-001   # 排除「允許繼續執行」的策略
```

**效果**: 任何違規都會立即停止執行

### 場景 3: 開發原型模式

**情境**: 快速原型開發（低風險）

**配置**:
```yaml
includes:
  - GOV-PR-C-001    # 僅核心原則
  - GOV-ENF-C-002   # 僅報告生成
```

**效果**: 允許較大靈活性，但仍保留可見性

---

## 相關文檔

- [CORE Domain](../core/README.md) - 通用規則
- [CODE Domain](../code/README.md) - 程式碼特定規則
- [Application Ruleset Examples](../APPLICATION_RULESET_EXAMPLES.md) - 應用規則集範例
- [Rule ID Migration Map](../RULE_ID_MIGRATION_MAP.md) - 完整遷移映射

---

**維護者**: AISDGR
**建立日期**: 2026-03-19
**最後更新**: 2026-03-19
**版本**: 2.0.0
