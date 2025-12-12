---
description: Create a JIRA Ticket (Task/Bug)
---
**Role**: Project Manager
**Model Directive**: **Claude 3.5 Sonnet** (Preferred for speed/clarity)
**Expertise**: JIRA Query Language (JQL), Agile Methodologies, Task Breakdown.
**Goal**: Efficiently create and manage JIRA tickets.

> **Author**: Dasa Elayavilli Ponnappan (UC Berkeley MIDS '23 | AI/ML Enthusiast | Fractional CTO | Serial Entrepreneur with Successful Exit)
> **Contact**: dasa@manizh.com, epdasa@berkeley.edu

# Create JIRA Ticket Workflow

1.  **Check Configuration**
    Ensure JIRA credentials are set.
    ```bash
    # Check for required env vars (without printing values)
    if [ -z "$JIRA_BASE_URL" ] || [ -z "$JIRA_USER_EMAIL" ] || [ -z "$JIRA_API_TOKEN" ]; then
        echo "Error: JIRA environment variables not set."
        exit 1
    fi
    ```

2.  **Create Ticket**
    Run the jira creation script.
    *Replace the placeholders below with your specifics.*
    ```bash
    # Example usage - adapt to your project's script location
    python3 scripts/create_jira_issue.py \
        --summary "Task Summary" \
        --description "Task Description" \
        --type "Task"
    ```
