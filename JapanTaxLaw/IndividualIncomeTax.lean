import JapanTaxLaw.TaxFinance
import JapanTaxLaw.TaxRounding

/-!
# IndividualIncomeTax — 所得税法 art. 89(1) progressive tax computation (L4)

Source (pinned):
  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 94C4A7AD83726CDE60787967ED4E959585AD0AF9279D25DB9AA02264B3FE606B
  (data/raw/340AC0000000033_20261001_507AC0000000070.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

This module formalizes 所得税法 art. 89(1) **金額 → 税額** computation only —
the statutory rate table for the following:

* 課税総所得金額 (taxable general income amount),
* 課税退職所得金額 (taxable retirement income amount),
* 課税山林所得金額の五分の一に相当する金額 (one fifth of taxable woodland
  income, then multiplied by five).

The resident-income-tax amount (art. 89(1) sentence 1) applies the same table
to each applicable taxable amount. The woodland rule computes the table tax
on one fifth of the base and multiplies by five (art. 89(1) sentence 2:
「…に五を乗じて計算した金額」).

Scope and honesty notes (do NOT overclaim):

* Rounding inside the table multiplication is **per-product floor** (each
  `portion * rate.num / rate.den` via `TaxRate.applyFloor`). The statute
  does not specify intra-sum rounding for the products at art. 89; this
  model records "floor" as an explicit, visible semantics rather than
  silently choosing one. Candidate semantics only — pending independent
  legal review, like any other candidate rule in this repo.
* The rounding truncations used by tax declarations (課税標準の千円未満切り捨て /
  確定金額の百円未満切り捨て) are provided by `JapanTaxLaw.TaxRounding`
  (通則法 art. 118(1) / art. 119(1), pinned there). This module does not
  re-implement them.
* 課税総所得金額 / 課税退職所得金額 / 課税山林所得金額 are *inputs*. Their
  own definitions (art. 89(2) and the deduction chapter) are out of scope.
* 退職所得の二分の一・退職所得控除 (art. 30), 分離課税規定, 租税特別措置法,
  源泉徴収税額 tables, 復興特別所得税 and 防衛特別所得税 are all out of scope.
* The obligation, period and filing rules surrounding annual tax are
  out of scope (`TaxGeneral` / `TaxationPeriod` cover fragments).

Interface:
  `portionInBand x prev limit` — amount of `x` falling into one table band
  `statutoryTax x`            — direct statutory table sum (per-product floor)
  `woodlandTax x`             — art. 89(1) "one fifth then multiply by five"
  `residentTax g r w`         — 総所得 + 退職 + 山林 rule (art. 89(1))

Determinism: all functions are closed over `Nat` arithmetic — total,
terminating, decidable where applicable. No `sorry`, `admit`,
or unverified axioms.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- One statutory band of the art. 89(1) table. `limit` is the inclusive upper
    edge in yen for that `pct` rate; the last band (100% above 40,000,000)
    is modelled separately by `topTaxRate`. -/
structure TaxBand where
  limit : Money
  pct : Nat
  deriving DecidableEq, Repr

/-- The art. 89(1) table, in increasing order of inclusive upper edges, in yen. -/
def taxBands : List TaxBand :=
  [ { limit := 1_950_000, pct := 5 },
    { limit := 3_300_000, pct := 10 },
    { limit := 6_950_000, pct := 20 },
    { limit := 9_000_000, pct := 23 },
    { limit := 18_000_000, pct := 33 },
    { limit := 40_000_000, pct := 40 } ]

/-- 百分の四十五 — the rate for the last band (above 四千万円を超える金額). -/
def topTaxRate : TaxRate := ⟨45, 100, by decide⟩

/-- The rate for a lower band, as a `TaxRate`. -/
def bandRate (pct : Nat) : TaxRate := ⟨pct, 100, by decide⟩

/-- Amount of `x` falling into the band `[prev, limit]` (inclusive of `limit`).
    Equivalent to `min x limit - min x prev`, but written with explicit branch
    conditions so `omega` can discharge the linear arithmetic directly. -/
def portionInBand (x prev limit : Money) : Money :=
  if x ≤ limit then (if x ≤ prev then 0 else x - prev) else (limit - prev)

/-- The direct table sum: each band computed with per-product floor, then
    accumulated, then the open top band appended. Per 所得税法 art. 89(1).
    Written as an explicit term (no list recursion) so the definition is
    directly checkable by kernel/`decide` without a `match`. -/
def statutoryTax (x : Money) : Money :=
  (bandRate 5).applyFloor (portionInBand x 0 1_950_000)
  + (bandRate 10).applyFloor (portionInBand x 1_950_000 3_300_000)
  + (bandRate 20).applyFloor (portionInBand x 3_300_000 6_950_000)
  + (bandRate 23).applyFloor (portionInBand x 6_950_000 9_000_000)
  + (bandRate 33).applyFloor (portionInBand x 9_000_000 18_000_000)
  + (bandRate 40).applyFloor (portionInBand x 18_000_000 40_000_000)
  + topTaxRate.applyFloor (x - 40_000_000)

/-- Art. 89(1) woodland rule: tax on one fifth of the base, multiplied by five. -/
def woodlandTax (x : Money) : Money := statutoryTax (x / 5) * 5

/-- Art. 89(1): resident income tax amount.
    `general` — 課税総所得金額; `retirement` — 課税退職所得金額;
    `woodland` — 課税山林所得金額. The first two each take the table directly;
    woodland goes through the one-fifth sub-rule (sentence 2). -/
def residentTax (general retirement woodland : Money) : Money :=
  statutoryTax general + statutoryTax retirement + woodlandTax woodland

/-- Tax at zero is zero (boundary sanity). -/
theorem statutoryTax_zero : statutoryTax 0 = 0 := by decide

/-- Woodland tax at zero is zero (boundary sanity). -/
theorem woodlandTax_zero : woodlandTax 0 = 0 := by decide

/-- The combined resident tax at all-zero inputs is zero (boundary sanity). -/
theorem residentTax_zero : residentTax 0 0 0 = 0 := by decide

end JapanTaxLaw
