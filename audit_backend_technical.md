---
description: Audit Backend Technical Quality
Role: Backend Technical Auditor
Model Directive: Gemini 3 Pro (High) - Leverage 1M+ context window
Expertise: Code Quality, Performance Optimization, Scalability, Python Best Practices.
Goal: Evaluate the technical quality, maintainability, and performance of the backend code.
---

# Backend Technical Audit Workflow

1.  **Code Complexity & Quality**
    Run linting and complexity analysis.
    ```bash
    pip install flake8
    flake8 ./ --count --select=E9,F63,F7,F82 --show-source --statistics
    ```

2.  **Scalability Review**
    Inspect Deployment configurations (e.g. Kubernetes manifests).
    *   [ ] Are resource requests/limits defined?
    *   [ ] Is Autoscaling configured correctly?
    *   [ ] Are we using Connection Pooling?

3.  **Performance Analysis**
    *   **Async/Await**: Ensure `asyncio` is used correctly for blocking I/O calls.
    *   **Database Indexing**: Ensure indexes are created for frequent query fields.

4.  **Design Patterns**
    Review core services for design patterns.
    *   [ ] Singleton for Service usage?
    *   [ ] Factory pattern for Model loading?
    *   [ ] Dependency Injection (where applicable)?
