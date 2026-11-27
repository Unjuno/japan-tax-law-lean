# Independent adversarial review — 関税定率法 第8条(3) EFFECT

Unit: `NORM|c28c6f86eb781a5292f44784e7290218444ae1d396cd8a0b2a9af18b35bf9c14`

Verbatim source text (copied byte-for-byte from `build/task_queue.json`, not hand-typed): 「前項の不当廉売関税は、当該不当廉売関税を課されることとなる貨物の輸入者が納める義務があるものとする。」

## Verdict: NO FINDINGS

All fifteen mandated checks were reproduced independently against the pinned raw
snapshot and the kernel. No concrete defect was found in the unit under review.

## Reproduced checks

| # | Check | Result (independently reproduced) |
|---|---|---|
| 1 | Raw SHA256 | `data/raw/143AC0000000054_20260601_508AC0000000005.law.json` hashes to `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c` — MATCH. |
| 2 | Needle uniqueness / position / semantics | Needle occurs exactly once in the raw law text. In the raw tree it sits at `law_full_text/children[1]`(LawBody)`/children[1]`(MainProvision)`/children[17]`(Article Num=8)`/children[4]`(Paragraph Num=3)`/children[1]`(ParagraphSentence)`/children[0]`(Sentence Num=1) — matching the queue `source_path`. `輸入者が納める義務がある` = importer bears the obligation; importer-obligor semantics confirmed. |
| 3 | `source_path` exact | Queue `source_path` string appears verbatim in the impl header and in the unit doc; SHA256 also present in both. |
| 4 | INVENTORY identity | `law_id=143AC0000000054`, `official_title=関税定率法`, `law_type=Act`, current revision `143AC0000000054_20260601_508AC0000000005`, raw snapshot SHA256 matches. |
| 5 | Queue metadata | `kind=EFFECT`, `unhandled_conditions=[]`, `dependencies=[]`, `scope=FULL_ARTICLE`. |
| 6 | Source fidelity | `obligor := Obligor.importer`; `dutyObligation := obligor = importer`; no numeric amount/rate or duty computation; NOT MODELLED documented in impl/spec/unit doc; codepoints correct in every CJK string (廉 U+5EC9, 売 U+58F2, 税 U+7A0E, 輸 U+8F38, 納 U+7D0D, 義 U+7FA9, 務 U+52D9, …). No simplified/wrong variants present. |
| 7 | Needle verbatim everywhere | Needle count = 1 in impl, spec, tests, unit doc and this review doc; no wrong-codepoint variants found. |
| 8 | Audit entry | `scripts/ci/transcription_audit.py` name `customs tariff law art.8 unfair-sales duty obligor - CustomsTariffArt8UnfairSalesDutyObligor.lean` occurs exactly once; its `\u` literal decodes to the queue needle codepoint-for-codepoint; locator is whole-law (`"file", None`). Running the script: `transcription audit: 782/782 checks passed` (including this entry). |
| 9 | Imports | `JapanTaxLaw.lean` lines 554/555/556 import impl, spec, tests — exactly once each. |
| 10 | Proof bodies | Only `rfl`, `unfold`, `intro`, `cases` in proofs. Tokens `sorry`/`admit`/`axiom`/`Classical.choice` appear only inside doc comments ("No `sorry`…"), `simp`/`propext` only in a spec doc comment — never in a proof body. |
| 11 | `#print axioms` | Probe importing the Tests module: all five theorems (`obligor_is_importer`, `importer_bears_duty`, `other_not_selected`, `implementation_satisfies_spec`, `other_not_satisfying`) report "does not depend on any axioms". |
| 12 | Independent spec | Impl = inductive `Obligor` value + equality; spec = `SpecObligor : Obligor -> Prop` equality — representationally distinct. Agreements proved by `rfl` / `cases`, not by `decide`/`simp`/`propext`. |
| 13 | Full build | `lake build`: `Build completed successfully (2644 jobs).` |
| 14 | Dependencies / scope | Queue `dependencies=[]`; no cross-law constant referenced; duty computation and legal correctness explicitly NOT MODELLED. |
| 15 | Legal review | Queue `legal_review=LEGAL_REVIEW_PENDING`, `completion_claim=false`; no completion claim in impl/doc. |

Note: queue `status=NOT_STARTED` with empty `evidence`/`artifacts` at review time is
expected bookkeeping and is not treated as a defect.

## Scope of this review

This is a transcription, representation and kernel-dependency review only. It is
not a legal opinion on the statute; human legal review remains pending.
