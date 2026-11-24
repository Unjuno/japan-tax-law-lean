import JapanTaxLaw.DisasterIncomeUpperBand

/-!
# Independent spec — art. 2(1) strict-exceedance band

The spec restates 「七百五十万円を超える」 as the negation of the non-strict
comparison `income ≤ ¥7,500,000`, deliberately the opposite formulation from
the implementation's strict comparison. Agreement is proved for ALL `Nat`.
-/
namespace JapanTaxLaw.DisasterIncomeUpperBand

def specEligibleUpper (totalIncomeYen : Nat) : Bool :=
  !decide (totalIncomeYen <= upperThresholdYen)

theorem agree_spec_impl (n : Nat) : specEligibleUpper n = eligibleUpper n := by
  unfold specEligibleUpper eligibleUpper
  by_cases h : n <= upperThresholdYen
  · have hlt : ¬ upperThresholdYen < n := Nat.not_lt.mpr h
    have h1 : decide (n <= upperThresholdYen) = true := by simp [h]
    have h2 : decide (upperThresholdYen < n) = false := by simp [hlt]
    simp [h1, h2]
  · have hlt : upperThresholdYen < n := Nat.lt_of_not_ge h
    have h1 : decide (n <= upperThresholdYen) = false := by simp [h]
    have h2 : decide (upperThresholdYen < n) = true := by simp [hlt]
    simp [h1, h2]

end JapanTaxLaw.DisasterIncomeUpperBand
