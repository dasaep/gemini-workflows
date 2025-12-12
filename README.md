# Gemini Workflows: Agentic Software Development

**A Multi-LLM Workflow Suite for the AntiGravity IDE.**

This toolkit provides a set of specialized, "best-in-class" agentic workflows designed to leverage the unique strengths of the three leading AI models: **Claude Opus 4.5**, **GPT-5.2**, and **Gemini 3 Pro**.

## 🧠 The "Big Three" Strategy

Instead of using a single model for all tasks, these workflows assign the right "brain" to the right job:

| Role | Agent | Model | Why? |
| :--- | :--- | :--- | :--- |
| **Lead Engineer** | `/agent_backend_expert` | **Claude Opus 4.5** | **80.9% SWE-bench score**. Best for deep coding, refactoring, and logical correctness. |
| **Frontend Expert** | `/agent_frontend_expert` | **Claude Opus 4.5** | Handles complex React state, hooks, and large-scale refactors with high precision. |
| **Project Manager** | `/create_jira_ticket` | **Claude 3.5 Sonnet** | Fast, concise, and excellent at natural language task breakdown. |
| **Infra Architect** | `/agent_infrastructure_expert` | **GPT-5.2 (Thinking)** | **"Thinking" Mode** excels at orchestration, distributed systems logic, and avoiding race conditions. |
| **Chief Auditor** | `/agent_audit_expert` | **Gemini 3 Pro** | **1M+ Token Context**. Can read *entire* repositories and logs to find subtle security/compliance issues. |

## 📂 Workflow Manifest

*   `agent_backend_expert.md`: Backend implementations (Python/Go/Node).
*   `agent_frontend_expert.md`: Frontend implementations (TSX/React).
*   `agent_infrastructure_expert.md`: Cloud & DevOps (Terraform/K8s).
*   `agent_audit_expert.md`: Full-repo security & compliance audits.
*   `audit_backend_functional.md`: Backend functional goal verification.
*   `audit_backend_security.md`: Backend security & HIPAA checks.
*   `audit_backend_technical.md`: Backend code quality & metrics.
*   `audit_frontend_functional.md`: Frontend UX flow verification.
*   `audit_frontend_security.md`: Frontend XSS & dependency checks.
*   `audit_frontend_technical.md`: Frontend performance & compatibility.
*   `skill_code_review.md`: Automated code quality checks (Opus 4.5).
*   `skill_test_gen.md`: Automated test case generation (Opus 4.5).
*   `create_jira_ticket.md`: Jira ticket creation helper (Sonnet 3.5).
*   `backend_deploy.md`: Production deployment orchestration pipeline.

## 🚀 Usage

Import these workflows into your `.agent/workflows` directory to instantly upgrade your AntiGravity IDE agent with specialized personas.

*"The future of coding isn't one model—it's a team."*
