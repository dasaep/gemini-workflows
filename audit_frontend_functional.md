---
description: Audit Frontend Functionality and UX Flows
---

# Frontend Functional Audit Workflow

1.  **UX Flow Verification**
    Walk through the critical user paths in `[app-name]`.
    *   [ ] **Onboarding**: Does the user land on a dashboard?
    *   [ ] **Feature 1**: Can user interact with the main feature? (Check `[feature]/page.tsx`)
    *   [ ] **Library**: Can user view the dataset?

2.  **Feature Parity Check**
    Ensure the frontend exposes all available backend features.
    *   If Backend has "DeepSeek" generation, is it in the dropdown?
    *   If Backend has "Severity" scoring, is it displayed?

3.  **Error Handling Review**
    *   [ ] How are 402/500 errors displayed? (Toast vs Banner)
    *   [ ] Is there a loading state for every async action?

4.  **Accessibility (a11y) Check**
    *   [ ] Are `alt` tags present on generated images?
    *   [ ] Are form labels associated with inputs?
