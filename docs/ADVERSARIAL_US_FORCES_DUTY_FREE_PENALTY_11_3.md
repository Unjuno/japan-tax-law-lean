# Independent adversarial review — 在日米軍特例法 art.11(3)（罰則: 拘禁刑12月以下 又は 罰金50万円以下）

Normative unit: `NORM|1db69bb3bef2d77f92573dc1ea87c88c11703d6916e8958a068fe79368cd8c19`
Canonical implementation: `JapanTaxLaw/UsForcesDutyFreePenalty.lean` (+ Spec, Tests)

Reviewer: an independent agent session (no shared working context with the
author). Temp scripts written and deleted; no repository file modified by the
reviewer; `lake build` not run by reviewer.

## Verdict: NO FINDINGS against the canonical implementation. Three WIP/provenance findings were reproduced and resolved.

### Canonical checks (all PASS)

| Check | Result |
|---|---|
| independent sha256 of raw JSON | PASS — `04223c39…074c1b2` matches INVENTORY; full needle occurs once |
| needle fidelity | PASS — queue `text` == canonical impl 原文 quote (`:13`) == audit needle byte-for-byte; 44 codepoints |
| law identity / long title | PASS — Act 327AC0000000111, 昭和二十七年法律第百十一号, very long title byte-identical across INVENTORY `official_title`, raw `revision_info.law_title`, raw `LawTitle`, impl:8 |
| article caption | PASS — raw ArticleCaption `（免税物品の譲渡禁止等）` (譲 U+8B72 / 渡 U+6E21); `殺到` (殺 U+6BBA) absent from source and canonical files |
| article-kind locator | PASS — `find_article_text("第十一条")` returns article len 879 containing needle |
| amounts | PASS — 一年以下 → 12 months; 五十万円以下 → 500,000; forms 12 / 500_000 / 500,000 / 500000 consistent; 「又は」 = alternative, not cumulative |
| proofs | PASS — independent spec declares its own constants (12, 500000); `specWithin_iff_withinLimits` universal over `Penalty`, kernel-checked; `[propext]` from `simp` only (permitted by project policy; forbidden `Classical.choice`/`sorryAx`/`Quot.sound` absent); boundary tests 12/13 and 500,000/500,001 correct |
| audit check | PASS — pre-existing check at `transcription_audit.py:1505-1509` uses unique verbatim substring 「一年以下の拘禁刑又は五十万円以下の罰金に処する。」 scoped to law 327AC0000000111 / article 第十一条 |

### Resolved findings (WIP/provenance, not canonical defects)

- **T1 (wrong caption in WIP helper scripts):** a draft evidence/PR helper hand-typed `免税物品の殺到禁止等` (殺 U+6BBA) instead of authoritative `免税物品の譲渡禁止等`. The canonical impl/doc were correct (injected from raw). Resolution: the WIP helper scripts were discarded; no wrong caption entered the ledger or any canonical file. Confirmed: no `殺到` in canonical impl/spec/tests/doc.
- **D2 (missing adversarial artifact):** this document is the recorded review for the canonical unit. Resolution: written.
- **D3 (missing ledger entry):** evidence ledger entry added for this norm id, pointing to the canonical pre-existing impl/spec/tests with LF-normalized hashes. Resolution: applied.
- **U4 (duplicate impl for one norm id):** a parallel `UsForcesSpecialMeasurePenalty*.lean` had been added by the author for the same norm id. Resolution: the duplicate (files, imports, audit block, unit doc) was removed; the pre-existing canonical unit remains the single implementation for this norm id. Confirmed: no other module imports the removed unit.

### Non-blocking notes

- The canonical audit check name is Japanese (pre-existing, dominant repo convention), not English-only; not a regression.
- The pre-existing spec depends on `[propext]` (standard core axiom, explicitly permitted; forbidden placeholders absent).

## Closing

No concrete findings against the canonical implementation; WIP/provenance findings all resolved. No claim of legal correctness; human legal review remains `LEGAL_REVIEW_PENDING`.
