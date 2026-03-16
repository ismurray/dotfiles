# User-Level Claude Code Instructions

## Tool Usage

Never use `find`, `grep`, `cat`, `head`, `tail`, `sed`, or `awk` via the Bash tool for file search or content reading. Always use the dedicated Glob, Grep, and Read tools instead. These are faster, require no permissions, and avoid security warning prompts caused by backslash-escaped shell operators.
