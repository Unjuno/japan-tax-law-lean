# Independent adversarial review — 災害被害者租税減免法 附則 第1条 DELEGATION

Unit: NORM|ad36635987ca63b79c1be8d9f004dd6314ab9fd2925d6c43aa6de45e2c3169fb
Verbatim source text (pinned): 「この法律は、公布の日から起算して一年を超えない範囲内において政令で定める日から施行する。」

## Verdict: NO HIGH/MEDIUM FINDINGS — one LOW documentation nit

Independent verification against the raw pinned law, INVENTORY, and the task queue found no
source-fidelity, codepoint, proof-soundness, or honesty defect. One LOW-severity documentation
inaccuracy is recorded below. Legal review remains `LEGAL_REVIEW_PENDING`; no completion claim.

## Reproduced checks (all passed)

1. Raw SHA256: `data/raw/322AC0000000175_20220101_503AC0000000011.law.json` =
   `c3bb5b0bdffbdefd2ee5f358d90ad9e0922d4c887ecb2b133aa7d613f5f4e7ef` (match).
2. Needle occurs exactly once in the whole law; located at the `Sentence` (Num 1) under
   `LawBody → children[45]=SupplProvision → children[1]=Article(Num 1) → children[2]=Paragraph(Num 1)
   → children[1]=ParagraphSentence → children[0]=Sentence`, i.e. supplementary Article 1(1) Sentence#1.
   公布 = U+516C U+5E03; 一年 = U+4E00 U+5E74; 超えない (inclusive cap) and 政令で定める日 present.
3. `source_path` string is byte-identical to the queue record and appears once in impl (line 14)
   and once in the unit doc (line 9).
4. INVENTORY law identity matches: law_id 322AC0000000175, law_type Act, revision
   322AC0000000175_20220101_503AC0000000011, sha256 as above; official title matches impl line 8.
5. Queue record: kind DELEGATION; kinds ['DELEGATION','REFERENCE','CONDITION']; unhandled_conditions=[];
   dependencies=[]; status NOT_STARTED, evidence {}, completion_claim false, legal_review LEGAL_REVIEW_PENDING
   (expected bookkeeping at review time).
6. Source fidelity: delegation target = Cabinet Order (政令で定める日); cap Nat=1 derived from
   kanji 一 (U+4E00); `withinCap y := y <= 1` is the inclusive "超えない" cap; boundary theorems present;
   no dates or Cabinet Order content invented (no date-like tokens in any unit file); NOT MODELLED
   documented in impl lines 30-31, spec line 16, unit doc lines 27-28.
7. Needle verbatim exactly once in impl, spec, tests, unit doc (and this adversarial doc); no 布公
   or other wrong-codepoint variant anywhere. All other CJK docstring strings (official title,
   law number, 附則/第1条, 原文逐語/一字一句改変なし) verified character-by-character against source/prose.
8. Audit literal `\\u...` decodes byte-exactly to the needle; check name unique (1 occurrence);
   whole-law locator kind="file"; total 700 checks; audit run → 700/700 PASS (our log line 702),
   including line 700 PASS for this unit.
9. Imports wired exactly once each in `JapanTaxLaw.lean` lines 623/624/625.
10. No `sorry`/`admit`/`axiom`/`Classical.choice`/`decide`/`simp`/`propext`/`omega` in any proof body
    (the only matches are in prose comments asserting their absence).
11. `#print axioms` for all nine theorems (`lake env lean`): each "does not depend on any axioms".
    Theorems: target_is_cabinet_order, statute_not_selected, cap_is_source_value, cap_boundary_allowed,
    zero_delay_allowed, above_cap_rejected, target_satisfies_spec, statute_not_satisfying, cap_spec_agreement.
12. Spec representationally distinct: `SpecTarget d := d = cabinetOrder` (Prop equality) vs inductive
    value; `SpecWithinCap n := ¬ maxDelayYears < n` (absence of reverse strict inequality) vs
    `n <= maxDelayYears`. `cap_spec_agreement` proved equivalently via `Nat.not_lt_of_ge` /
    `Nat.le_of_not_gt`; target theorems by `rfl` and `cases`.
13. Full `lake build` succeeded: "Build completed successfully (2326 jobs)".
14. No dependencies/cross-law constant; dates, Cabinet Order content, and legal correctness NOT MODELLED.
15. LEGAL_REVIEW_PENDING confirmed in queue and unit doc; no completion claim.

## LOW finding (documentation only — no effect on norm correctness)

- `docs/UNIT_DISASTER_RELIEF_SUPPL_ART1_DELEGATED_ENFORCEMENT_DATE.md:23` — the "Implementation:"
  bullet for `JapanTaxLaw/DisasterReliefSupplArt1DelegatedEnforcementDate.lean` says it contains
  "nine boundary theorems". That file defines six theorems (`target_is_cabinet_order`,
  `statute_not_selected`, `cap_is_source_value`, `cap_boundary_allowed`, `zero_delay_allowed`,
  `above_cap_rejected`); the other three (`target_satisfies_spec`, `statute_not_satisfying`,
  `cap_spec_agreement`) live in the Spec file. Total across the unit is nine (line 24 correctly says
  "All nine unit theorems axiom-free"). This is a misattribution of the count to one file only;
  the substance (nine axiom-free theorems across impl+spec) is correct. Suggested wording: "six
  boundary theorems (nine across impl + spec)".

The unit under review still exists; no evidence JSON, Lean module, audit script, umbrella, or
existing documentation was modified by this review.

## Finding resolution (author, after review)

- **LOW finding reproduced**: unit doc line 23 attributed all nine unit theorems to the
  implementation file; that file defines six, the spec file three.
- **Fix applied**: line 23 now says "six boundary theorems" for the implementation file;
  line 24 still correctly states "All nine unit theorems axiom-free" for the unit as a whole.
- **CONFIRMED**: the per-file attribution now matches the theorem locations, and no proof,
  source correspondence, or verification gate was changed. No HIGH/MEDIUM finding remained.
