# Chat Pattern — change / test

## INPUT FILES

The following files are provided as authoritative inputs.
You MUST NOT rely on any other files or assumptions.

- XIM file:
  - {{XIM_PATH}}

- Specifications:
  - {{STS_PATH}}
  - {{CGG_Core_PATH}}
  - {{CCS_Core_PATH}}
  - {{CCS_Language_PATH}}
  - {{API_PATH}}

- Optional references:
  - {{SDS_PATH}}
  - {{CAS_PATH}}
  - {{CIS_PATH}}

## ARTIFACT OUTPUT

Modify existing test code under the following path:

- {{ARTIFACT_PATH}}

## TASK

Update existing test cases to correctly reflect
the finalized specifications and intended validation scope.

You MUST NOT:
- Change production source code
- Introduce new test scopes beyond the specification
- Redefine or infer new behaviors

You MAY:
- Adjust assertions to match specifications
- Refine test coverage within existing scope
- Fix incorrect or outdated test logic

All changes MUST remain strictly within the defined specification boundaries.
