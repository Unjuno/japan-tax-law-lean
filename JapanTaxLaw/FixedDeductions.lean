import JapanTaxLaw.TaxFinance

/-!
# FixedDeductions — 7 の 定額控除規定

Pinned provisions state 「課税価格から六十万円を控除」 etc. The computation is
`base - fixed` clamped at zero (Nat subtraction). The definition of `base` and
all eligibility conditions are caller-established and NOT MODELLED.
Not legal advice.
-/

namespace JapanTaxLaw.FixedDeductions

def fixedDeduction (base fixed : Nat) : Nat :=
  if fixed ≤ base then base - fixed else 0

example : fixedDeduction 1_000_000 600_000 = 400_000 := by decide
example : fixedDeduction 100 200 = 0 := by decide
example : fixedDeduction 5 1 = 4 := by decide

end JapanTaxLaw.FixedDeductions
