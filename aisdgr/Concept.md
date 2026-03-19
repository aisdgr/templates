# Concept

## 1. 整體概念鏈（Refined Architecture Chain）

```
================================================================================
                      Behavior Rule Architecture (BRA)
             AI Execution Behavior Constraint Engineering Framework
================================================================================

┌──────────────────────────────────────────────────────────────────────────────┐
│                       1. Rule Language Layer                                 │
│                (Input Abstraction & Normative Constraint)                    │
├──────────────────────────────────────────────────────────────────────────────┤
│   NNL  ──────────────────────────────►  RNL                                  │
│   Normative Natural Language             Rule Normative Language             │
│   • Prompt Optimization                  • Behavior Rule Expression          │
│   • Human-readable intent                • MUST / MUST NOT normative rules   │
│   • Non-enforceable                      • Enforceable behavior constraints  │
└──────────────────────────────────────────────────────────────────────────────┘
                                      ↓
                                      │
┌──────────────────────────────────────────────────────────────────────────────┐
│                       2. Rule Architecture Layer                             │
│                     (Structured Rule Definition)                             │
├──────────────────────────────────────────────────────────────────────────────┤
|   Behavior Category ───────────────────► Rule                                │
│   • AI Behavior Classification           • Structured Governance Artifact    │
│   • 先定義決策行為類別，再衍生對應規則      • RNL + Governance Metadata         │
└──────────────────────────────────────────────────────────────────────────────┘
                                      ↓
                                      │
┌──────────────────────────────────────────────────────────────────────────────┐
│                      3. Governance Asset Layer                               │
│                 (Reusable Shared Rule Repository)                            │
├──────────────────────────────────────────────────────────────────────────────┤
│                         Rule Library                                         │
│          (Cross-industry / Cross-enterprise / Cross-project Repository)      │
│                                                                              │
│  Ruleset  =  Pure Rule Collection                                            │
│                                                                              │
│  • Category Ruleset : 基於相同 Decision Behavior 的所有 Rule 集合              │
│    （例如：所有 Code Generation Behavior 相關的 Rule）                         │
│                                                                              │
│  • Application Ruleset : 基於任意原則設計的規則集合體                          │
│    （可為 Workflow-based、Domain-based、Risk-based、Compliance-based、        │
│     或任何產業/企業自訂原則，原則種類無上限）                                   │
└──────────────────────────────────────────────────────────────────────────────┘
                                      ↓
                   External Integration / Application Layer (非 BRA 核心範圍)
                                      │
┌──────────────────────────────────────────────────────────────────────────────┐
│                    4. External Execution & Control Layer                     │
│                   (Runtime Control & Evidence Generation)                    │
├──────────────────────────────────────────────────────────────────────────────┤
│  Boundary  ──►  Behavior Scope Binding                                       │
│  • 指定本次執行應適用的 Ruleset（可單組或多組）                                 │
│  • Runtime Context Binding                                                   │
│                                                                              │
│                     ↓                                                        │
│                                                                              │
│  Execution  ──►  Constrained AI Action                                       │
│  • 受選取的 Ruleset 與 Behavior Scope 共同約束                                 │
│                                                                              │
│                     ↓                                                        │
│                                                                              │
│  Evidence   ──►  Decision Behavior Constraint Evidence                       │
│  • Execution Log, Rule-evaluation Report, Trace ID, Change Summary           │
└──────────────────────────────────────────────────────────────────────────────┘
```

---

## 2. 數學表示法
> 描述 Rule, Rule Library, Ruleset, Category Ruleset, Application Ruleset 之間的數量關聯

### 2.1 基數關係（Cardinality Relationships）

#### 2.1.1 Rule ↔ Category Ruleset（一對多）
```
Category_Ruleset : Rule  =  1 : N

∀ rule ∈ Library:
  ∃! category ∈ Behavior_Category:
    rule ∈ Category_Ruleset(category)
```
即：每條 Rule 只能屬於一個 Behavior Category；反之，一個 Category Ruleset 可包含多條 Rule。

