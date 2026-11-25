import JapanTaxLaw.DisasterTaxReduction

/-!
# DisasterTaxReductionSpec — 独立仕様（約分・帯域表）

The implementation uses 5/10 and 25/100. This independent spec uses 1/2 and
1/4, and selects the band through a separate table function instead of the
implementation's nested `if`. Universal theorems prove agreement for ALL
`tax` and `income`.
-/

namespace JapanTaxLaw.DisasterTaxReduction

-- 5/10 = 1/2 (全称)
theorem pct5 (tax : Nat) : tax * 5 / 10 = tax / 2 := by
  rw [show 10 = 2 * 5 by decide]
  exact Nat.mul_div_mul_right tax 2 (by decide)

-- 25/100 = 1/4 (全称)
theorem pct25 (tax : Nat) : tax * 25 / 100 = tax / 4 := by
  rw [show 100 = 4 * 25 by decide]
  exact Nat.mul_div_mul_right tax 4 (by decide)

def incomeBand (income : Nat) : Nat :=
  if income ≤ 5_000_000 then 0
  else if income ≤ 7_500_000 then 1
  else 2

def bandQuarter (band : Nat) : Nat :=
  match band with
  | 0 => 1
  | 1 => 2
  | _ => 4

def specReductionAmount (tax income : Nat) : Nat :=
  tax / bandQuarter (incomeBand income)

theorem agreeReduction (tax income : Nat) :
    reductionAmount tax income = specReductionAmount tax income := by
  unfold reductionAmount specReductionAmount incomeBand bandQuarter
  by_cases h1 : income ≤ 5_000_000
  · simp [h1]
  · by_cases h2 : income ≤ 7_500_000
    · simp [h1, h2, pct5]
    · simp [h1, h2, pct25]

end JapanTaxLaw.DisasterTaxReduction
