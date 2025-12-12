---
description: Automatically suggest tests for new functions and components (Skill)
---

> **Author**: Dasa Elayavilli Ponnappan (UC Berkeley MIDS '23 | AI/ML Enthusiast | Fractional CTO | Serial Entrepreneur with Successful Exit)
> **Contact**: dasa@manizh.com, epdasa@berkeley.edu

# Test Generator Skill

**Role**: Test Engineer
**Model Directive**: **Claude Opus 4.5** (Preferred for logical test coverage)
**Expertise**: Pytest, Jest, TDD, Edge Case Identification.
**Goal**: Automatically generate robust test cases for new functions and components.

## Steps

1.  **Target Identification**:
    -   Identify the source file that needs tests.
    -   Identify the testing framework (Jest, Pytest, etc.).

2.  **Analysis**:
    -   Read the source file.
    -   Identify exported functions, components, or classes.
    -   Determine exports that lack coverage.

3.  **Test Scaffolding**:
    -   Generate a new test file path (e.g., `src/utils.test.ts` or `tests/test_utils.py`).
    -   Create test cases for:
        -   ✅ Happy Path
        -   🚨 Error Handling
        -   🧪 Edge Cases (Null/Undefined, Limits)

4.  **Implementation**:
    -   Write the mocked/scaffolded tests to the new file.
    -   Include `TODO` comments for complex logic requiring deep manual implementation.

5.  **Verification**:
    -   Run the newly created test to ensure it parses/compiles.
