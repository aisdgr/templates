# Chat Pattern — add / test

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
  - {{SDS_PATH}}
  - {{CAS_PATH}}
  - {{CIS_PATH}}


## ARTIFACT OUTPUT

Generate test code under the following path:

- {{ARTIFACT_PATH}}


## TASK

Execute the work strictly according to the provided XIM.
Do not infer, extend, or redesign requirements.
Do not modify any existing production source code.
