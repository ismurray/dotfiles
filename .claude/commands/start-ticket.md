# Start Ticket

Read a JIRA ticket and create a feature branch with an implementation plan.

## Steps

1. **Read the JIRA Ticket**
   - Fetch the specified ticket using Atlassian MCP or acli
   - Extract ticket number, title, description, and acceptance criteria

2. **Create Feature Branch**
   - Fetch latest main: `git fetch origin main`
   - Create branch from main: `git checkout -b <TICKET>-<short-description> origin/main`
   - Branch naming: `BUAPP-1234-add-user-preferences` (lowercase, hyphenated)

3. **Analyze Implementation**
   - Examine the ticket contents thoroughly
   - Search relevant areas of the codebase for patterns and existing implementations
   - Consider Rails best practices and project conventions
   - **DO NOT make any code changes yet**

4. **Propose Implementation Plan**
   - Present a step-by-step approach to implementing the ticket
   - Include files that will be modified or created
   - Note any potential risks or dependencies
   - Wait for user approval before proceeding

5. **Document Plan**
   - If approved, create `development_notes/<TICKET>-<feature-name>.md`
   - Document the agreed implementation approach
   - Include key decisions and rationale

## Notes

- Always wait for plan approval before writing any code
- Examine existing patterns in the codebase before proposing new abstractions
- Document any assumptions that need user confirmation

## Task

$ARGUMENTS
