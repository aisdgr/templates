# Chat Pattern — change / code

## INPUT FILES

The following files are provided as authoritative inputs.
You MUST NOT rely on any other files or assumptions.

- Policy:
  - {{EXECUTION_POLICY_FILE}}   # Execution and rendering policy
  - {{GENERATE_POLICY_FILE}}    # AI execution contract

- XIM file:
  - {{XIM_PATH}}

- Specifications:
  - {{STS_PATH}}
  - {{CGG_Core_PATH}}
  - {{CCS_Core_PATH}}
  - {{CCS_Language_PATH}}

- Optional references:
  - {{SRS_PATH}}
  - {{SDS_PATH}}
  - {{CAS_PATH}}
  - {{CIS_PATH}}
  - {{API_PATH}}

## ARTIFACT OUTPUT

Modify existing production source code under the following path:

- {{ARTIFACT_PATH}}

## TASK

Adjust existing implementation strictly according to the provided XIM
to conform to finalized specifications and existing test cases.

You MUST NOT:
- Add new features or capabilities
- Redesign architecture or public interfaces
- Modify any test code or specification documents

You MAY:
- Refactor or update existing code logic
- Fix behavior mismatches against specifications
- Improve correctness required to pass tests

Do not infer or expand requirements beyond the given specifications.
