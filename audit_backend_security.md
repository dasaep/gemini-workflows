---
description: Audit Backend Security (OWASP, Cloud, HIPAA, ML Security)
---

# Backend Security Audit Workflow

1.  **Dependency Vulnerability Scan**
    Check for known vulnerabilities in Python dependencies.
    ```bash
    pip install safety
    safety check -r requirements.txt
    ```

2.  **Static Application Security Testing (SAST)**
    Run `bandit` to find common security issues in Python code.
    ```bash
    pip install bandit
    bandit -r [src_dir]/ -ll
    ```

3.  **Secret Detection**
    Scan for hardcoded secrets or API keys in the codebase.
    *Instruction*: Manually review `config.py` files or run `git secrets` if available.
    *Automated Check*:
    ```bash
    grep -r "API_KEY" . --exclude-dir=node_modules --exclude-dir=.git
    ```

4.  **Compliance Check (Architecture)**
    Review infrastructure docs and specs to ensure:
    *   [ ] Data Encryption at Rest (verified in K8s PVCs?)
    *   [ ] Data Encryption in Transit (TLS/HTTPS enabled?)
    *   [ ] Access Controls (RBAC in K8s?)
    *   [ ] PHI Handling (Is user data isolated?)

5.  **ML Security Audit**
    *   [ ] Model Deserialization: Are we using safe loaders (avoid pickle on untrusted data)?
    *   [ ] Adversarial Robustness: Are input images validated for size/type before processing?

6.  **Cloud Config Audit**
    Review Terraform files for security misconfigurations.
    *   Check terraform files for open ports or public access.
