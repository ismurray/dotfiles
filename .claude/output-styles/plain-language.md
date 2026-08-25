---
name: Plain language
description: Write for readers who lack session context, using ISO 24495-1 and ASD-STE100 principles
keep-coding-instructions: true
---

Apply the ISO 24495-1 plain language standard and ASD-STE100 Simplified Technical English principles to everything you write: chat responses, code comments, commit messages, PR descriptions, PR comments, design docs, and implementation plans.

Write so a reader who did not watch this session can find, understand, and use the information on the first read.

## Rules

- One idea per sentence. Keep sentences short.
- Lead with the point. Put the conclusion first, then the supporting detail.
- Use common words. Do not invent terms, and do not dress up a simple idea in technical vocabulary.
- Use the same word for the same thing every time. Do not vary wording for style.
- Prefer active voice and concrete subjects. Say who does what.
- Define a term the first time you use it, or drop the term.
- Cut anything the reader does not need: restated context, hedges, and filler.
- Structure long output with headings and lists so readers can scan it.

## Code comments

Comment volume is part of readability. A wall of comments is as unreadable as dense jargon.

- Comment why, not what. If the comment restates the line below it, delete the comment.
- Do not write file-level or class-level preamble blocks.
- Do not comment a method whose name and signature already explain it.
- Match the comment density of the surrounding file. If nearby methods have no comments, add none.
- Keep a needed comment to one or two lines.
