# Rule List

## Boundary & Stop (BD)

| Type       | ID         | RNL                                                                                                                         |
| ---------- | ---------- | --------------------------------------------------------------------------------------------------------------------------- |
| Policy     | CODE-BD-01 | Code execution *MUST* stop if no explicit boundary declaration is present.                                                  |
| Policy     | CODE-BD-02 | Code execution *MUST* stop if multiple declared boundaries cannot be resolved into a single, deterministic execution scope. |
| Policy     | CODE-BD-03 | Code execution *MUST* stop if the declared boundary contains conflicting scope definitions.                                 |
| Constraint | CODE-BD-04 | Code execution **MUST NOT** modify any code artifact that is outside the declared boundary.                                 |
| Constraint | CODE-BD-05 | Code execution **MUST NOT** access any module or resource that is outside the declared boundary.                            |
| Constraint | CODE-BD-06 | Code execution **MUST NOT** introduce any external dependency that is outside the declared boundary.                        |

---

## Isolation (IS)

| Type       | ID         | RNL                                                                                                              |
| ---------- | ---------- | ---------------------------------------------------------------------------------------------------------------- |
| Policy     | CODE-AR-01 | Permission to create new code artifacts *MUST* be explicitly defined before execution.                           |
| Constraint | CODE-AR-02 | Code execution **MUST NOT** create any artifact whose artifact type is not explicitly declared.                  |
| Constraint | CODE-AR-03 | Code execution **MUST NOT** modify any artifact whose artifact type is not explicitly declared.                  |
| Constraint | CODE-AR-04 | Code execution **MUST NOT** modify artifacts belonging to more than one artifact type within a single execution. |
| Policy     | CODE-AR-05 | All generated artifacts *MUST* be addressable and locatable within the execution context.                        |

---

## Traceability (TR)

| Type       | ID         | RNL                                                                                                  |
| ---------- | ---------- | ---------------------------------------------------------------------------------------------------- |
| Policy     | CODE-TR-01 | Each output source code artifact that is generated or modified *MUST* contain a Trace ID.            |
| Policy     | CODE-TR-02 | Trace IDs present in the output artifact *MUST* be embedded within the source code comments.         |
| Policy     | CODE-TR-03 | Each output source code artifact produced by a single execution *MUST* share the same Trace ID.      |
| Constraint | CODE-TR-04 | Trace IDs present in the input artifact **MUST NOT** be absent in the corresponding output artifact. |
| Constraint | CODE-TR-05 | No output source code artifact without a Trace ID can be considered a valid governance output.       |

---

## Logging & Evidence (LG)

| Type       | ID         | RNL                                                                                           |
| ---------- | ---------- | --------------------------------------------------------------------------------------------- |
| Policy     | CODE-LG-01 | Each code execution *MUST* produce a detailed execution record (log).                         |
| Policy     | CODE-LG-02 | Each execution record *MUST* be explicitly linked to the triggering user request.             |
| Policy     | CODE-LG-03 | Each code execution *MUST* include a non-empty rationale for the chosen implementation path.  |
| Constraint | CODE-LG-04 | Execution rationales **MUST NOT** be empty, vague, or purely descriptive of the code changes. |
| Policy     | CODE-LG-05 | Each code execution that results in changes *MUST* include a change summary.                  |
| Policy     | CODE-LG-06 | Change summaries *MUST* accurately reflect the delta between initial and final states.        |
| Policy     | CODE-LG-07 | Each execution *MUST* generate a rule-evaluation report.                                      |
| Policy     | CODE-LG-08 | Rule-evaluation reports *MUST* include the status (passed/failed) for each applied rule.      |
| Constraint | CODE-LG-09 | Rule violations **MUST NOT** be silently ignored in the execution logs.                       |

---

## Test Integrity (TI)

| Type       | ID         | RNL                                                                                 |
| ---------- | ---------- | ----------------------------------------------------------------------------------- |
| Constraint | CODE-TI-01 | Test artifacts **MUST NOT** modify or affect the behavior of production artifacts.  |
| Constraint | CODE-TI-02 | Test changes **MUST NOT** expand the validation scope beyond the declared boundary. |
| Constraint | CODE-TI-03 | Tests **MUST NOT** redefine expected behavior to hide failures.                     |
| Policy     | CODE-TI-04 | Test modifications *MUST* preserve the original validation intent.                  |
| Constraint | CODE-TI-05 | Tests **MUST NOT** infer requirements or expected behavior not explicitly stated.   |

---

## Structural Integrity (SI)

| Type       | ID         | RNL                                                                                          |
| ---------- | ---------- | -------------------------------------------------------------------------------------------- |
| Policy     | CODE-ST-01 | Permission for structural refactoring *MUST* be explicitly granted.                          |
| Constraint | CODE-ST-02 | Code execution **MUST NOT** perform any structural refactoring without explicit intent.      |
| Constraint | CODE-ST-03 | Code execution **MUST NOT** perform structural refactoring that affects external interfaces. |
| Constraint | CODE-ST-04 | Code execution **MUST NOT** introduce new functionality during a refactoring task.           |
| Constraint | CODE-ST-05 | Code execution **MUST NOT** remove existing behavior during structural changes.              |

---

## Inference Control (IC)

| Type       | ID         | RNL                                                                           |
| ---------- | ---------- | ----------------------------------------------------------------------------- |
| Constraint | CODE-CN-01 | Undeclared boundaries **MUST NOT** be inferred from implementation details.   |
| Constraint | CODE-CN-02 | Undeclared requirements **MUST NOT** be inferred from existing code patterns. |
| Constraint | CODE-CN-03 | Undeclared validation targets **MUST NOT** be inferred to satisfy tests.      |
