# Setup Guide: Gemini Workflows

Follow these steps to integrate the Multi-LLM Agentic Workflows into your project.

## 1. Installation

Copy the workflow markdown files from this directory into your project's `.agent/workflows/` folder.

```bash
mkdir -p .agent/workflows
cp tools/gemini-workflows/*.md .agent/workflows/
```

## 2. API Configuration

To enable the specialized models, ensure your IDE or Environment is configured with the following API keys:

*   **Anthropic API Key** (`ANTHROPIC_API_KEY`): Required for **Claude Opus 4.5** (Backend) and **Sonnet** (Frontend).
*   **OpenAI API Key** (`OPENAI_API_KEY`): Required for **GPT-5.2 Thinking** (Infrastructure).
*   **Google AI Key** (`GOOGLE_API_KEY`): Required for **Gemini 3 Pro** (Auditing).

## 3. Usage in AntiGravity

Once installed, simply use the slash commands in your chat interface to invoke the specific expert:

*   **Need a complex refactor?** -> Use `/agent_backend_expert`
*   **Debugging a Terraform state lock?** -> Use `/agent_infrastructure_expert`
*   **Reviewing the whole repo for security?** -> Use `/agent_audit_expert`

## 4. Customization

You can edit the `.md` files to tailor the `Expertise` and `Goal` sections to your specific project needs (e.g., adding specific tech stack details like Django, AWS, Vue.js, etc.).

## ✍️ Author & Credits

**Dasa Elayavilli Ponnappan**
*UC Berkeley MIDS '23 | AI-ML Enthusiast | Fractional CTO | Serial Entrepreneur with Successful Exit*

📧 **Contact**: [dasa@manizh.com](mailto:dasa@manizh.com), [epdasa@berkeley.edu](mailto:epdasa@berkeley.edu)
