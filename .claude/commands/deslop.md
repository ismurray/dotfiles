# Remove AI Code Slop

Check the diff against main and remove all AI-generated slop introduced in this branch.

Run `git diff main...HEAD` to see all changes on this branch.

Remove the following types of slop:

- **Unnecessary comments**: Extra comments that a human wouldn't add, or comments that are inconsistent with the commenting style in the rest of the file. Comments that just narrate what the code does rather than explaining why.
- **Defensive overkill**: Extra defensive checks, nil guards, try/catch blocks, or error handling that is abnormal for that area of the codebase — especially if called by trusted or already-validated codepaths.
- **Type escape hatches**: Casts to `any` or equivalent hacks to work around type issues instead of fixing them properly.
- **Style inconsistencies**: Any code style, naming, or patterns that are inconsistent with the surrounding file or codebase conventions.
- **Over-engineering**: Unnecessary abstractions, helper methods for one-time operations, or excessive configuration for simple tasks.

After making changes, report only a 1-3 sentence summary of what you changed.

$ARGUMENTS
