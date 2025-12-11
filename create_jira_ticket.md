---
description: Create a JIRA Ticket (Task/Bug)
---

# Create JIRA Ticket Workflow

1.  **Check Configuration**
    Ensure JIRA credentials are set.
    ```bash
    # Check for required env vars (without printing values)
    if [ -z "$JIRA_BASE_URL" ] || [ -z "$JIRA_USER_EMAIL" ] || [ -z "$JIRA_API_TOKEN" ]; then
        echo "Error: JIRA environment variables not set."
        echo "Please set JIRA_BASE_URL, JIRA_USER_EMAIL, JIRA_API_TOKEN, and JIRA_PROJECT_KEY in your .env"
        exit 1
    fi
    ```

2.  **Create Ticket**
    Run the python helper script.
    *Replace the placeholders below with your specifics.*
    ```bash
    python3 [path_to_scripts]/create_jira_issue.py \
    --project "[PROJECT_KEY]" \  --summary "Audit Finding: Optimization required for Frontend Images" \
        --description "The Technical Audit revealed that next/image is not used. Performance can be improved by migrating from standard img tags." \
        --type "Task"
    ```
