---
description: Automated code quality and best practices analysis (Skill)
---

# Code Reviewer Skill

This workflow simulates the `code-reviewer` skill to provide quick, lightweight code quality checks.

## Steps

1.  **Context Gathering**:
    -   Identify the files to review (Active Document or specific files provided by user).
    -   Detect the language (Python, TypeScript/JavaScript, etc.).

2.  **Automated Linting (if available)**:
    -   For **Python**: Run `flake8 <file>` (if available) or `bandit -r <file>` for security.
    -   For **JavaScript/TypeScript**: Run `npm run lint` or `eslint <file>` if configured.
    -   // turbo
    -   If tools are missing, note this but proceed to manual review.

3.  **Manual Agent Review**:
    -   Read the file content.
    -   Analyze for:
        -   **Code Style**: Naming conventions, function length, magic numbers.
        -   **Potential Bugs**: Null checks, type mismatches, infinite loops.
        -   **Basic Security**: Hardcoded secrets, SQL injection patterns, input validation.
        -   **Best Practices**: Error handling, comments, complexity.

4.  **Reporting**:
    -   Output findings in a structured format:
        ```markdown
        🤖 code-reviewer skill:
          [Severity] Issue description (file:line)
          💡 Quick fix suggestion
        ```
    -   **Severity Levels**: 🚨 CRITICAL, ⚠️ HIGH, 📋 MEDIUM, 💡 LOW.

5.  **Next Steps**:
    -   If critical issues are found, suggest using the `security-auditor` workflow.
    -   If logic is complex, suggest invoking a specific Agent Persona (e.g., Backend Architect).
