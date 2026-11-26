# Independent adversarial review — 租税特別措置法 第42条の4 EXCEPTION (combined ratio >10%, item-1 carve-out)

Unit: NORM|54d5aca7a490dd39b948d2eef0911c7833ef5a5fe7fbf89798f9a60d6a9dee0c
Verbatim needle (re-extracted from the pinned raw source, not trusted from the author's prose): 「合算試験研究費割合が百分の十を超える事業年度（（１）に掲げる事業年度を除く。）」

## Verdict: NO FINDINGS

No concrete H/T/D/C/U defect was reproduced. All 15 mandated checks were independently reproduced against authoritative sources (raw JSON, INVENTORY, SPEC_SCOPE_MAP, the audit generator, and the Lean kernel). No file was deleted or modified outside this designated review doc; scratch probes were created only with a leading underscore.

## Reproduced checks

1. **Raw SHA256** — `data/raw/332AC0000000026_20261101_507AC0000000013.law.json` bytes hash to `e6e6013bbc0608c6b48dea01d50ac847c3e5d094f0420223171ffe1b5cf8d5ee` (14,512,569 bytes). Matches pin and INVENTORY `source_sha256` (uppercase form).

2. **Needle uniqueness / locator** — needle occurs **exactly once** in the raw file. Independent tree walk of `law_full_text` finds the owning `Sentence` (attr `Num=1`) with ancestor chain: `Article Num=42_4` → `Paragraph Num=8` → `Item Num=9` → `Subitem1 Num=2` → `Subitem2 Num=2` → `Subitem2Sentence` → `Column Num=1` → `Sentence Num=1`. This is Article 42の4 Paragraph 8 Item 9 Column#1 Sentence#1. Source text `百分の十を超える` = strictly exceeds 10% (`を超える`, not `以上`); `（（１）に掲げる事業年度を除く。）` is the item-1 carve-out. Both faithfully modelled.

3. **source_path** — impl line 14 and unit doc line 9 carry the identical string `LawBody[3]/MainProvision/MainProvision[2]/Article:42_4/Article#42_4/Paragraph#8/Item#9/Subitem1#2/Subitem2#2/Subitem2Sentence/Column#1/Sentence#1`; its `Article:42_4/Paragraph#8/Item#9/Subitem1#2/Subitem2#2/Column#1/Sentence#1` components match the independently located node's `Num` attributes.

4. **Law identity** — INVENTORY.json lines 2029–2064: `law_id=332AC0000000026`, `official_title=租税特別措置法`, `law_type=Act`, `current_revision=332AC0000000026_20261101_507AC0000000013`, raw snapshot file and SHA256 agree.

5. **Kind / bookkeeping** — SPEC_SCOPE_MAP records this norm as `kind=EXCEPTION`, `in_scope=true` (reason `EXPLICIT_SCOPE_MATCH`); impl/doc describe EXCEPTION with CONDITION aspect. Queue records (task_state.json / verification_evidence.json) have no entry for this norm at review time — expected NOT_STARTED/empty bookkeeping, not a content defect. No `unhandled_conditions` or `dependencies` are asserted anywhere; no `simp`-away of conditions.

6. **Source fidelity** — `ratioFloor : Nat := 10` derived from kanji 十 (U+5341) in `百分の十` (codepoint confirmed in needle). `qualifies r y := ratioFloor < r ∧ y ≠ item1Year`: strict threshold and year carve-out. Five theorems cover floor equality, at-floor rejection, above-floor acceptance, item-1 rejection, and spec agreement. No ratio formula and no definition of which years are "item-1" are invented: `YearClass` is a two-constructor inductive with `ratioPercent` caller-established. NOT MODELLED (ratio computation, item-1 year definition, legal correctness) is stated in impl lines 31–32, spec line 17, and unit doc lines 19/28.

7. **Verbatim needle / codepoints** — needle occurs once in each of impl (lines 17), spec (line 7), tests (line 6), unit doc (line 7), and this doc. Codepoints in every CJK string in all unit files were dumped and verified: needle = `5408 7b97 8a66 9a13 7814 7a76 8cbb 5272 5408 304c 767e 5206 306e 5341 3092 8d85 3048 308b 4e8b 696d 5e74 5ea6 ff08 ff08 ff11 ff09 306b 63b2 3052 308b 4e8b 696d 5e74 5ea6 3092 9664 304f 3002 ff09`, identical to the brief and the source. Other strings (`租税特別措置法` 79df 7a0e 7279 5225 63aa 7f6e 6cd5; `昭和三十二年法律第二十六号`; `「`/`」` U+300C/U+300D; `原文逐語`; `一字一句改変なし`) are correct. No wrong-codepoint variants.

8. **Audit** — name `special measures art.42_4 combined ratio over 10 exception - SpecialMeasuresArt42_4CombinedRatioOver10Exception.lean` occurs exactly once in `checks()` (line 4781), law_id `332AC0000000026`, `kind="file"` (whole-law file locator), `title=None`. Its escaped literal `\\u5408...\\uff09` decodes byte-for-byte to the needle (codepoints identical). Generator total = **697**; `python scripts/ci/transcription_audit.py` → `transcription audit: 697/697 checks passed`, including this unit's PASS line.

9. **Imports** — `JapanTaxLaw.lean` lines 2018–2020 import each of impl, Spec, Tests exactly once; no duplicate.

10. **Forbidden tokens** — no `sorry`/`admit`/`axiom`/`Classical.choice`/`simp`/`omega`/`propext` in any proof body (only a docstring mention "no simp/propext/omega" in Spec line 14 and a docstring "No `sorry`..." in impl line 34).

11. **#print axioms** — `set PATH=C:\Users\user\.elan\bin;%PATH% && lake env lean` probe on all five theorems (`floor_is_source`, `at_floor_rejected`, `above_floor_other_qualifies`, `above_floor_item1_rejected`, `qualifies_spec_agreement`) each printed `does not depend on any axioms`, including the `decide`-based `above_floor_other_qualifies`.

12. **Independent spec** — `SpecQualifies r y := ¬ r ≤ ratioFloor ∧ y = YearClass.otherYear` is representationally distinct (absence of reverse non-strict inequality; equality vs disequality). `qualifies_spec_agreement` is proved by `cases y` using Nat-specific lemmas `Nat.not_le_of_gt`, `Nat.lt_of_not_ge`, and `rfl`/case elimination, with `simp` absent.

13. **Build** — `lake build` → `Build completed successfully (2317 jobs).` (no errors; only unrelated linter warnings in other modules).

14. **Deps / scope** — impl imports only `JapanTaxLaw.TaxFinance`; spec imports impl; tests imports spec. No cross-law constant. Ratio computation, item-1 year definition, and legal correctness are explicitly NOT MODELLED.

15. **Legal review** — unit doc line 20: "Human legal review remains `LEGAL_REVIEW_PENDING`." No completion / legal-correctness claim in impl, spec, tests, or unit doc.

## Closing

No concrete defect found; no fixes required. This is a mechanical/empirical verification record and does not substitute for human legal review (`LEGAL_REVIEW_PENDING`; no legal-correctness claim).
