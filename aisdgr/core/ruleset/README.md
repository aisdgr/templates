# CORE Domain Rulesets

本目錄包含 CORE Domain 的 Ruleset 定義。

---

## 概述

CORE Domain 的規則通常透過 Application Ruleset 組合使用，而非獨立使用。

---

## Application Ruleset 範例

### 程式碼生成基礎 Ruleset

```yaml
name: Code Generation Base
description: 程式碼生成的基礎規則集
includes:
  - CORE-AR-*      # 製品隔離
  - CORE-BD-*      # 邊界控制
  - CORE-CN-*      # 約束中立性
  - CORE-TR-*      # 可追溯性
```

### 文檔生成基礎 Ruleset

```yaml
name: Documentation Generation Base
description: 文檔生成的基礎規則集
includes:
  - CORE-AR-*      # 製品隔離
  - CORE-BD-*      # 邊界控制
  - CORE-CN-*      # 約束中立性
  - CORE-TR-*      # 可追溯性
```

---

## 組合方式

CORE 規則通常與其他 Domain 的規則組合使用：

```yaml
# Go 語言程式碼生成
Application_Ruleset("Go Code Generation"):
  includes:
    - CORE-AR-*        # CORE 基礎規則
    - CORE-BD-*
    - CORE-CN-*
    - CORE-TR-*
    - CODE-LG-*        # CODE 特定規則
    - CODE-ST-*
    - CODE-TI-*
    - LANG-ST-GO-*     # Go 語言特定規則
    - GOV-ENF-*        # 治理規則
```

---

## 相關文檔

- [CORE Domain README](../README.md)
- [規則列表](../rules/LIST.md)
- [Application Ruleset 範例](../../APPLICATION_RULESET_EXAMPLES.md)

---

**維護者**: AISDGR
**建立日期**: 2026-03-19
**最後更新**: 2026-03-19
