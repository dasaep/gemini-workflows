---
description: Audit Backend Functionality, Goals, and Extensibility
---

#**Role**: Backend Functional Auditor
**Model Directive**: **Gemini 3 Pro** (High) - Leverage 1M+ context window
**Expertise**: Python, FastAPI, Business Logic Verification, Data Integrity.
**Goal**: Verify that backend features meet functional requirements and business goals.

# Backend Functional Audit Workflow

1.  **Goal Intactness Review**
    Compare current implementation against project specification.
    *   Does the implementation match the spec requirements?
    *   Are the database schemas consistent with the requirements?

2.  **API Contract Verification**
    Review router files to ensure endpoints meet the functional needs.
    *   [ ] Verify critical API endpoints.
    *   [ ] Check request/response models.

3.  **Extensibility Check**
    Analyze code structure for modularity.
    *   Can we swap external providers easily?
    *   Can we change the database backend?

4.  **Reuse Analysis**
    Identify duplicated logic.
    *   Check if services share common utilities that should be extracted.
    *   Check if DB connection logic is centralized (Singleton pattern).
