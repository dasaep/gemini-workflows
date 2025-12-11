---
description: Audit Frontend Technical Quality (Performance, Mobile-First, Compatibility)
---

# Frontend Technical Audit Workflow

1.  **Dependency Security Audit**
    Check npm dependencies for vulnerabilities.
    ```bash
    cd [app-1]
    npm audit
    ```

2.  **Performance (Lighthouse)**
    Instruct user to run Lighthouse devtools or CLI.
    *   [ ] First Contentful Paint (FCP) < 1.5s?
    *   [ ] Large Contentful Paint (LCP) < 2.5s?
    *   [ ] Cumulative Layout Shift (CLS) < 0.1?

3.  **Mobile Responsiveness**
    Review Tailwind CSS classes for responsive prefixes.
    *   [ ] Are `grid-cols-1 md:grid-cols-2 lg:grid-cols-3` used correctly in `ConditionGrid.tsx`?
    *   [ ] Do navigation menus collapse on mobile?

4.  **Code Optimization**
    *   **Lazy Loading**: Are components/images lazy loaded? (`next/image` usage)
    *   **Bundle Size**: Check import costs (e.g., typically large libraries).
    *   **React Best Practices**: Check for `useMemo`, `useCallback` appropriately used to prevent re-renders.

5.  **Browser Compatibility**
    *   Ensure no experimental APIs are used without polyfills.