#### 2.1.2 Rule ↔ Application Ruleset（多對多）
```
Rule : Application_Ruleset  =  N : N

∀ rule ∈ Library:
  ∃ {P₁, P₂, ..., Pₖ} ⊆ Principle:
    rule ∈ Application_Ruleset(Pᵢ), ∀ᵢ

∀ Application_Ruleset:
  ∃ {rule₁, rule₂, ..., ruleₘ} ⊆ Library:
    ruleⱼ ∈ Application_Ruleset
```
即：一條 Rule 可被組合進多個 Application Ruleset；一個 Application Ruleset 可組合多條 Rule。

#### 2.1.3 Ruleset 基數約束
```
∀ Ruleset ⊆ Library:
  |Ruleset| ≥ 1
```
即：一個 Ruleset 至少有一條 Rule，最多無上限。

---

### 2.2 組合關係（Composition Relationships）

#### 2.2.1 Rule Library 與 Category Ruleset
```
Library = ⋃_{C ∈ Behavior_Category} Category_Ruleset(C)
```
即：所有 Category Ruleset 的聯集構成完整的 Rule Library。

#### 2.2.2 Category Ruleset 互斥性
```
∀ C₁ ≠ C₂ ∈ Behavior_Category:
  Category_Ruleset(C₁) ∩ Category_Ruleset(C₂) = ∅
```
即：不同 Behavior Category 的 Category Ruleset 互不重疊（互斥分區）。

#### 2.2.3 Application Ruleset 與 Category Ruleset 交集
```
∀ C ∈ Behavior_Category, ∀ P ∈ Principle:
  Category_Ruleset(C) ∩ Application_Ruleset(P) = ∅  或  ≠ ∅
```
即：同一條 Rule 可同時屬於某個 Category Ruleset 與 Application Ruleset，但此交集不具強制約束，取決於具體組合。

---

### 2.3 實體關係圖（Entity-Relationship Diagram）

```
┌─────────────────────────────────────────────────────────────────────┐
│                           Rule Library                               │
│                    Library = ⋃ Category_Ruleset(C)                  │
└────────────────────────────┬────────────────────────────────────────┘
                             │
                             │ 包含（分區）
                             │
              ┌──────────────┴──────────────┐
              │                             │
    ┌─────────▼─────────┐         ┌────────▼────────┐
    │ Category Ruleset  │         │ Application     │
    │                   │         │ Ruleset         │
    │ 基於 Decision     │         │ 基於任意原則    │
    │ Behavior 分類     │         │ (Workflow,      │
    │                   │         │  Domain, etc.)  │
    └─────────┬─────────┘         └────────┬────────┘
              │                             │
              │ 1:N                         │ N:N
              │ (一個 Category              │ (一個 Application
              │  Ruleset 包含多條 Rule)     │  Ruleset 包含多條 Rule,
              │                             │  一條 Rule 可屬於多個
              │                             │  Application Ruleset)
              │                             │
    ┌─────────▼─────────────────────────────▼────────┐
    │                   Rule                         │
    │           結構化治理單元                        │
    │           Rule = ⟨RNL, Metadata⟩              │
    └────────────────────────────────────────────────┘
```

---

### 2.4 映射關係總結

| 關係                                   | 類型   | 說明                                         |
| -------------------------------------- | ------ | -------------------------------------------- |
| Rule → Category Ruleset                | 1:N    | 每條 Rule 只屬於一個 Behavior Category       |
| Category Ruleset → Rule                | 1:N    | 每個 Category Ruleset 可含多條 Rule          |
| Rule → Application Ruleset             | N:N    | 一條 Rule 可被組合進多個 Application Ruleset |
| Application Ruleset → Rule             | N:N    | 一個 Application Ruleset 可含多條 Rule       |
| Library ↔ Category Ruleset             | 分解   | Library = 所有 Category Ruleset 的聯集       |
| Category Ruleset ∩ Category Ruleset    | ∅      | 不同 Category 的 Ruleset 互斥                |
| Category Ruleset ∩ Application Ruleset | ∅ 或 ∃ | 可能有交集，但不必然                         |

---

## 3. 核心概念定義（Formalized Definitions）

