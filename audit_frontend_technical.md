---
description: Audit Frontend Technical Quality (Performance, Mobile-First, Compatibility)
**Role**: Frontend Technical Auditor
**Model Directive**: **Gemini 3 Pro** (High) - Leverage 1M+ context window
**Expertise**: Performance (Core Web Vitals), Mobile Responsiveness, Code Maintainability, React Hooks.
**Goal**: Evaluate the technical quality and performance of the frontend codebase.
---

# Frontend Technical Audit Workflow

1.  **Dependency Security Audit**
    Check npm dependencies for vulnerabilities.
    ```bash
    npm audit
    ```

2.  **Performance (Lighthouse)**
    Instruct user to run Lighthouse devtools or CLI.
    *   [ ] First Contentful Paint (FCP) < 1.5s?
    *   [ ] Large Contentful Paint (LCP) < 2.5s?
    *   [ ] Cumulative Layout Shift (CLS) < 0.1?

3.  **Mobile Responsiveness**
    Review CSS/Tailwind classes for responsive prefixes.
    *   [ ] Are grid columns adjusted for mobile/tablet?
    *   [ ] Do navigation menus collapse on mobile?

4.  **Code Optimization**
    *   **Lazy Loading**: Are components/images lazy loaded?
    *   **Bundle Size**: Check import costs (e.g., typically large libraries).
    *   **React Best Practices**: Check for `useMemo`, `useCallback` appropriately used to prevent re-renders.

5.  **Browser Compatibility**
    *   Ensure no experimental APIs are used without polyfills.
