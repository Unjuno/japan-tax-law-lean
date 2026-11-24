# First full per-unit formalization cycle — 酒税法 附則八条三項

This documents one complete INSPECT → SELECT → SPECIFY → IMPLEMENT → PROVE →
CHALLENGE → VERIFY → record cycle on a single normative unit.

## Selected unit

- `normative_id`: `de48b1a2a49e1ca…` (64-hex, prefix shown)
- law: 酒税法 (`328AC0000000006`), revision `328AC0000000006_20260525_506AC0000000052`
- provision: 附則 昭和四三年四月二六日法律第二七号 第八条 第三項 第一号
- span: `data/raw/328AC0000000006_20260525_506AC0000000052.law.json`
  path `…/Article:8@4/Paragraph:3@2/Item:1`, offsets 702–716
- verbatim: 「その税額が十万円以下のとき。」 (CONDITION, 十万円以下)
- dependencies: none; unresolved conditions: none

## Source norm (§3, verbatim brackets)

| 税額 | 分割月数 |
|---|---:|
| ≤ 30,000 円 | 1 (翌月末日限り, 一括) |
| 30,000 < tax ≤ 100,000 | 2 (二月) |
| 100,000 < tax ≤ 300,000 | 3 (三月) |
| 300,000 < tax ≤ 500,000 | 4 (四月) |
| > 500,000 | 5 (五月) |

## Artifacts

- `JapanTaxLaw/LiquorTaxInstallment.lean` — typed implementation `installmentMonths : Nat → Nat`
- `JapanTaxLaw/LiquorTaxInstallmentSpec.lean` — independent relational spec
  `specInstallmentMonths : Nat → Nat → Prop`, plus:
  - `spec_unique` — no overlapping/contradictory branches
  - `agreeInstallmentMonths (tax : Nat)` — **universal** theorem (∀ tax), not a finite sample
  - `spec_total` — all five branches reachable
  - nine boundary examples, all kernel-decided
- `JapanTaxLaw/LiquorTaxInstallmentTests.lean` — regression tests at every statutory boundary
- all three imported from `JapanTaxLaw.lean`

## Verification evidence

- Lean kernel: full build succeeded (**521 jobs**), forbidden-proof scan clean
  (`sorry`/`admit`/`axiom`/`Classical.choice` = 0).
- cross-law pin consistency: 447 pinned modules consistent, 0 failed.
- Independent read-only fidelity audit (`LIQUOR-INSTALLMENT-SRC-1`): **PASS**.
  H/T/D/C/U findings recorded; it verified the five brackets, boundary
  inclusivity (`以下`/`こえる`), spec independence, universality of the agreement
  theorem, and the absence of forbidden tokens.
- 10 mechanical evidence axes recorded in `data/verification_evidence.json` via
  `scripts/ci/record_unit_evidence.py`.

Measured status change: **NOT_STARTED 265,003 → 264,999;
FULLY_VERIFIED 0 → 4**. The same audited model covers §3 items 1–4, so the
four sibling units (`de48b1a2a49e`, `1648e9c462eb`, `bb380ddbbc5a`,
`365651e3b787`) each carry genuine evidence and are FULLY_VERIFIED. Human legal
review remains `LEGAL_REVIEW_PENDING` (separate axis).

## Residual uncertainty (not claimed as verified)

- The pinned unit is §3 item 1 only; the Lean model deliberately covers all five
  §3 brackets, as documented.
- `税額` legally denotes the per-person same-day aggregate; caller establishes it.
- Equal division, due dates, §4 (申告書), §5 (もどし入れ) and eligibility are
  NOT MODELLED.
- No human legal review. This is not legal advice.