### 3.1 NNL（Normative Natural Language）
**定義**
NNL 為人類可讀的自然語言，用於表達任務意圖與操作描述。

**特性**
- 非強制性（non-enforceable）
- 高語義彈性
- 易產生 semantic drift

**角色**
→ 僅作為 prompt input，不參與行為控制

**對比現行方法**
- Prompt Engineering：完全依賴 NNL，缺乏結構化約束
- Custom Instructions：NNL 片段化，無法確保執行語義
- Rules Files（AGENTS.md、Cursor Rules）：仍以 NNL 表達，非強制性

---

### 3.2 RNL（Rule Normative Language）
**定義**
RNL 為一種規範語言，用於表達可執行的行為規則，透過 MUST / MUST NOT 等語句定義 AI 行為政策或約束。

**形式**
- MUST：強制性政策（Policy）
- MUST NOT：禁止性約束（Constraint）

**為何區分 MUST 與 MUST NOT**
早期設計僅以 Constraint 統一表示所有規範語句，未區分 MUST 與 MUST NOT。
在實際實作與觀測中發現兩者具有本質差異：

| 特性     | MUST（Policy）              | MUST NOT（Constraint）        |
|----------|----------------------------|-------------------------------|
| 觸發觀測 | 無法觀測（期望式）          | 可觀測（違反即可偵測）        |
| Evidence | 不產生直接 Evidence         | 觸發時可留下 Evidence         |
| AI 語義  | 期望（Expectation）         | 限制（Restriction）           |
| 強制性   | 中等                        | 高                            |

因此，BRA 將 Rule 區分為 Policy（MUST）與 Constraint（MUST NOT）兩種子類型，
以反映其在可觀測性、可審計性與強制力上的根本差異。

**角色**
→ Behavior Rule 的語義層，確保行為可執行性

**對比現行方法**
- Policy-as-Code：部分接近 RNL 概念，但多為事後檢查，非 pre-execution constraint
- LLM Guardrails：多為 output filtering，未深入行為生成前的約束

---

### 3.3 Behavior Category（Decision Behavior Classification）
**定義**
Behavior Category 為 AI 決策行為的分類機制，先界定決策行為類別，再從該類別衍生對應規則。

**關鍵特性**
- 以 AI Decision Behavior 為分類核心（非 Domain Application）
- 一個 Behavior Category 對應一個 Category Ruleset
- Rule 與 Category Ruleset 為 1:N 關係（每條 Rule 只屬於一個 Category）
- 每個 Category 至少包含一條 Constraint（MUST NOT），確保該類別具備可觀測的行為邊界

**範例**
- Code Generation Behavior
- Test Generation Behavior
- Specification Generation Behavior
- File Modification Behavior

**與 Domain Category 的差異**
- **Behavior Category**：先定義決策行為，再設定規則（BRA 核心設計）
- **Domain Category**：先設計 Rule，再看 Rule 可應用在哪個 Domain（傳統方法）

**對比現行方法**
- 現行方法缺乏明確的行為分類，Rule 片段散落在不同配置中
- BRA 透過 Behavior Category 建立可重用、可治理的規則分類架構

---

### 3.4 Rule（Structured Rule Artifact）
**定義**
Rule 為結構化治理單元，由 RNL + Governance Metadata 組成，為 BRA 的最小可管理單元。

**形式化**
```
Rule = ⟨RNL, Metadata⟩
```

**分類**
- Policy: MUST（強制執行的行為政策）
- Constraint: MUST NOT（禁止執行的行為約束）

**分類設計理由**
早期版本以 Constraint 統稱所有規則，未區分語義方向。實作驗證後發現：
- **Policy（MUST）**：定義 AI 應達成的期望行為。觸發為隱性——AI 若遵循則行為符合期望，但「已遵循」本身難以直接觀測或產生 Evidence，強制性中等。
- **Constraint（MUST NOT）**：定義 AI 禁止執行的行為。觸發為顯性——AI 若違反即可被偵測，能產生明確的 Evidence（如違規日誌、行為偏差記錄），強制性高。

此區分使得治理系統可針對兩類規則採用不同的驗證策略：
- Policy 適合透過 output review 與 compliance check 驗證
- Constraint 適合透過 runtime detection 與 violation evidence 驗證

