# Outline — main statements

Research question: How does tool use affect answer accuracy in ReAct and Toolformer, and how do these benefits relate to tool-call frequency and the number of samples?

The earlier question, whether tool use improves answers enough to justify its cost, is dropped. Neither paper measures tokens, latency, or money, so that wording cannot be answered from them.

Page budget (4 pages, 2 columns): Intro 0.6 · Background 0.4 · ReAct 0.8 · Toolformer 0.8 · Discussion 1.0 · Conclusion 0.3

The abstract sits on page 1, before the introduction, and counts toward the 4 pages. The intro budget shares that page with it.

Fill one sentence per paragraph first; expand later. Keep the abstract in step with the paper: update it when the question, the comparison, or the finding changes.

Working plan: `notes/handoff-2026-11-20.md`. Numbers below were checked against the ReAct (arXiv 2210.03629v3) and Toolformer (arXiv 2302.04761v1) PDFs on 21 Nov 2026; the PDFs are not in this repo. SMART's tool-overuse definition (its §3) was checked against the arXiv HTML.

## Abstract
Unnumbered. One paragraph, at most 200 words (ACL). Thesis and conclusions, not a section outline.

- [ ] Problem: A tool call can change whether the answer is right, and both papers leave the token, latency, and money cost of that call unmeasured.
- [ ] What is compared: The paper compares prompted tool use in ReAct with trained tool use in Toolformer.
- [ ] Main finding: Accuracy gains depend on the task and shrink once most examples already receive a call, so the decision to call matters, and resource cost stays unmeasured.

## 1. Introduction
- [ ] Problem: A wrong weekday or a missed product such as 347×89 is the sort of slip a tool can catch, and the person waiting still spends time and money on every call.
- [ ] Objective / research question: How does tool use affect answer accuracy in ReAct and Toolformer, and how do these benefits relate to tool-call frequency and the number of samples?
- [ ] What this paper does: It reads both papers under that question, keeps task success separate from resource cost, and reanalyses Toolformer's Table 9.
- [ ] Outline: The paper defines tool use and where cost is paid, reports ReAct and then Toolformer, and compares what each paper actually measured.

## 2. Background
- [ ] Tool use means the model calls an external function for a result it does not compute itself, and chain-of-thought is the no-tool reasoning baseline both papers use.
- [ ] A call requires four decisions: whether to call, which tool, which arguments, and how to use the returned result.
- [ ] ReAct pays its cost on each query, while Toolformer pays an up-front training cost and then a further cost on each call.
- [ ] Task success and resource cost need separate measures, because money, tokens, calls, latency, and compute are not the same quantity.

## 3. ReAct
- [ ] Idea: ReAct's benefit depends on the task, because interleaving a thought, an action, and an observation helps on one benchmark and not on another.
- [ ] How it works: Few-shot prompts send a thought, a Wikipedia API action, and the observation back into the next step, and the loop may continue until an answer or a step limit (7 on HotpotQA, 5 on FEVER).
- [ ] Evidence for the research question: On PaLM-540B (Table 1), ReAct reaches 60.9 accuracy on FEVER against chain-of-thought's 56.3, and 27.4 exact match on HotpotQA against 29.4.
- [ ] Combinations: The better order depends on the task: ReAct then CoT-SC scores 35.1 exact match on HotpotQA, CoT-SC then ReAct scores 64.6 accuracy on FEVER, and both beat CoT-SC alone (33.4 exact match / 60.4 accuracy).
- [ ] Sample proxy: Figure 2 shows those combinations matching CoT-SC's 21-sample accuracy with 3–5 samples, which measures sample efficiency, not total cost; the count covers CoT-SC samples only, not the combinations' ReAct steps or Wikipedia calls.
- [ ] Failure modes: Table 2 (HotpotQA, human labels on 50 successes + 50 failures per method) reports that 6% of successful ReAct trajectories contain a hallucinated thought or fact, and among failures 47% are reasoning errors and 23% are searches that returned nothing useful, while hallucination is 0% for ReAct and 56% for chain-of-thought.

