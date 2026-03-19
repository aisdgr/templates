# CORE Domain

CORE Domain 包含跨領域共用的通用行為限制規則。

---

## 概述

**定義**: 通用規則（Core Rules）

**特性**:
- 語義通用性：不依賴特定產出物類型（程式碼、文檔等）
- 可重用性：透過 Application Ruleset 組合到不同場景
- 基礎性：為其他 Domain 提供基礎約束��架

**適用範圍**:
- Artifact Isolation (製品隔離)
- Boundary & Stop (邊界與停止)
- Constraint Neutrality (約束中立性)
- Logging & Report (日誌與報告)
- Traceability (可追溯性)

**不適用範圍**:
- 特定產出物的結構約束（屬於 CODE、DOCS）
- 特定領域的測試約束（屬於 CODE、DOCS）

---

## 目錄結構

```
core/
├── README.md          (本檔案)
├── rules/
│   ├── AR/            (Artifact Isolation)
│   ├── BD/            (Boundary & Stop)
│   ├── CN/            (Constraint Neutrality)
│   ├── LG/            (Logging & Report)
│   ├── TR/            (Traceability)
│   └── LIST.md        (規則列表)
└── ruleset/
    └── README.md      (Ruleset 說明)
```

---

## Rule ID 格式

CORE 規則使用以下 ID 格式：

```
CORE-{CATEGORY}-{SUBTYPE}-{NUMBER}

範例:
CORE-AR-C-001     (製品隔離約束第 1 號)
CORE-BD-P-001     (邊界控制政策第 1 號)
CORE-TR-P-001     (可追溯性政策第 1 號)
```

---

## 規則統計

| Category | Constraints | Policies | 總計 |
|----------|-------------|----------|------|
| AR       | 2           | 2        | 4    |
| BD       | 3           | 3        | 6    |
| CN       | 3           | 0        | 3    |
| LG       | TBD         | TBD      | TBD  |
| TR       | 2           | 3        | 5    |
| **總計** | **10+**     | **8+**   | **18+** |

---

## 使用方式

CORE 規則通常透過 Application Ruleset 組合使用：

```yaml
# 範例：程式碼生成 Application Ruleset
Application_Ruleset("Code Generation"):
  includes:
    - CORE-AR-*        # 引用通用製品隔離規則
    - CORE-BD-*        # 引用通用邊界控制規則
    - CORE-TR-*        # 引用通用可追溯性規則
    - CODE-ST-*        # 加上程式碼特定規則
```

---

## 與其他 Domain 的關係

```
CORE (通用基礎)
  ├── CODE (程式碼特化)
  │     └── LANG (語言進一步特化)
  └── DOCS (文檔特化)
```

CORE 規則可被所有其他 Domain 重用，但 CODE、DOCS、LANG 可能有額外的特定規則。

---

## 詳細文檔

- [規則列表](./rules/LIST.md)
- [Ruleset 說明](./ruleset/README.md)
- [Domain 定義](../DOMAIN_DEFINITIONS.md)
- [Rule ID 命名規範](../RULE_ID_NAMING_CONVENTION.md)

---

**維護者**: AISDGR
**建立日期**: 2026-03-19
**最後更新**: 2026-03-19
