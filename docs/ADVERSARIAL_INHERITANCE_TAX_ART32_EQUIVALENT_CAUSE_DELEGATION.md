# Adversarial review — InheritanceTaxArt32EquivalentCauseDelegation

Unit: `NORM|82d24538082c811fd40812c245cec18adcb9be279741d0f8070dbf6c3497523b` (相続税法 第32条第1項第6号, DELEGATION).
Reviewer stance: independent; all claims re-derived from authoritative sources, not from author prose.

Verbatim needle (copied programmatically from `build/task_queue.json` `norm_fragment`): 「前各号に規定する事由に準ずるものとして政令で定める事由が生じたこと。」

## Reproduced checks (all PASS)

1. **Raw SHA-256**: `data/raw/325AC0000000073_20260401_506AC0000000008.law.json` = `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`; equals queue `source_sha256` and INVENTORY `raw_snapshot.source_sha256`.
2. **Needle location / spelling**: exactly 1 occurrence in the whole pinned law file (`raw.count(needle) == 1`). Recursive JSON path resolves through `Law` → `LawBody` → `MainProvision` → `Chapter` → `Article` (attr `Num=32`) → `Paragraph` (`Num=1`) → `Item` (`Num=6`) → `ItemSentence` → `Sentence` (`Num=1`); leaf content is byte-identical to the queue fragment. `準` is U+6E96 at offset 11 (old spelling preserved); full codepoint sequence re-derived from the queue: 524d 5404 53f7 306b 898f 5b9a 3059 308b 4e8b 7531 306b 6e96 305a 308b 3082 306e 3068 3057 3066 653f 4ee4 3067 5b9a 3081 308b 4e8b 7531 304c 751f 3058 305f 3053 3068 3002. Delegation semantics confirmed: a cabinet-order-prescribed cause analogous to the preceding items, once it occurs, triggers the item.
3. **source_path exact**: `LawBody[3]/MainProvision/MainProvision[3]/Article:32/Article#32/Paragraph#1/Item#6/ItemSentence/Sentence#1` appears once in the impl doc header and once in the unit doc; matches the queue field verbatim.
4. **INVENTORY identity**: `data/INVENTORY.json` `laws[4]` has `law_id=325AC0000000073`, `official_title=相続税法`, `law_type=Act`, `law_num=昭和二十五年法律第七十三号`, `current_revision.law_revision_id=325AC0000000073_20260401_506AC0000000008`, raw snapshot file/SHA as above — one and only one matching law.
5. **Queue metadata**: `kind=DELEGATION` (kinds `[DELEGATION, REFERENCE]`), `unhandled_conditions=[]`, `dependencies=[]`.
6. **Fidelity / scope**: `inScope` is exactly `causeOccurred && cabinetDesignated` — both gates necessary; three boundary theorems cover true/true, false/true, true/false. No cabinet-order content and no preceding-items' content is invented. `Cabinet-order content, the preceding items' content and legal correctness are NOT MODELLED` is stated in the impl; the spec states `Not modelled: cabinet-order content, preceding items' content, legal correctness`; the unit doc repeats it. No numeric unit is fabricated.
7. **Needle in artifacts**: count of the exact queue fragment is 1 in each of impl, spec, tests, and the unit doc; every `準` codepoint in all four files is U+6E96 (no near-miss variant such as U+6EFF). This review doc injects the same queue string inside 「」.
8. **Audit**: in `scripts/ci/transcription_audit.py` the check name `inheritance tax law art.32 equivalent cause delegation - InheritanceTaxArt32EquivalentCauseDelegation.lean` occurs exactly once; its `\u`-literal decodes byte-for-byte to the needle; locator is `kind="file"` with law id `325AC0000000073` (whole-law search). Running `python scripts/ci/transcription_audit.py` reports `transcription audit: 829/829 checks passed`, with `PASS` for this unit's check.
9. **Imports**: `JapanTaxLaw.lean` lines 1216/1217/1218 contain exactly one `import JapanTaxLaw.InheritanceTaxArt32EquivalentCauseDelegation`, `...DelegationSpec`, `...DelegationTests`, respectively (exact-line count 1 each). Module chain impl → spec → tests is correct.
10. **Proof bodies**: after stripping block/line comments, impl/spec/tests contain no `sorry`, `admit`, `axiom`, `Classical.choice`, `simp`, `decide` or `propext`. (Raw-file hits for those words occur only in the descriptive docstrings.)
11. **Axioms**: `lake env lean` on an independent probe with `#print axioms` for all four theorems yields `does not depend on any axioms` for `both_true_in_scope`, `no_cause_out_of_scope`, `no_designation_out_of_scope`, and `spec_agreement`.
12. **Independent spec**: implementation is `Bool &&`; spec is `SpecInScope (a b : Bool) : Prop := a = true ∧ b = true`, representationally distinct; `spec_agreement` is proved by exhaustive `cases` on both Bools with no `simp`/`decide`.
13. **Build**: `lake build` → `Build completed successfully (2788 jobs).`
14. **No cross-law constant**: impl/spec/tests reference no cross-law constant; the boilerplate `import JapanTaxLaw.TaxFinance` (used by 907 of 2785 modules) contributes no referenced symbol. Queue `dependencies=[]`; cabinet-order content, preceding items' content and legal correctness are documented as NOT MODELLED.
15. **Status discipline**: queue `legal_review=LEGAL_REVIEW_PENDING`, `completion_claim=false`, status `NOT_STARTED`, evidence `{}` at review time (expected bookkeeping). Neither this review nor the unit doc asserts completion.

## Result

**NO FINDINGS.** All fifteen mandated checks reproduced from the pinned law, INVENTORY, queue, audit script and Lean toolchain. Legal correctness remains for human review (`LEGAL_REVIEW_PENDING`); this review is not a completion claim.
