# User-Level Claude Code Instructions

## Writing Style

Apply the ISO 24495-1 plain language standard and ASD-STE100 Simplified Technical English principles to everything you write: chat responses, code comments, commit messages, PR descriptions, PR comments, and design docs. Write short sentences with one idea each. Lead with the point. Use common words and the same term for the same thing every time. Do not invent jargon.

Code comments: explain why, not what. Do not write file-level or class-level preamble blocks, and do not comment a method whose name already explains it. Match the comment density of the surrounding file.

## Tool Usage

Never use `find`, `grep`, `cat`, `head`, `tail`, `sed`, or `awk` via the Bash tool for file search or content reading. Always use the dedicated Glob, Grep, and Read tools instead. These are faster, require no permissions, and avoid security warning prompts caused by backslash-escaped shell operators.
