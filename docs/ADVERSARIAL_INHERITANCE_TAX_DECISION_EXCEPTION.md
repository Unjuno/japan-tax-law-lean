# Independent adversarial review — 相続税法 第一条の二 EXCEPTION

Unit: NORM|a272ba5227e609d49ff344bf1f6a7aee167ba66f8fba72b65dc48fca6e30bb39
Verbatim (injected from the authoritative queue task, not hand-typed):
  「第三十三条の二の場合を除き、国税通則法第二十五条（決定）の規定による決定をいう。」

## Reviewer verdict: 2 FINDINGS (both documentation/ledger defects) — FIXED & CONFIRMED

All 16 mandated checks were reproduced independently; 14 passed cleanly and 2 produced
concrete, file-located defects.

### F-1 (reproduced, fixed) — stale 消費税法 label
INVENTORY says law 325AC0000000073 is 相続税法. The wrong title 消費税法 survived in
`InheritanceTaxDecisionExceptionSpec.lean:6` and the audit check's comment. Fixed by
replacing them with the title read programmatically from INVENTORY. Confirmed: no stale
label in the unit files or the unit's audit comment. (A separate, legitimate 消費税法
occurrence in another law's casino anchor is unrelated — see F-3 below.)

### F-2 (reproduced, fixed) — dependency article misquoted in docs
The queue's first dependency records `article = 第三十三条`, not `第三十三条の二`.
This is a systematic parser limitation (`normative_core.py` `ARTICLE_RE` captures only
up to `条`), not hand-typing; the needle itself preserves 第三十三条の二 verbatim.
The UNIT doc and finalization text had claimed the suffixed form was in the queue.
Both were rewritten using the authoritative article values from the queue and the
limitation is documented. Confirmed by regression guards.

### F-3 (additional real defect found during verification) — broken casino anchor
While confirming the gates, the transcription audit showed 453/454: the
`SpecialMeasuresCasinoRatio` check had a stale anchor mixing 相続税法第二十八条第一項
into a 消費税法 context. The raw law (332CO0000000043) contains the correct full anchor
exactly once. The check was repaired from the raw law; audit is 454/454 again. This is
a pre-existing main defect, not part of this unit's model.

### Checks reproduced (all PASS after fixes)
Raw sha256 c01bb9be…75043a7; needle whole-law count 1; source path resolved node-by-node
(Article Num=1_2 → Paragraph 1 → Item 6 → Column 2 → Sentence 1) byte-for-byte; law
identity 相続税法 / 昭和二十五年法律第七十三号 / Act / INVENTORY revision; kind EXCEPTION,
unhandled_conditions=[]; carve-out and article numbers faithful; needle verbatim in
impl/spec/tests/docs; ASCII `\u` audit literal, unique name, 454/454; imports wired once
each; no forbidden placeholders or `simp` in proof bodies; all five theorems axiom-free;
spec representationally distinct with axiom-free agreement; build 1459 jobs; two resolved
cross-law deps with law name/articles/enforcement 2026-11-01; dev-failure records honest;
`LEGAL_REVIEW_PENDING` with no completion claim.

### Remaining findings
None. Human legal review remains `LEGAL_REVIEW_PENDING`.
