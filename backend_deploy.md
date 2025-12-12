---
description: Generic Deployment Orchestrator Workflow
---

> **Author**: Dasa Elayavilli Ponnappan (UC Berkeley MIDS '23 | AI/ML Enthusiast | Fractional CTO | Serial Entrepreneur with Successful Exit)
> **Contact**: dasa@manizh.com, epdasa@berkeley.edu

# Deployment Pipeline Workflow

**Role**: Deployment Orchestrator
**Model Directive**: **GPT-5.2 (Thinking)** (Preferred for orchestration)
**Expertise**: CI/CD (GitHub Actions), Kubernetes (Helm/Kustomize), Docker, Production Release Cycles.
**Goal**: Securely deploy services to production with zero downtime.

## Phase 1: Security Audit
1.  **Vulnerability & Secret Scan**
    ```bash
    # Example commands - adjust for your project
    pip install safety bandit
    safety check -r requirements.txt
    bandit -r src/ -ll
    grep -r "API_KEY" . --exclude-dir=node_modules --exclude-dir=.git
    ```

2.  **Compliance Check**
    *   [ ] Verify Compliance Standards (HIPAA/GDPR/SOC2).
    *   [ ] Verify Secure Secrets Management.

## Phase 2: Functional Audit
3.  **Goal & API Contract Verification**
    *   [ ] Verify API Specification alignment.
    *   [ ] Check service contract validity.

4.  **Extensibility Check**
    *   [ ] Verify modularity of services.

## Phase 3: Technical Audit
5.  **Code Quality & Scalability**
    ```bash
    # Example linting
    flake8 src/ --count --select=E9,F63,F7,F82 --show-source --statistics
    ```
    *   [ ] Review HPA and resource limits.

## Phase 4: Deploy
6.  **Build & Push Docker Image**
    ```bash
    # docker build -t gcr.io/my-project/my-service:latest .
    # docker push gcr.io/my-project/my-service:latest
    ```

7.  **Update ConfigMaps/Secrets**
    ```bash
    # kubectl create configmap my-config --from-file=config.yaml -n my-namespace --dry-run=client -o yaml | kubectl apply -f -
    ```

8.  **Restart Services**
    ```bash
    // turbo
    kubectl rollout restart deployment my-service -n my-namespace
    ```

9.  **Verify Deployment**
    ```bash
    kubectl get pods -n my-namespace
    ```
