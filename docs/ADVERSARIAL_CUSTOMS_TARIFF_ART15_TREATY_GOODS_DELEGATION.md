# Independent adversarial review — 関税定率法 第15条(1) 第10号 DELEGATION

Unit: `NORM|e88e79c160c4c7a008abfc095e601ed439e9cbeefd112e183044f3c2e2a8a57c`
Verbatim source text (copied programmatically from `build/task_queue.json`, not hand-typed): 「条約の規定により輸入の後特定の用途に供されることを条件として関税を免除することとされている貨物で政令で定めるもの」

## Verdict: NO FINDINGS

All 15 mandated checks were reproduced independently against the pinned raw law,
the queue, INVENTORY, the Lean sources, and the audit/build gates. No wrong CJK
codepoint, transcription error, semantic overreach, or proof defect was found.

| # | Check | Reproduction / evidence |
|---|---|---|
| 1 | Raw SHA-256 | `data/raw/143AC0000000054_20260601_508AC0000000005.law.json` hashes to `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`; equals queue `source_sha256` and INVENTORY `raw_snapshot.source_sha256` (uppercase hex there, case-insensitive match). |
| 2 | Needle uniqueness / location | Needle occurs **exactly once** in the raw file. The unique leaf is at `law_full_text/children[1]/children[1]/children[28]/children[2]/children[12]/children[1]/children[0]/children[0]`; walking ancestors gives `LawBody[1]` → `MainProvision`(child 1) → `MainProvision[28]` = `Article Num="15"` → `Paragraph Num="1"` → `Item Num="10"` → `ItemSentence` → `Sentence Num="1"`; leaf string equals the queue needle exactly. |
| 3 | Source path | Queue `source_path` = `LawBody[1]/MainProvision/MainProvision[28]/Article:15/Article#15/Paragraph#1/Item#10/ItemSentence/Sentence#1`; byte-identical copy at `JapanTaxLaw/CustomsTariffArt15TreatyGoodsDelegation.lean:14` and `docs/UNIT_CUSTOMS_TARIFF_ART15_TREATY_GOODS_DELEGATION.md:9`. |
| 4 | Law identity | INVENTORY law `143AC0000000054`: `official_title=関税定率法`, `law_num=明治四十三年法律第五十四号`, `law_type=Act`, `current_revision=143AC0000000054_20260601_508AC0000000005`. Queue task matches on all fields. |
| 5 | Queue classification | `kind=DELEGATION`, `kinds=["DELEGATION"]`, `unhandled_conditions=[]`, `dependencies=[]`, `decomposed=true`, `id=unit_id=normative_id=UID`. |
| 6 | Source fidelity | Impl `inScope (treatyExempt cabinetDesignated) := treatyExempt && cabinetDesignated` (`:37-38`): **both** gates required; three boundary theorems (`:41`,`:44`,`:47`). Spec `SpecInScope := treatyExempt = true ∧ cabinetDesignated = true` (`:20-21`), `spec_agreement` by `cases` (`:24-47`). No treaty content or cabinet-order content is asserted; `NOT MODELLED` for treaty content, cabinet-order content and legal correctness is stated at impl `:28-29`, spec `:14`, unit doc `:19`,`:28`. |
| 7 | Needle verbatim / codepoints | Needle appears exactly once, inside 「」, in impl `:17`, spec `:7`, tests `:6`, unit doc `:7`, and this review doc. Extracted quoted strings compare equal codepoint-for-codepoint to the queue needle (56 chars, e.g. `条 U+6761`, `約 U+7D04`, `輸 U+8F38`, `供 U+4F9B`, `関 U+95A2`, `政 U+653F`, `令 U+4EE4`). No near-miss CJK variant found in any reviewed file. |
| 8 | Audit entry | `scripts/ci/transcription_audit.py:5442-5445`: name `customs tariff law art.15 treaty goods delegation - CustomsTariffArt15TreatyGoodsDelegation.lean` occurs **once**; law id `143AC0000000054`; kind `file` (whole-law locator via `load_law_text`, `contains` strips whitespace only); the `\u...` literal decodes (`ast.literal_eval`) byte-identically to the queue needle. `python scripts/ci/transcription_audit.py` → `transcription audit: 828/828 checks passed`, including `PASS customs tariff law art.15 treaty goods delegation ...`. |
| 9 | Imports | `JapanTaxLaw.lean:452`, `:453`, `:454` contain exactly the three imports `CustomsTariffArt15TreatyGoodsDelegation`, `...Spec`, `...Tests`, one each. |
| 10 | No placeholders / simp | After stripping comments, proof bodies contain zero `sorry`, `admit`, `axiom`, `Classical.choice`, `simp`, `decide`, `propext` tokens. The only such words are in doc comments (impl `:31`, spec `:12`). Proofs use `rfl`, `cases`, `constructor`, `intro`. |
| 11 | Axiom freedom | `lake env lean` probe `#print axioms` for `both_true_in_scope`, `no_treaty_out_of_scope`, `no_designation_out_of_scope`, `spec_agreement`: each reports `does not depend on any axioms`. |
| 12 | Independent spec | Bool `&&` (impl) vs Prop conjunction of equalities (spec) are representationally distinct; `spec_agreement` is proved by case split on both Bools, no `decide`/`simp`/`propext`. Tests `:11-17` cover all four Bool pairs, including the spec equivalence at each. |
| 13 | Build | `lake build` → `Build completed successfully (2782 jobs).` |
| 14 | Dependencies / scope | Queue `dependencies=[]`; impl imports only same-law `JapanTaxLaw.TaxFinance`; no cross-law constant is referenced. Treaty content, cabinet-order content, and legal correctness are explicitly NOT MODELLED. |
| 15 | Completion discipline | Queue: `legal_review=LEGAL_REVIEW_PENDING`, `completion_claim=false`, `status=NOT_STARTED`, `evidence={}` (expected bookkeeping at review time, not a completion claim). Unit doc `:20` states human legal review remains pending; no completion claim in any reviewed file. |

Human legal review remains `LEGAL_REVIEW_PENDING`; this verdict addresses only
transcription, representation, kernel proof scope, and wiring.
