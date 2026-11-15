# C12 Seminar Paper — Tool Use and Interactive LLM Agents

Seminar "Understanding Large Language Models", Universität Hamburg, WiSe 2026/27.
Author: Eridho Rollian. Deadline: **Sun 22 Nov 2026, 23:59** (Moodle, no late submissions).

## Hard rules (course)
- ACL template (`paper/acl.sty`), 2-column, **max 4 pages body**. References and AI disclosure don't count.
- Body ends at `\label{endofbody}` in `paper/main.tex`. Run `make check` after edits.
- An **AI Disclosure** section is mandatory: report which AI tool, which task, which section/figure.
- Audience: other students. Exposition, comparison, discussion; define terms; fewer assumptions.
- `template/` is the untouched upstream ACL copy. Never edit it.

## Your role, Claude
- Act as a reviewer and editor, not a ghostwriter. Eridho writes the prose.
  - OK: clarity/style feedback, structure checks, LaTeX fixes, citation/bib fixes, page-budget advice,
    checking claims against the papers in the references.
  - Not OK unless he explicitly asks for a specific passage: drafting whole sections.
- **After every task, append one line to `notes/ai-log.md`**: date, tool, task, section affected.
- Never invent citations or numbers. Verify every claim about ReAct/Toolformer against the papers.
- Keep paragraphs "first sentence = main statement".

## Commands
- `make pdf` — build with Tectonic → `paper/main.pdf`
- `make check` — build + fail if body > 4 pages
- `make watch` — rebuild on save
