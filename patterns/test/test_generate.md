# Test Generate Pattern

Goal:
Generate test code according to the Test Scope defined in VDP
and the test requirements specified in STS.

Constraints:
- Generation only
- Do NOT execute tests
- Do NOT assume test pass
- Do NOT generate TR
- Do NOT modify source code

Inputs:
- VDP.md (Test Scope section)
- STS.md
- Generated source code

Output:
- Test code under tests/

Responsibility:
- Producer only
- Test execution is out of scope
