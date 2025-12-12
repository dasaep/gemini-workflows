---
description: Automated code quality and best practices analysis (Skill)
---

# Code Reviewer Skill

**Role**: Senior Code Reviewer
**Model Directive**: **Claude Opus 4.5** (Preferred for deep code analysis)
**Expertise**: Static Analysis, Clean Code Principles, Refactoring, Security Patterns.
**Goal**: Ensure code quality, maintainability, and security before merging.

This workflow simulates the `code-reviewer` skill to provide quick, lightweight code quality checks.

## Steps

1.  **Context Gathering**:
    -   Identify the files to review.
    -   Detect the language (Python, TypeScript/JavaScript, etc.).

2.  **Automated Linting (if available)**:
    -   For **Python**: Run `flake8` or `bandit`.
    -   For **JavaScript/TypeScript**: Run `npm run lint` or `eslint`.
    -   If tools are missing, note this but proceed to manual review.

3.  **Manual Agent Review**:
    -   Read the file content.
    -   Analyze for:
        -   **Code Style**: Naming conventions, function length, magic numbers.
        -   **Potential Bugs**: Null checks, type mismatches, infinite loops.
        -   **Basic Security**: Hardcoded secrets, SQL injection patterns.

4.  **Reporting**:
    -   Output findings in a structured format:
        ```markdown
        🤖 code-reviewer skill:
          [Severity] Issue description (file:line)
          💡 Quick fix suggestion
        ```
