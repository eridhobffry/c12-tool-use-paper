# Table 9 composition paragraph

Created: 2026-11-22

Checked against Toolformer Table 9 (arXiv:2302.04761, T-REx columns) on 22 Nov 2026. The six cells in the draft match the table. Eridho writes the sentences. This is the edit order for that paragraph only.

## Printed cells (Table 9, T-REx)

| k | % with a call | All | AC | NC |
|---|---:|---:|---:|---:|
| 3 | 82.8 | 52.9 | 58.0 | 29.0 |
| 10 | 98.1 | 53.5 | 54.0 | 22.5 |

AC is accuracy on examples with a call. NC is accuracy on examples without one. The % column is the share of examples with an API call. Evaluation allows at most one call per input, so this is a share of examples, not a token or money cost.

## Arithmetic to print

| Quantity | Figure | How to say it |
|---|---|---|
| Newly called share | 98.1 − 82.8 = 15.3 | 15.3 percentage points |
| Uncalled at k=3 | 17.2 | derived, not a printed cell |
| Never called at k=10 | 1.9 | derived, not a printed cell |
| Score with a call | (98.1 × 54.0 − 82.8 × 58.0) / 15.3 = 32.35 | about 32.4 |
| Score without a call | (17.2 × 29.0 − 1.9 × 22.5) / 15.3 = 29.81 | about 29.8 |
| Gain | 2.55 | about 2.5 percentage points, not 2.55 |
| Rounding band | ±0.05 on each of the six cells; corners 1.71 and 3.37 | about 1.7 to 3.4 |

The formulas stay in `notes/handoff-2026-11-20.md`. They do not go in the body.

## Three changes before the paragraph is frozen

1. Print **about 29.8** and **about 32.4**, not about 30% and about 32%. At zero decimals, 29.8 becomes 30, which sits on top of the printed NC cell 29.0. One decimal matches the table and keeps the residual distinct from that cell and from 34.9 (every example, calls disabled).
2. Quote the **0.6** from the All column (53.5 − 52.9). Overall accuracy is the weighted average of the two groups in exact arithmetic. The one-decimal cells multiply back to **53.0** at k=3 and **53.4** at k=10, so the body takes 0.6 from the All column.
3. Put **both assumptions in the same sentence as the estimate**. “Harder” comes after that sentence. It means the residuals (about 29.8 and about 32.4) lie well below the 58.0 of the questions already called at k=3, and that comparison uses the assumptions. Table 9 does not confirm either assumption: that questions called at k=3 are still called at k=10 and still score 58.0, and that the 1.9% never called already scored 22.5 at k=3.

## What stays labeled as Eridho’s inference

- The two residuals, the gain of about 2.5, and the band 1.7 to 3.4.
- “Harder.”
- The line that this is a net figure, so it cannot separate questions a call fixes from questions it breaks.

“By my own estimate” is the right label. Schick et al. do not report these residuals.

## What is the paper’s, and can be cited as Table 9

- Call share 82.8% to 98.1%, overall accuracy 52.9 to 53.5, AC 58.0 to 54.0, NC 29.0 to 22.5.
- The mix reading that does not need the assumptions: both group rates fall while the All column rises, because overall accuracy is the weighted average and the weight shifts toward the called group. That is not evidence that calls became less effective.

## Two sentences, in this order

Discussion is budgeted at 1.0 page (`notes/outline.md`) and also holds the comparison table, selective calling, and the fix/break point. The pasted paragraph is one block of a bit over 200 words. Fit it in two sentences. The first sentence of each states the point.

- **Sentence 1, composition.** AC falls from 58.0 to 54.0 and NC from 29.0 to 22.5, while All rises from 52.9 to 53.5, as the called share moves from 82.8% to 98.1%. Overall accuracy is the weighted average of the two groups, so the drop in the group rates is not evidence that calls became less effective.
- **Sentence 2, your inference.** Name both unconfirmed assumptions first. Then the newly called 15.3% score about 29.8 without a call and about 32.4 with one, a gain of about 2.5 percentage points (about 1.7 to 3.4 from rounding). They lie well below 58.0, so they look harder. The figure is a net.

Use “percentage points” for 15.3, 0.6, and 2.5. Define *k* once, at first use: the model may start a call when the API token is among the *k* most likely next tokens (Toolformer §4.2 and §5). If the Toolformer section defines *k* first, this paragraph does not define it again.

## Where the number sits

- The comparison-table cell keeps the composition clause only. About +2.5, the band, and “newly called” stay in sentence 2. The cell is marked as Eridho’s interpretation.
- The conclusion names the nesting assumption. It does not restate +2.5. That limitations line is already in `notes/outline.md`.
- Leave WebQS out of this paragraph. Leave §4.2.1’s 98.1% out of it as well: that sentence is the share that use the QA tool, plus 0.7% on another tool and 1.2% on none. Table 9’s 98.1% is the T-REx share with any API call at k=10.

## After the paragraph is in `paper/main.tex`

Run `make check`. The body must still end by page 4. This plan does not add prose to `paper/main.tex`.
