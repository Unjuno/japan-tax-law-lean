import JapanTaxLaw.DisasterIncomeThreshold

/-!
# Independent spec for 昭和二十二年法律第百七十五号 art. 2(1)

The spec restates 「五百万円以下」 as the negation of the strict comparison
`¥5,000,000 < totalIncome`, deliberately different in formulation from the
implementation's non-strict comparison. The agreement theorem covers ALL
`Nat` inputs (no finite grid), and its axiom footprint is checked separately.
-/
namespace JapanTaxLaw.DisasterIncomeThreshold

/-- Independent statement: not (threshold < income). -/
def specEligible (totalIncomeYen : Nat) : Bool :=
  !decide (thresholdYen < totalIncomeYen)

/-- Universal agreement — not a finite enumeration. -/
theorem agree_spec_impl (n : Nat) : specEligible n = eligible n := by
  unfold specEligible eligible
  by_cases h : n <= thresholdYen
  · have hlt : ¬ thresholdYen < n := Nat.not_lt.mpr h
    simp [h, hlt]
  · have hlt : thresholdYen < n := Nat.lt_of_not_ge h
    simp [h, hlt]

end JapanTaxLaw.DisasterIncomeThreshold
