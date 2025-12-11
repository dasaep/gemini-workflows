---
description: Audit Backend Functionality, Goals, and Extensibility
---

# Backend Functional Audit Workflow

1.  **Goal Intactness Review**
    Compare current implementation against `REQUIREMENTS_SPEC.md`.
    *   Does the `[core_service].py` implemented match the spec in Section 5.3?
    *   Are the Database schemas consistent with the requirements?

2.  **API Contract Verification**
    Review `router.py` files to ensure endpoints meet the functional needs.
    *   [ ] `/generate` endpoint for imaging.
    *   [ ] `/diagnose` endpoint for vision.
    *   [ ] `/chat` endpoint for RAG.

3.  **Extensibility Check**
    Analyze code structure for modularity.
    *   Can we swap the AI provider easily? (Check `provider_service.py`)
    *   Can we change the Database? (Check `db_loader.py`)

4.  **DRY (Don't Repeat Yourself)**
    *   Check for common utilities that should be extracted.
    *   Check if DB connection logic is centralized (Singleton pattern).
