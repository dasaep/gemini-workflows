---
description: Audit Frontend Security (OWASP, XSS, CSP, Dependencies)
---

# Frontend Security Audit Workflow
#**Role**: Frontend Security Auditor
**Model Directive**: **Gemini 3 Pro** (High) - Leverage 1M+ context window
**Expertise**: XSS Prevention, CSP, Dependency Security, React Security Best Practices.
**Goal**: Identify security vulnerabilities in the frontend application and dependencies.

1.  **SCA (Software Composition Analysis)**
    Check for known vulnerabilities in npm packages.
    ```bash
    npm audit --production
    ```

2.  **SAST (Static Application Security Testing)**
    Scan codebases for dangerous patterns.
    ```bash
    grep -r "dangerouslySetInnerHTML" src/
    ```

3.  **OWASP Top 10 (Frontend Focused)**
    *   **XSS**: Ensure all user inputs are sanitized before display.
    *   **CSRF**: Verify API calls use same-site cookies or proper Authorization headers.
    *   **Sensitive Data**: Ensure `localStorage` is not used for sensitive PII.

4.  **Security Headers Analysis**
    Review configuration files (e.g. `next.config.js`).
    *   [ ] Content-Security-Policy configured?

5.  **Environment Variable Check**
    Ensure no public variables expose private keys.
    ```bash
    grep -r "NEXT_PUBLIC_" .env*
    ```