**Metadata 結構**
- version：版本號（支援演進）
- status：生命週期狀態（draft / active / deprecated）
- owner：負責人
- intent：規則意圖說明
- responsibilities：適用責任範圍
- risk：風險等級（low / medium / high / critical）
- severity：嚴重性（minor / major / critical）
- impact：影響範圍

**特性**
- 可審計（auditability）：執行過程可追溯
- 可追蹤（traceability）：與執行證據關聯
- 可版本化（version control）：支援規則演進
- 獨立性（atomicity）：不依賴其他 Rule

**對比現行方法**
- Prompt Engineering：無結構化 metadata，難以治理
- Custom Instructions：片段化配置，無統一管理
- Rules Files：開始有結構化趨勢，但未達治理資產層級

---

### 3.5 Category Ruleset（Behavior-Based Rule Collection）
**定義**
Category Ruleset 為基於相同 Decision Behavior 下的所有 Rule 集合。

**數學表示**
```
Category_Ruleset : Behavior_Category → 𝒫(Rule)

Category_Ruleset(C) = {rule ∈ Library | behavior(rule) = C}

基數關係：Category_Ruleset : Rule = 1:N
```

**特性**
- 不同 Behavior Category 的 Category Ruleset 互斥（不重疊）
- 所有 Category Ruleset 的聯集構成完整的 Rule Library

**範例**
```
C_code_gen = "Code Generation Behavior"
Category_Ruleset(C_code_gen) = {
  rule_must_use_linter,
  rule_must_not_modify_readme,
  rule_must_include_tests,
  ...
}
```

---

### 3.6 Application Ruleset（Principle-Based Rule Collection）
**定義**
Application Ruleset 為基於任意應用原則所設計的規則集合體，可為 Workflow-based、Domain-based、Risk-based、Compliance-based 或任何產業/企業自訂原則。

**數學表示**
```
Application_Ruleset : Principle → 𝒫(Rule)

Application_Ruleset(P) = {rule ∈ Library | satisfies(rule, P)}

基數關係：Rule : Application_Ruleset = N:N
```

**原則類型（無上限）**
- Workflow-based：依企業作業流程組合（開發、測試、部署）
- Domain-based：依應用領域整合（安全、測試、文件）
- Risk-based：依風險等級篩選
- Compliance-based：依合規要求組合
- Custom：企業/產業自訂原則

**特性**
- 一條 Rule 可被組合進多個 Application Ruleset
- 一個 Application Ruleset 可組合多條 Rule
- 與 Category Ruleset 可能有交集，但不必然

**範例**
```
P_dev = "Development Workflow"
Application_Ruleset(P_dev) = {
  rule_version_control,
  rule_code_review,
  rule_must_use_linter,    // 來自 Code Generation Category
  rule_must_include_tests,  // 來自 Code Generation Category
  ...
}
```

**對比現行方法**
- 現行方法缺乏動態組合能力，每次執行只能套用單一配置
- BRA 透過 Application Ruleset 支援基於不同原則的靈活組合

---

### 3.7 Rule Library（Governance Asset Repository）
**定義**
Rule Library 為所有 Rule 的集中式儲存與管理系統，為可累積的治理資產。

**數學表示**
```
Library = ⋃_{C ∈ Behavior_Category} Category_Ruleset(C)
```

**特性**
- 所有 Rule 集合體
- 可跨：產業 / 企業 / 專案
- 長期累積治理資產
- 支援版本管理與演進

**演進路徑**
- Rule Pool：單一專案內的 Rule 集合
- Repository：組織內共享的 Rule 庫
- Marketplace：跨組織的 Rule 交易與共享平台

**對比現行方法**
- Prompt Engineering：無 shared library 概念
- Custom Instructions：片段化配置，難以跨專案共享
- Rules Files：開始有 repository-level 共享，但缺乏治理架構

---

## 4. 整體層級結構（Architecture Layering）

### 4.1 BRA 核心三層架構

**Layer 1 — Rule Language Layer（規則語言層）**

