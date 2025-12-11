---
description: Audit Backend Technical Quality (Performance, Scalability, Design)
---

# Backend Technical Audit Workflow

1.  **Code Complexity & Quality**
    Run linting and complexity analysis.
    ```bash
    pip install flake8
    flake8 [src_dir]/ --count --select=E9,F63,F7,F82 --show-source --statistics
    ```

2.  **Scalability Review (Kubernetes)**
    Inspect `api-deployment.yaml` and `HorizontalPodAutoscaler`.
    *   [ ] Are resource requests/limits defined?
    *   [ ] Is HPA configured correctly (CPU/Memory triggers)?
    *   [ ] Are we using Connection Pooling for Neo4j/Redis?

3.  **Performance Analysis**
    *   **Async/Await**: Ensure `asyncio` is used correctly in `[async_service].py` for blocking I/O calls (API requests).
    *   **Database Indexing**: Check `[db_loader].py` to ensure indexes are created for frequent query fields.

4.  **Design Patterns**
    Review core services for design patterns.
    *   [ ] Singleton for Service usage?
    *   [ ] Factory pattern for Model loading?
    *   [ ] Dependency Injection (where applicable)?
