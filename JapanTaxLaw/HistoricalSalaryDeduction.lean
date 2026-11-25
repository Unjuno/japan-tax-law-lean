import JapanTaxLaw.TaxFinance

/-!
# HistoricalSalaryDeduction — 3 の pinned 給与所得控除額（旧法）算定式

Each pinned unit states: for income ≤ cap, the deduction is
`base + (income - base) × 2/10` (十分の二). The three historical versions use
bases 30,000 / 40,000 / 100,000 yen and caps 530,000 / 640,000 / 900,000 yen.

The model computes `base + (income - base) * 2 / 10` with saturating subtraction
outside the stated cap. Eligibility and other bands are caller-established and
NOT MODELLED. Not legal advice.
-/

namespace JapanTaxLaw.HistoricalSalaryDeduction

inductive Band where
  | base30000 | base40000 | base100000
deriving DecidableEq, Repr

/-- 控除の基準額（円）。 -/
def bandBase : Band → Nat
  | Band.base30000 => 30_000
  | Band.base40000 => 40_000
  | Band.base100000 => 100_000

/-- 実装: base + (income - base) × 十分の二（ Nakamoto: floor）。 -/
def deduction (band : Band) (income : Nat) : Nat :=
  let base := bandBase band
  base + (income - base) * 2 / 10

example : deduction Band.base30000 530_000 = 130_000 := by decide
example : deduction Band.base40000 640_000 = 160_000 := by decide
example : deduction Band.base100000 900_000 = 260_000 := by decide

end JapanTaxLaw.HistoricalSalaryDeduction
