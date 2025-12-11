---
description: Deploy Project Backend with Integrated Audits (Security -> Functional -> Technical -> Deploy)
---

# Backend Deployment Pipeline

## Phase 1: security_audit
1.  **Vulnerability & Secret Scan**
    ```bash
    pip install safety bandit
    safety check -r requirements.txt
    bandit -r [src_dir]/ -ll
    grep -r "API_KEY" . --exclude-dir=node_modules --exclude-dir=.git
    ```

2.  **Compliance Check**
    *   [ ] Verify compliances (Encryption, Access Control).
    *   [ ] Verify Secure Model Loading.

## Phase 2: functional_audit
3.  **Goal & API Contract Verification**
    *   [ ] Verify Requirements/Spec alignment.
    *   [ ] Check API contract validity (e.g. `router.py` or `app.py`).

4.  **Extensibility Check**
    *   [ ] Verify modularity of services.

## Phase 3: technical_audit
5.  **Code Quality & Scalability**
    ```bash
    flake8 [src_dir]/ --count --select=E9,F63,F7,F82 --show-source --statistics
    ```
    *   [ ] Review HPA and Resources configuration.

## Phase 4: deploy
6.  **Build & Push Docker Image (Optional)**
    *Only if code changes require new image (vs just ConfigMap patch)*
    ```bash
    # docker build -t [registry]/[project]/api:latest .
    # docker push [registry]/[project]/api:latest
    ```

7.  **Update ConfigMaps**
    ```bash
    # Update this command to match your specific configmap needs
    # kubectl create configmap [configmap-name] --from-file=[key]=[path] -n [namespace] --dry-run=client -o yaml | kubectl apply -f -
    ```

8.  **Restart Services**
    ```bash
    # Update deployment names as needed
    kubectl rollout restart deployment [deployment-name] -n [namespace]
    ```

9.  **Verify Deployment**
    ```bash
    kubectl get pods -n [namespace]
    ```
