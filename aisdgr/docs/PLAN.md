# 规则转换计划：从 AIGM 到 AISDGR

## 一、转换原则分析

### 1.1 核心转换原则

从 `history/v3.0-aigm` 到 `aisdgr/docs/rules` 的转换遵循以下原则：

#### 1.1.1 去情境化（Decontextualization）

**原始格式（AIGM v3.0）：**
- 包含文档类型特定约束（SRS, SDS, STS, CAS, CIS, CSS）
- 包含模板特定约束
- 包含执行意图和验证方法

**目标格式（AISDGR）：**
- 完全文档类型无关（document-agnostic）
- 完全模板无关（template-agnostic）
- 专注行为约束，不涉及特定文档结构
- 治理元数据仅作描述，不影响执行

#### 1.1.2 分类标准化（Standardized Classification）

**原始分类：**
- GEC-SRS-INTRO-001, GGC-SRS-GLOBAL-001 等文档相关编号
- GEC-SDS-COMP-001, GGC-CAS-MOD-001 等特定文档编号
- 每个文档类型独立编号系统

**目标分类（DOCS 规则）：**
```
DOCS-<CATEGORY>-<TYPE>-<NN>
```

其中 TYPE:
- P = Policy（执行规则）
- C = Constraint（约束规则）

**固定分类（7类）：**
- **TR** (Traceability) - 可追溯性：2条规则
- **BD** (Boundary & Stop) - 边界与停止：8条规则
- **AR** (Artifact Isolation) - 制品隔离：28条规则
- **ST** (Structural Change) - 结构变更：32条规则
- **TI** (Test Integrity) - 测试完整性：1条规则
- **CN** (Constraint Neutrality) - 约束中立性：1条规则
- **LG** (Logging & Report) - 日志与报告：0条规则

#### 1.1.3 规则独立化（Rule Atomization）

**原始格式：**
- GEC 和 GGC 分离的规则文件
- 每个文档类型独立规则集

**目标格式：**
- 一个 YAML 文件 = 一个规则
- 规则完全独立、可复用
- 规则不依赖特定文档类型或模板
- 规则集（Ruleset）负责场景组合

#### 1.1.4 结构规范化（Structured Representation）

**规则结构：**
```yaml
rule:
  id: DOCS-XX-Y-NN            # 规则ID（Y=P或C）
  execution_view: <view>      # 执行视图（解释视角）
  constraint: >               # 约束声明（规范性核心）
    <normative statement>

  boundary:                   # 边界（应用范围）
    domain: [docs]
    artifact: [...]
    rule_category: [...]
    rule_domain: [DOCS]

  governance:                 # 治理元数据（描述性）
    version: X.Y.Z
    status: draft|active
    owner: aisr
    intent: {...}
    responsibilities: {...}
    applicability_context: {...}
    governance_impact: {...}
```

**关键分离：**
- **约束（constraint）** = 规范性核心，无模板依赖
- **边界（boundary）** = 应用范围，文档类型无关
- **治理（governance）** = 描述性元数据，不参与执行

---

## 二、规则来源分析

### 2.1 原始规则统计

**来源文档类型（6类）：**
- **SRS** (Software Requirements Specification): 12条规则
- **SDS** (Software Design Specification): 23条规则
- **STS** (System Test Specification): 10条规则
- **CAS** (Coding Architecture Specification): 11条规则
- **CIS** (Conceptual Implementation Specification): 8条规则
- **CSS** (Coding Structure Specification): 8条规则

**规则类型：**
- **GEC** (Governance Enforcement Constraints): 33条
- **GGC** (Generation Governance Constraints): 39条

**总计：72条规则**

### 2.2 规则分类映射

#### 按风险类型分类：
- hallucination（幻觉）: 18条
- drift（漂移）: 16条
- transparency（透明度）: 9条
- leakage（泄漏）: 7条
- ambiguity（歧义）: 6条
- safety（安全）: 5条
- security（安全）: 2条
- 其他: 9条

#### 按严重性分类：
- error: 38条
- high: 16条
- medium: 15条
- critical: 1条
- low: 1条
- warning: 1条

---

## 三、转换清单

### 3.1 Boundary & Stop (BD) - 8条规则

