import JapanTaxLaw.TaxFinance

/-!
# CeilRoundingMinimum — 6 の 切り上げ（端数処理）規定

Pinned units round a remainder up to the next threshold multiple, and state
that an amount entirely below the threshold is raised to the threshold
(e.g. 百円未満であるときはその全額を切り上げた金額). Thresholds: 一/百/千円.
The underlying amount computation is caller-established and NOT MODELLED.
Not legal advice.
-/

namespace JapanTaxLaw.CeilRoundingMinimum

def ceilAt (amount threshold : Nat) : Nat :=
  if threshold = 0 then amount
  else if amount % threshold = 0 then amount
  else amount + (threshold - amount % threshold)

def ceilOrMinimum (amount threshold : Nat) : Nat :=
  if amount < threshold then threshold else ceilAt amount threshold

example : ceilAt 1_499 1000 = 2000 := by decide
example : ceilOrMinimum 99 100 = 100 := by decide
example : ceilOrMinimum 100 100 = 100 := by decide
example : ceilOrMinimum 0 1 = 1 := by decide

end JapanTaxLaw.CeilRoundingMinimum
