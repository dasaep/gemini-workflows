# Gemini Workflows for AntiGravity

**Author:** Dasa Elayavilli Ponnappan | UC Berkeley MIDS '23 (AI/ML Enthusiast - Hands on Engineer- epdasa@berkeley.edu)

This repository contains a collection of **Agentic Workflows** designed to supercharge development within the **AntiGravity** AI environment. These workflows encapsulate expert knowledge, security auditing, and deployment automation into reusable, interactive checklists that the AI Agent follows step-by-step.

## 🚀 Installation & Usage

To use these workflows in your project:

1.  **Locate your Agent Configuration**: Find your project's `.agent/workflows` directory (create it if it doesn't exist).
2.  **Import Workflows**: Copy the desired `.md` files from this repository into your project's `.agent/workflows/` folder.
    ```bash
    cp /path/to/gemini-workflows/*.md /path/to/your-project/.agent/workflows/
    ```
3.  **Invoke in AntiGravity**:
    *   Simply ask the agent to run the workflow by name or description.
    *   **Interactive Mode**: The agent will read the workflow file and execute it step-by-step, acting as a specialized expert.

    > **Example Prompt:** "Run the frontend security audit" or "Act as the Backend Expert to design this API".

---

## 📂 Workflow Catalog

### 🧠 Expert Personas (Sub-Agents)
These workflows transform the generalist agent into a specialized engineer with specific standard operating procedures (SOPs).

*   **[`agent_frontend_expert.md`](agent_frontend_expert.md)**
    *   **Role**: Senior Frontend Engineer & UI/UX Specialist.
    *   **Capabilities**: Advanced React/Next.js, Tailwind CSS design systems, Accessibility (A11y) audits, Core Web Vitals optimization.
    *   **Invocation**: "Act as the Frontend Expert" or "Refactor this component as the frontend expert".

*   **[`agent_backend_expert.md`](agent_backend_expert.md)**
    *   **Role**: Senior Backend Engineer & System Architect.
    *   **Capabilities**: API Design (FastAPI/Django), Database Architecture (SQL/NoSQL), System Scalability, API Security.
    *   **Invocation**: "Act as the Backend Expert" or "Design the database schema for this feature".

*   **[`agent_infrastructure_expert.md`](agent_infrastructure_expert.md)**
    *   **Role**: Cloud Architect & DevOps Engineer.
    *   **Capabilities**: Terraform/Terragrunt auditing, GKE optimization (Preemptible nodes, Autoscaling), Cloud Security (IAM, WAF, Private clusters).
    *   **Invocation**: "Run an infrastructure audit" or "Review my Terraform code".

### 🛡️ Security & Auditing
Chained workflows that ensure code quality and security compliance before merging or deploying.

*   **[`audit_backend_security.md`](audit_backend_security.md)**
    *   **Details**: Performs SAST (Bandit), Dependency Scanning (Safety/Pip-audit), Secret Detection, and internal compliance checks.
    *   **Invocation**: "Run a backend security audit".

*   **[`audit_frontend_security.md`](audit_frontend_security.md)**
    *   **Details**: Audits NPM dependencies (`npm audit`), checks for XSS vulnerabilities, verifies Content Security Policy (CSP) headers.
    *   **Invocation**: "Run a frontend security audit".

*   **[`audit_backend_functional.md`](audit_backend_functional.md) / [`audit_frontend_functional.md`](audit_frontend_functional.md)**
    *   **Details**: Verifies that new changes meet the original business goals and do not break existing functionality (User Flows, API Contracts).
    *   **Invocation**: "Run a functional audit".

*   **[`audit_backend_technical.md`](audit_backend_technical.md) / [`audit_frontend_technical.md`](audit_frontend_technical.md)**
    *   **Details**: Code quality checks, linting, performance profiling, and maintainability scores.
    *   **Invocation**: "Run a technical audit".

### ⚡ Skills & Automation
Quick, tactical workflows for specific repeated tasks.

*   **[`skill_code_review.md`](skill_code_review.md)**
    *   **Details**: A lightweight code review skill that checks for style, typos, and basic logic errors. Simulates the 'Code Reviewer' skill.
    *   **Invocation**: "Review this file" or "Run code review skill".

*   **[`skill_test_gen.md`](skill_test_gen.md)**
    *   **Details**: detailed test scaffolding. Detects the framework (Jest/Pytest) and generates Happy Path, Error, and Edge case tests.
    *   **Invocation**: "Generate tests for this function".

*   **[`create_jira_ticket.md`](create_jira_ticket.md)**
    *   **Details**: interactive workflow to create JIRA tickets from within the IDE. Requires `JIRA_API_TOKEN` env var.
    *   **Invocation**: "Create a Jira ticket for this bug".

### 🚀 Deployment Pipelines
End-to-end deployment orchestration that prevents bad code from reaching production.

*   **[`backend_deploy.md`](backend_deploy.md)**
    *   **Flow**: Security Audit -> Functional Audit -> Technical Audit -> Docker Build -> Kubernetes Rollout.
    *   **Invocation**: "Deploy the backend".

*   **[`frontend_deploy.md`](frontend_deploy.md)**
    *   **Flow**: Security Audit -> Functional Audit -> Technical Audit -> Build -> Deploy.
    *   **Invocation**: "Deploy the frontend apps".

---

## 🏗️ Architecture

These workflows are utilizing the **Gemini 2.0 Agentic Capabilities**. They are defined as Markdown files, making them:
1.  **Human Readable**: Easy to edit and understand.
2.  **LLM Native**: The agent ingests them as instructions.
3.  **Portable**: Just copy files to share expertise.

*Created with ❤️ by Dasa Elayavilli Ponnappan*
