---
description: Deploy Frontend Apps (Web Apps) with Integrated Audits
---

# Frontend Deployment Pipeline

## Phase 1: security_audit
1.  **Vulnerability & XSS Scan**
    ```bash
    echo "--- Security Audit: App 1 ---"
    cd [app-1] && npm audit --production && cd ..
    
    echo "--- Security Audit: App 2 (Optional) ---"
    cd [app-2] && npm audit --production && cd ..
    
    echo "--- XSS Check ---"
    grep -r "dangerouslySetInnerHTML" [app-1]/src/ [app-2]/src/
    ```

2.  **Config Check**
    *   [ ] Verify `next.config.js` CSP headers.
    *   [ ] Ensure no secrets in `NEXT_PUBLIC_` env vars.

## Phase 2: functional_audit
3.  **UX Flow Verification**
    *   [ ] **App 1**: Verify core user flows.
    *   [ ] **App 2**: Verify core user flows.

4.  **Feature Parity Check**
    *   [ ] Ensure data consistency between apps.

## Phase 3: technical_audit
5.  **Lint & Type Check**
    ```bash
    cd [app-1]
    # // turbo
    npm run lint
    tsc --noEmit
    cd ..
    ```
    
6.  **Build Verification**
    Ensure production builds succeed (catch build-time errors).
    ```bash
    echo "Building App 1..."
    cd [app-1] && npm run build && cd ..
    ```

## Phase 4: deploy
7.  **Build & Push Docker Images**
    *Note: Requires Docker credentials.*
    ```bash
    # App 1
    # docker build -t [registry]/[project]/[app-1]:latest [app-1]/
    # docker push [registry]/[project]/[app-1]:latest
    ```

8.  **Rolling Update**
    Restart frontend deployments.
    ```bash
    # // turbo
    kubectl rollout restart deployment [deployment-name] -n [namespace]
    ```

9.  **Verify Deployment**
    ```bash
    kubectl get pods -n [namespace]
    ```
