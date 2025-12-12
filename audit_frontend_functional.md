---
description: Audit Frontend Functionality and UX Flows
---

> **Author**: Dasa Elayavilli Ponnappan (UC Berkeley MIDS '23 | AI/ML Enthusiast | Fractional CTO | Serial Entrepreneur with Successful Exit)
> **Contact**: dasa@manizh.com, epdasa@berkeley.edu

# Frontend Functional Audit Workflow
**Model Directive**: **Gemini 3 Pro** (High) - Leverage 1M+ context window
**Expertise**: React, Next.js, User Flows, Accessibility (a11y).
**Goal**: Verify that the frontend UI/UX meets functional requirements and user expectations.

1.  **UX Flow Verification**
    Walk through the critical user paths.
    *   [ ] **Onboarding**: Does the user land on the correct start page?
    *   [ ] **Core Interaction**: Can user perform the main task (e.g. generation, submission)?
    *   [ ] **Data View**: Can user view the results/dashboard?

2.  **Feature Parity Check**
    Ensure the frontend exposes all available backend features.
    *   Are all API options available in the UI?
    *   Are status indicators displayed correctly?

3.  **Error Handling Review**
    *   [ ] How are 4xx/5xx errors displayed? (Toast vs Banner)
    *   [ ] Is there a loading state for every async action?

4.  **Accessibility (a11y) Check**
    *   [ ] Are `alt` tags present on images?
    *   [ ] Are form labels associated with inputs?
