# Independent adversarial review — 災害被害者租税減免法 art.2(1) income threshold

Reviewer: an independent agent session (no shared working context with the
author). Read-only: it recomputed the pinned JSON sha256, decoded the raw tree
to locate the needle and its sibling rows, read the three Lean files and the
transcription check. No repository files were modified.

## Verdict: NO CONCRETE FINDINGS

Every falsifiable check passed. One interpretive caveat (C/U) was surfaced and
addressed by the author; it does not falsify the pinned-fragment predicate.

## Findings register (H/T/D/C/U)

| ID | H (hypothesis) | T (test) | D |
|---|---|---|---|
| F1 | pinned sha256 wrong | hashlib over raw bytes | REFUTED — actual `c3bb5b0b…3f4e7ef` = pin; size 86,804 matches INVENTORY |
| F2 | needle absent/duplicated/mislocated | structural walk of raw JSON | REFUTED — count 1; Law→LawBody→MainProvision→Article:2→Paragraph:1→List→Column:1→Sentence:1 |
| F3 | numeral wrong (5M/10M/750k) | decode sibling rows | REFUTED — 七百五十万円 = 7,500,000; 5M and 10M are distinct rows/ceiling |
| F4 | spec circular / not universal | read spec + proof | REFUTED — truncated subtraction distinct from `≤`; `agree_income_limit` universal via `Nat.sub_eq_zero_iff_le.symm` |
| F5 | forbidden axioms/sorry | read all three files | REFUTED — none present |
| F6 | boundary theorem / `decide` unsound | inspect closed goals | REFUTED — all closed/kernel-checked; correct |

## Needle context (T)

The needle is a **verbatim fragment** (no terminal 「。」), correctly pinned as
such. It is the middle row of a three-tier reduction schedule in art.2(1):
≤5M → full relief; **≤7.5M → 5/10** (pinned); >7.5M → 2.5/10. Eligibility
preamble requires ≤10M and no 同法72(1) disaster-loss deduction. `below` is
inclusive, so income exactly 7.5M selects the 5/10 row.

## Finding 7 — interpretive caveat (C, sustained as interpretation not error)

- **C:** the 7.5M clause is a *rate-bracket predicate*, not the *eligibility*
  condition (the statutory eligibility ceiling is a distinct 千万円/10M test).
  A downstream consumer could wrongly read `withinIncomeLimit` as the
  qualification test and under-approximate eligibility by excluding 7.5M–10M.
- **D:** not a defect in the pinned-fragment predicate; the model asserts only
  what the fragment says. **Fix applied:** the implementation header now states
  that this clause selects the 5/10 reduction row, that the 10M eligibility
  ceiling is distinct, and that `withinIncomeLimit` must not be read as the
  qualification test. Rebuild passed (5 jobs).

## Finding 8 — `合計所得金額` as raw Nat (U, documented scope boundary)

The term is defined in the same article (sum of 総所得金額/退職所得金額/山林所得金額
per 所得税法22条). The model takes it as an opaque caller-supplied Nat and
declares the definition out of scope — honest and consistent with project
convention. Sustained as scope boundary, not dishonesty.

## Closing

No soundness break, wrong pin, transcription error or circular proof. The only
weaknesses are honestly-declared scope limits (F7/F8). No claim of legal
correctness; human legal review remains `LEGAL_REVIEW_PENDING`.