**核心功能**
- 輸入抽象與規範約束轉換
- NNL → RNL 語義收斂

**組成元素**
- NNL（Normative Natural Language）
  - Prompt Optimization
  - Human-readable intent
  - Non-enforceable
- RNL（Rule Normative Language）
  - Behavior Rule Expression
  - MUST / MUST NOT normative rules
  - Enforceable behavior constraints

**對比現行方法**
- 現行方法：NNL 直接作為行為控制，缺乏語義分離
- BRA：明確區分 Intent（NNL）與 Enforcement（RNL）

---

**Layer 2 — Rule Architecture Layer（規則架構層）**

**核心功能**
- 結構化規則定義
- Behavior Category → Rule 的衍生過程

**組成元素**
- Behavior Category
  - AI Decision Behavior 分類
  - 先定義行為類別，再衍生規則
- Rule
  - Structured Governance Artifact
  - Rule = ⟨RNL, Metadata⟩
  - Policy (MUST) / Constraint (MUST NOT)

**對比現行方法**
- 現行方法：Rule 片段散落在 prompt、instructions、files 中
- BRA：統一結構化定義，具備治理能力

---

**Layer 3 — Governance Asset Layer（治理資產層）**

**核心功能**
- 可重用、可共享的規則儲存庫
- 規則分類與組合機制

**組成元素**
- Rule Library
  - Cross-industry / Cross-enterprise / Cross-project Repository
  - 治理資產累積與演進
- Category Ruleset
  - 基於相同 Decision Behavior 的 Rule 集合
  - Category_Ruleset : Rule = 1:N
- Application Ruleset
  - 基於任意原則的 Rule 組合
  - Rule : Application_Ruleset = N:N
  - Workflow-based / Domain-based / Risk-based / Compliance-based 等

**對比現行方法**
- 現行方法：缺乏 shared library，每次從頭配置
- BRA：建立可累積、可共享的治理資產

---

### 4.2 外部整合層（非 BRA 核心範圍）

**Layer 4 — External Execution & Control Layer**

**Boundary（行為範疇綁定）**
- 指定本次執行應適用的 Ruleset（可單組或多組）
- Runtime Context Binding
- Behavior Scope 約束

**Execution（受控執行）**
- 受選取的 Ruleset 與 Behavior Scope 共同約束
- Constrained AI Action

**Evidence（執行證據）**
- Execution Log
- Rule-evaluation Report
- Trace ID
- Change Summary

**與 BRA 的關係**
- BRA 定義規則結構與治理
- Boundary / Execution / Evidence 為外部消費者（非 BRA 核心）

---

### 4.3 層級關係總覽

```
┌─────────────────────────────────────────────────────────┐
│  BRA Core Architecture（三層）                           │
├─────────────────────────────────────────────────────────┤
│  Layer 1: Rule Language Layer                          │
│  NNL → RNL                                              │
├─────────────────────────────────────────────────────────┤
│  Layer 2: Rule Architecture Layer                      │
│  Behavior Category → Rule                               │
├─────────────────────────────────────────────────────────┤
│  Layer 3: Governance Asset Layer                       │
│  Rule Library + Category Ruleset + Application Ruleset │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│  External Integration（非 BRA 核心）                     │
├─────────────────────────────────────────────────────────┤
│  Boundary → Execution → Evidence                        │
└─────────────────────────────────────────────────────────┘
```

---

## 5. 關鍵創新點

### 5.1 語義分離（Semantic Separation）

**核心創新**
```
NNL ≠ RNL
Intent Optimization ≠ Behavior Enforcement
```

**對比現行方法**
- **Prompt Engineering**
  - 問題：NNL 同時承載 intent 與 constraint，易產生語義漂移
  - BRA：分離 intent（NNL）與 enforcement（RNL）
- **Custom Instructions**
  - 問題：NNL 片段化，無法確保執行語義
  - BRA：RNL 確保可執行的行為約束
- **Rules Files**（AGENTS.md、Cursor Rules）
  - 問題：仍以 NNL 表達，非強制性
  - BRA：RNL 具備 MUST / MUST NOT 規範語義

---

