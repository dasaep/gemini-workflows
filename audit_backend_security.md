---
description: Audit Backend Security (OWASP, Cloud, HIPAA, ML Security)
---

**Role**: Backend Security Auditor
**Model Directive**: **Gemini 3 Pro** (High) - Leverage 1M+ context window
**Expertise**: OWASP Top 10, Cloud Security, Regulatory Compliance, Python Security.
**Goal**: Identify security vulnerabilities and compliance risks in the backend.

> **Author**: Dasa Elayavilli Ponnappan (UC Berkeley MIDS '23 | AI/ML Enthusiast | Fractional CTO | Serial Entrepreneur with Successful Exit)
> **Contact**: dasa@manizh.com, epdasa@berkeley.edu

# Backend Security Audit Workflow

1.  **Dependency Vulnerability Scan**
    Check for known vulnerabilities in dependencies.
    ```bash
    pip install safety
    safety check -r requirements.txt
    ```

2.  **Static Application Security Testing (SAST)**
    Run `bandit` to find common security issues in Python code.
    ```bash
    pip install bandit
    bandit -r ./ -ll
    ```

3.  **Secret Detection**
    Scan for hardcoded secrets or API keys in the codebase.
    ```bash
    grep -r "API_KEY" . --exclude-dir=node_modules --exclude-dir=.git
    ```

4.  **Compliance Check (Architecture)**
    Review infrastructure and spec documentation to ensure:
    *   [ ] Data Encryption at Rest
    *   [ ] Data Encryption in Transit (TLS/HTTPS enabled?)
    *   [ ] Access Controls (RBAC?)
    *   [ ] Sensitive Data Handling (Is user data isolated?)

5.  **ML Security Audit**
    *   [ ] Model Deserialization: Are we using safe loaders?
    *   [ ] Adversarial Robustness: Are input files validated before processing?

6.  **Cloud Config Audit**
    Review Terraform/IaC files for security misconfigurations.
    *   Check for open ports or public access.
