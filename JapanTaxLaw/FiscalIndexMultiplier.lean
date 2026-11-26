import JapanTaxLaw.TaxFinance

/-!
# FiscalIndexMultiplier — 不均一課税の 財政力指数 3 段階係数

Pinned 地方税法 provision: the unequal-taxation multiplier is 1 when the
fiscal index is below 0.47, 2/3 for [0.47, 0.63), and 1/3 for [0.63, 0.78).
The index is supplied scaled by 100 (47 = 0.47). The multiplier is returned
as a reduced (numerator, denominator) pair. Values ≥0.78 are OUT OF SCOPE
(the statute's companion table is not in this unit). Not legal advice.
-/

namespace JapanTaxLaw.FiscalIndexMultiplier

/-- 財政力指数 × 100 を入力とし、係数を (分子, 分母) で返す。 -/
def multiplier (index100 : Nat) : Nat × Nat :=
  if index100 < 47 then (1, 1)
  else if index100 < 63 then (2, 3)
  else if index100 < 78 then (1, 3)
  else (0, 1)

example : multiplier 46 = (1, 1) := by decide
example : multiplier 47 = (2, 3) := by decide
example : multiplier 63 = (1, 3) := by decide
example : multiplier 78 = (0, 1) := by decide

end JapanTaxLaw.FiscalIndexMultiplier