### 5.2 行為控制鏈條完整化（Complete Behavior Control Chain）

**核心創新**
```
從：prompt → pre-execution（斷裂）

轉為：prompt → constraint → rule → composition
      → scope → execution → evidence（完整鏈條）
```

**對比現行方法**
- **Prompt Engineering**
  - 缺乏結構化 constraint 與 composition
  - 無法形成完整的控制鏈
- **Custom Instructions**
  - 有片段化 constraint，但無 composition 機制
  - 缺乏 evidence generation
- **Policy-as-Code / LLM Guardrails**
  - 多為事後檢查（post-execution）
  - BRA 建立 pre-execution → runtime → post-execution 的完整鏈條

---

### 5.3 Governance 資產化（Governance as Asset）

**核心創新**
```
Rule 不再是：prompt 片段（不可管理）

而是：結構化治理資產（可管理、可累積、可共享）
```

**對比現行方法**
- **Prompt Engineering**
  - Rule 隱藏在 prompt 中，無法獨立管理
- **Custom Instructions**
  - Rule 片段化，難以跨專案共享
- **Rules Files**
  - 開始有 repository-level 共享，但缺乏治理架構
- **BRA 創新**
  - Rule Library：可累積的治理資產
  - Metadata：版本、負責人、風險等級、嚴重性
  - 演進路徑：Rule Pool → Repository → Marketplace

---

### 5.4 動態組合能力（Dynamic Composition Capability）

**核心創新**
```
Ruleset 支援：
- Category Ruleset（基於 Decision Behavior）
- Application Ruleset（基於任意原則）
```

**數學表示**
```
Rule ↔ Category Ruleset : 1:N（每條 Rule 只屬於一個 Category）
Rule ↔ Application Ruleset : N:N（多對多組合）
Library = ⋃ Category_Ruleset(C)
```

**對比現行方法**
- **Prompt Engineering**
  - 無 composition 機制，每次從頭撰寫
- **Custom Instructions**
  - 有固定配置，但無動態組合能力
- **Rules Files**
  - 有 repository-level rules，但缺乏基於原則的組合機制
- **BRA 創新**
  - Category Ruleset：基於 Decision Behavior 的規則分類
  - Application Ruleset：基於 Workflow、Domain、Risk、Compliance 等原則的靈活組合
  - 支援單次執行綁定多個 Application Ruleset

---

### 5.5 Behavior-Based 分類設計（vs. Domain-Based）

**核心創新**
```
Behavior Category：先定義 AI 決策行為類別，再衍生對應規則
Domain Category：先設計 Rule，再看 Rule 可應用在哪個 Domain
```

**對比現行方法**
- **現行方法**
  - 缺乏明確的行為分類機制
  - Rule 片段散落在不同配置中
- **BRA 創新**
  - 以 Decision Behavior 為核心（Code Generation、Test Generation 等）
  - 確保 Rule 與 AI 行為決策點精確對應
  - 建立可重用、可治理的行為分類架構

---

## 6. Memo

1. 新的設計 Category 不是 Domain Category，是 Behavior Category。兩者最大差別是 Behavior Category 先界定 AI 決策行為類別，再從這個決策行為類別設定規則；而 Domain Category 則是先設計 Rule，再看這個 Rule 可以應用在那個 Domain，且 Domain 和 Behavior 可能有關，可能無關。
2. Ruleset 是單純指規則集合體
3. Application Ruleset 就是基於 Ruleset 原則基於某種原則設計的，可能包含Workflow-based, Domain-based，依那種原則並非只有這兩種，可能有無限種，完全取決於產業/企業的需求
4. Category Ruleset 則是基於相同 Decision Behavior 下的所有 Rule
5. 一個 Ruleset 至少有一條 Rule，最多沒有限制。
6. 一條 Rule 只可以屬於一個 Behavior Category，也就是說 Rule 和 Category Ruleset 是一對多。
7. 一條 Rule 可以被組合進多個 Application Ruleset，一個 Application Ruleset 可以組合多條 Rule，也就是說 Rule 和 Application Ruleset 是多對多。
8. 所有的 Category Ruleset 組合起來就是 Rule Library。