## 4. Toolformer
- [ ] Idea: Toolformer teaches GPT-J 6.7B to insert a tool call by sampling calls, executing them, and keeping a call only when it reduces language-model loss.
- [ ] How the filter works: The loss filter is not a check that the call is correct and not a measure of its cost; Table 10's "Fast train success" search still lowers perplexity.
- [ ] Evidence for the research question: With tools enabled, Table 4 reports ASDiv / SVAMP / MAWPS at 40.4 / 29.4 / 44.0 against 14.8 / 6.3 / 15.0 with tools disabled, and the calculator is used on 97.9% of those examples.
- [ ] Calendar versus other tools: DATESET rises to 27.3 from 5.9 with tools disabled (GPT-J 3.9), with the calendar used on 54.8% of examples, while TEMPLAMA's rise from 12.7 to 16.3 comes mostly from Wikipedia search and QA, with the calendar used on 0.2% (Table 7, §4.2.5).
- [ ] Footnote, CCNet, not tool use: WikiText perplexity moves from 9.9 for GPT-J to 10.3 for GPT-J fine-tuned on CCNet, and Toolformer with tools disabled matches that 10.3.
- [ ] Table 9 (evidence only): On T-REx, moving from k=3 to k=10 raises the share of examples with a call from 82.8% to 98.1% and accuracy only from 52.9 to 53.5; at k=1, accuracy on the 59.7% of examples where the model chose not to call is 44.3 (NC), above the 34.9 across all examples with calls disabled (k=0), which the authors read as calibration "to some extent" that is lost at higher k (§5).
- [ ] One call in the evaluation: Toolformer has no training examples of chained calls (§7), the reported evaluation allowed at most one call per input, and the authors state that call decisions do not take into account the tool-dependent computational cost of a call (§7).

Cut for page budget: model size (§4.4, Fig. 4: tool use "only emerges at around 775M parameters"); outside the RQ.

## 5. Discussion
- [ ] Comparison table: Demonstrated / measured proxy / my interpretation / not measured, one column each for ReAct and Toolformer; the "not measured" row lists tokens, latency, money, and average step count for ReAct (only a step limit is set) and Toolformer's own statement that call decisions ignore tool cost (§7).
- [ ] Comparison axis 1: ReAct's gain depends on the benchmark, and Toolformer's gain is large when tools are switched on and then flattens as the call rate approaches every example.
- [ ] Comparison axis 2: ReAct's measured proxy is how many CoT-SC samples a combination replaces, and Toolformer's is the share of examples that receive a call, including a generation yield of more than 1M documents down to a few thousand useful calculator calls.
- [ ] Composition effect (my interpretation): AC falls from 58.0 to 54.0 between k=3 and k=10 because the newly called questions are harder; All is the weighted average of AC and NC, so the drop does not show that calls got worse.
- [ ] Table 9 reanalysis (my inference): Assuming questions called at k=3 are still called at k=10 with the same outcome, the 15.3% newly called gain about +2.5 percentage points (rounding alone allows roughly +1.7 to +3.4), and this net figure cannot separate fixes from breaks.
- [ ] Selective calling: ReAct's combinations switch method when a step limit is hit or the majority vote is low, and Toolformer at k=1 reaches 44.3 on the examples it chose not to call against 34.9 across all examples with calls disabled.
- [ ] What aggregate accuracy hides: Neither paper reports which answers a tool fixed and which it broke; my interpretation is that equal accuracy at unknown cost favors the run that breaks no previously correct answer.
- [ ] Open implication: A preferred number of calls, such as 2 versus 5 versus 14, is not a result in either paper.

## 6. Conclusion
- [ ] Main message: Tool use should be selective, because the accuracy gain depends on the task and calling on more examples soon adds little, while cost-effectiveness is not established.
- [ ] Implication for the user: For the person who waits and pays for each call, a higher accuracy score does not by itself say what they gained, because neither paper shows which answers the tool fixed and which it broke.
- [ ] Limitations: The argument uses two papers and older models, includes no experiment of Eridho's own, reads cost only from proxies, and the Table 9 inference assumes questions called at k=3 are still called at k=10 with the same outcome.
