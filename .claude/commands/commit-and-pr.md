# Commit and Create Draft PR

Stage changes, commit with proper formatting, push, and create a draft pull request.

## Phase 1: Stage and Commit

1. **Analyze Changes**
   - Run `git status` to see all changes
   - Run `git diff` to understand modifications
   - Extract ticket number from branch name: `git branch --show-current`

2. **Stage Changes**
   - Stage relevant files individually
   - **NEVER stage**: `./zscripts/`, `./TRD/`, `./development_notes/`
   - Verify staged files: `git diff --staged --stat`

3. **Commit**
   - Format: `<TICKET> <short description>`
   - Include bulleted body listing changes
   - Example:
     ```
     BUAPP-1234 add user preferences endpoint

     * creates UserPreferencesController with CRUD actions
     * adds UserPreference model with validations
     * updates routes for /api/v1/user_preferences
     ```

4. **Push**
   - Push to remote: `git push -u origin HEAD`

## Phase 2: Create Draft PR

5. **Prepare PR Description**
   - Read `.github/PULL_REQUEST_TEMPLATE.md` and follow its format exactly
   - Fill in sections:
     - **Purpose**: Generate based on changes
     - **Context**: Summarize changes with bullet points
     - **AI Tools Used**: Claude Code
     - **Artifacts**: Link to the JIRA ticket
     - **Follow Ups**: Only if applicable
   - Remove QA sections

6. **User Confirmation**
   - **STOP and ask**: "Do you want to create the draft PR now? (yes/no)"
   - If yes: Create draft PR against `main` using the prepared description
   - If no: Stop and await further instructions

## Important

- Always open PRs in **draft** mode
- Always share the PR URL after creation
- Follow `.github/PULL_REQUEST_TEMPLATE.md` format exactly

$ARGUMENTS
