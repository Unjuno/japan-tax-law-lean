# Independent adversarial review — 関税定率法 第16条(1) DELEGATION

Unit: `NORM|6868ae3dc5dbd0c5012476e69b40a267ebccf7ed6abc90c7a3a695b3cec23df8`

Needle (verified byte-for-byte against pinned raw source): 「左の各号に掲げる貨物で輸入されるものについては、政令で定めるところにより、その関税を免除する。」

## Verdict: NO FINDINGS

All 15 mandated checks were reproduced independently from the authoritative
queue, INVENTORY, raw law JSON, Lean sources, audit script, and tool output.
No wrong-codepoint CJK, no invented content, no dependency/contract defect,
no forbidden proof construct was found.

## Reproduced checks

| # | Check | Evidence |
|---|---|---|
| 1 | Raw SHA256 | `data/INVENTORY.json` → `raw_snapshot.source_file = data/raw/143AC0000000054_20260601_508AC0000000005.law.json`; `sha256(raw bytes)` = `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c` (matches INVENTORY `source_sha256` case-insensitively and the impl docstring line 12). |
| 2 | Needle uniqueness / position / semantics | `build/task_queue.json` task `text` == needle (47 chars); `transcription_audit.load_law_text("143AC0000000054").count(needle) == 1`; raw JSON has exactly 1 string hit. Structural chain: `law_full_text.children[1]`=`LawBody`, `.children[1]`=`MainProvision`, `.children[29]`=`Article Num=16`, `.children[2]`=`Paragraph Num=1`, `.children[1]`=`ParagraphSentence`, `.children[0]`=`Sentence Num=1`, whose text is the needle. 政令 (U+653F U+4EE4) = Cabinet Order; 免除 (U+514D U+9664) = exemption. |
| 3 | `source_path` | `LawBody[1]/MainProvision/MainProvision[29]/Article:16/Article#16/Paragraph#1/ParagraphSentence/Sentence#1` occurs exactly once in impl (line 14) and once in the unit doc (line 9), identical to queue `source_path`. |
| 4 | Law identity | INVENTORY law 143AC0000000054: title 関税定率法, `law_type` Act, `law_num` 明治四十三年法律第五十四号 — impl docstring lines 7–10 match. |
| 5 | Queue contract | `kind` = `DELEGATION`, `kinds` = [`DELEGATION`], `unhandled_conditions` = `[]`, `dependencies` = `[]`, `article` = `16`, `paragraph` = `1`. |
| 6 | Source fidelity | Model selects `delegationTarget = cabinetOrder` (impl 52) and `dutyEffect = exemption` (impl 55); no listed goods or Cabinet Order content enumerated anywhere; "NOT MODELLED" explicit at impl 30–31, spec 13, unit doc 19/28. |
| 7 | CJK codepoints | Needle occurs exactly once in impl, spec, tests and the unit doc; codepoint sequence `5DE6 306E 5404 53F7 306B 63B2 3052 8CA8 7269 3067 8F38 5165 3055 308C 308B 3082 306E 306B 3064 3044 3066 306F 3001 653F 4EE4 3067 5B9A 3081 308B 3068 3053 308D 306B 3088 308A 3001 305D 306E 95A2 7A0E 3092 514D 9664 3059 308B 3002` matches the queue needle in all files. Other CJK strings (関税定率法 = 95A2 7A0E 5B9A 7387 6CD5; 明治四十三年法律第五十四号) match INVENTORY exactly; no near-miss variants found. |
| 8 | Audit entry | `scripts/ci/transcription_audit.py:4994-4997` yields `("customs tariff law art.16 delegated exemption - CustomsTariffArt16DelegatedExemption.lean", "143AC0000000054", "file", None, ["\u5de6…\u3002"])` — name occurs once, whole-law `file` locator, literal decodes exactly to needle. `len(list(checks())) == 741`; running `python scripts/ci/transcription_audit.py` → `741 PASS  customs tariff law art.16 delegated exemption …` and `transcription audit: 741/741 checks passed`. |
| 9 | Imports | `JapanTaxLaw.lean:422-424` imports impl, Spec, Tests once each; lean chain impl → `TaxFinance`, Spec → impl, Tests → Spec. |
| 10 | Forbidden constructs | No `sorry`, `admit`, `axiom`, `Classical.choice`, `simp`, placeholder or `@@…@@` token in any proof body (the only such words in impl are the line-34 docstring assertion that they are absent). |
| 11 | Axioms | `lake env lean` probe on all eight theorems: each prints `'…' does not depend on any axioms`. |
| 12 | Independent spec | `SpecTarget`/`SpecEffect` are `Prop` equalities over the inductive values; agreements proved by `rfl`, negatives by `intro`/`cases`. Representationally distinct from the inductive implementation. |
| 13 | Build | `lake build` → `Build completed successfully (2470 jobs).`, zero errors. |
| 14 | Dependencies / cross-law | No dependencies recorded; impl imports only `TaxFinance`, no other law id/constant introduced. Listed goods, Cabinet Order content and legal correctness explicitly NOT MODELLED. |
| 15 | Review state | Queue: `legal_review = LEGAL_REVIEW_PENDING`, `completion_claim = false`, `status = NOT_STARTED`, `evidence = {}`. Empty evidence at review time is expected bookkeeping; no completion claim. |

## Residual scope note

This review certifies transcription and kernel-level representation only. It
does not certify legal correctness or the substantive content of the Cabinet
Order; those remain out of scope and pending human legal review.
