---
description: Automatically suggest tests for new functions and components (Skill)
---

# Test Generator Skill

This workflow simulates the `test-generator` skill to scaffold tests for your code.

## Steps

1.  **Target Identification**:
    -   Identify the source file that needs tests.
    -   Identify the testing framework used in the project (check `package.json` for Jest/Vitest, `requirements.txt` for Pytest/Unittest).

2.  **Analysis**:
    -   Read the source file.
    -   Identify exported functions, components, or classes.
    -   Determine exports that lack coverage.

3.  **Test Scaffolding**:
    -   Generate a new test file path (e.g., `src/utils.ts` -> `src/utils.test.ts` or `tests/test_utils.py`).
    -   Create test cases for:
        -   ✅ Happy Path (Basic success scenarios)
        -   🚨 Error Handling (Invalid inputs, exceptions)
        -   🧪 Edge Cases (Null/Undefined, Empty arrays, Limits)
    -   **Important**: Use the syntax matching the detected framework (Jest vs Pytest).

4.  **Implementation**:
    -   Write the mocked/scaffolded tests to the new file.
    -   Include `TODO` comments for complex logic requiring deep manual implementation.

5.  **Verification**:
    -   Run the newly created test to ensure it parses/compiles (it might fail on logic, but should run).
    -   Example: `npm test -- <file>` or `pytest <file>`.

6.  **Refinement**:
    -   If tests fail, fix obvious syntax errors.
    -   Ask user if they want to expand to a full suite (invoking a Test Engineer persona).