| Type       | ID             | RNL                                                                 | Source         | Severity |
| ---------- | -------------- | ------------------------------------------------------------------- | -------------- | -------- |
| Constraint | DOCS-BD-C-01   | Generation *MUST* be explicitly scoped.                             | SRS GGC        | error    |
| Constraint | DOCS-BD-C-02   | SDS design scope *MUST* be project-specific.                        | SDS GEC        | error    |
| Constraint | DOCS-BD-C-03   | Purpose and scope *MUST* be explicit.                               | SDS GEC        | error    |
| Constraint | DOCS-BD-C-04   | SDS generation *MUST* be explicitly scoped.                         | SDS GGC        | error    |
| Constraint | DOCS-BD-C-05   | Generation *MUST* be explicitly scoped.                             | CAS GGC        | error    |
| Constraint | DOCS-BD-C-06   | Module boundary generation *MUST* be user-driven only.              | CAS GGC        | error    |
| Constraint | DOCS-BD-C-07   | Generation *MUST* be explicitly scoped.                             | CIS GGC        | error    |
| Constraint | DOCS-BD-C-08   | Generation *MUST* be explicitly scoped.                             | CSS GGC        | error    |

### 3.2 Structural Change (ST) - 32条规则

#### Constraint (23条)
- 文档结构约束规则
- 架构约束规则
- 设计约束规则

#### Policy (9条)
- 组件责任声明
- 交互流程说明
- 治理策略执行

### 3.3 Artifact Isolation (AR) - 28条规则

#### Constraint (26条)
- 生成边界约束
- 占位符约束
- 跨章节生成禁止

#### Policy (2条)
- 语义源识别
- 结构保持

### 3.4 Test Integrity (TI) - 1条规则

#### Policy (1条)
- 测试规范项目策略

### 3.5 Constraint Neutrality (CN) - 1条规则

#### Constraint (1条)
- 场景结构和约束

### 3.6 Traceability (TR) - 2条规则

#### Policy (2条)
- 设计可追溯性
- 横切关注点可追溯性

---

## 四、转换优先级

### 4.1 高优先级规则（立即可转换）

**特征：**
- 约束明确、可执行
- 不依赖特定模板
- 可映射到通用 DOCS 分类

**清单：**
- 所有 BD (Boundary) 规则：8条
- 所有 CN (Constraint Neutrality) 规则：1条
- 所有 TI (Test Integrity) 规则：1条
- 所有 TR (Traceability) 规则：2条
- 高风险 AR (Artifact Isolation) 规则：18条
- 高风险 ST (Structural Change) 规则：15条

**总计：45条高优先级规则**

### 4.2 中优先级规则（需调整后转换）

**特征：**
- 包含部分文档类型特定概念
- 需要去除模板依赖
- 可转换为纯行为约束

**清单：**
- 剩余 AR 规则：10条
- 剩余 ST 规则：17条

**总计：27条中优先级规则**

---

## 五、转换注意事项

### 5.1 必须避免的转换错误

1. **过度转换**
   - ❌ 将文档类型特定逻辑混入规则约束
   - ❌ 保留模板特定的占位符引用

2. **信息丢失**
   - ❌ 忽略原规则的 severity 和 risk 信息
   - ❌ 丢失 governance_impact 的描述

3. **分类错误**
   - ❌ 将边界规则错误分类为结构规则
   - ❌ 混淆 Policy 与 Constraint

### 5.2 必须保留的信息

1. **规范性约束**（constraint）
   - 完整保留 MUST/MUST NOT 语句
   - 去除模板和文档类型特定引用

2. **治理元数据**（governance）
   - 保留 intent、risk、severity
   - 保留 responsibilities、applicability_context

3. **边界信息**（boundary）
   - 通用化 domain、artifact
   - 正确分类 rule_category

---

## 六、下一步行动

### 6.1 立即执行（Phase 1）

- [ ] 转换 45条高优先级规则
- [ ] 创建通用文档规则集（ruleset）
- [ ] 验证规则与现有 DOCS 规则的一致性

### 6.2 后续规划（Phase 2）

- [ ] 转换 27条中优先级规则
- [ ] 建立文档类型无关的规则分类体系
- [ ] 创建跨文档类型的通用规则集

---

## 七、总结

### 转换统计

| 来源文档 | 总规则数 | GEC | GGC | 高优先级 | 中优先级 |
|---------|---------|-----|-----|---------|---------|
| SRS     | 12      | 4   | 8   | 12      | 0       |
| SDS     | 23      | 15  | 8   | 14      | 9       |
| STS     | 10      | 8   | 2   | 8       | 2       |
| CAS     | 11      | 4   | 7   | 8       | 3       |
| CIS     | 8       | 3   | 5   | 6       | 2       |
| CSS     | 8       | 3   | 5   | 6       | 2       |
| **总计** | **72**  | **33** | **39** | **45** | **27** |

### 关键结论

1. **所有规则可转换**（72/72 = 100%）
2. **主要映射到 6 个分类**：BD, ST, AR, TI, CN, TR
3. **转换后保持文档类型无关、模板无关**
4. **规则集负责场景语义，规则负责行为约束**

---

**文档版本：** 2.0.0
**创建日期：** 2026-03-18
**状态：** 草稿（Draft）
