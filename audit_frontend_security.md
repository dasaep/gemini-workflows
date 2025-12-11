---
description: Audit Frontend Security (OWASP, XSS, CSP, Dependencies) for Frontend Applications
---

# Frontend Security Audit Workflow

1.  **SCA (Software Composition Analysis)**
    Check for known vulnerabilities in npm packages for both apps.
    ```bash
    echo "Auditing App 1..."
    cd [app-1] && npm audit --production && cd ..
    
    echo "Auditing App 2..."
    cd [app-2] && npm audit --production && cd ..
    ```

2.  **SAST (Static Application Security Testing)**
    Scan both codebases for dangerous patterns.
    ```bash
    echo "Scanning for dangerous patterns..."
    grep -r "dangerouslySetInnerHTML" [app-1]/src/ [app-2]/src/
    ```

3.  **OWASP Top 10 (Frontend Focused)**
    *   **XSS**: Ensure all user inputs are sanitized before display.
    *   **CSRF**: Verify API calls use same-site cookies or proper Authorization headers.
    *   **Sensitive Data**: Ensure `localStorage` is not used for sensitive data.

4.  **Security Headers Analysis**
    Review `next.config.js` in projects.
    *   [ ] `[app-1]/next.config.js`: Content-Security-Policy configured?
    *   [ ] `[app-2]/next.config.js`: Content-Security-Policy configured?

5.  **Environment Variable Check**
    Ensure no `NEXT_PUBLIC_` variables expose private keys.
    ```bash
    grep -r "NEXT_PUBLIC_" [app-1]/.env*
    ```
