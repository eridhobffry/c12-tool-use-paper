# C12 — Tool Use and Interactive LLM Agents (seminar paper)

UHH seminar "Understanding Large Language Models", WiSe 2026/27. Due 22 Nov 2026, 23:59.

## Setup (macOS)
```sh
brew install tectonic
```
Editor: VS Code or Cursor + extension **LaTeX Workshop** (`james-yu.latex-workshop`). Builds on save via `.vscode/settings.json`.

## Use
- `make pdf` / `make check` (fails if body > 4 pages) / `make watch`
- Write in `paper/main.tex`, cite from `paper/refs.bib`, log AI use in `notes/ai-log.md`.
- CI builds the PDF on every push (Actions → artifact `paper`).

Template: `template/` = upstream [acl-org/acl-style-files](https://github.com/acl-org/acl-style-files), untouched.
