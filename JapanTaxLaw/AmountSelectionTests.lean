import JapanTaxLaw.AmountSelectionSpec

/-! Regression tests — selection boundaries and lattice characterisations. -/

namespace JapanTaxLaw.AmountSelection

example : greaterAmount 50 50 = specGreater 50 50 := greater_agrees 50 50
example : lesserAmount 50 50 = specLesser 50 50 := lesser_agrees 50 50
example : greaterAmount 30 50 = specGreater 30 50 := greater_agrees 30 50
example : lesserAmount 50 30 = specLesser 50 30 := lesser_agrees 50 30

example : greaterAmount 30 50 = 50 := by decide
example : lesserAmount 30 50 = 30 := by decide

example : ∀ c, 30 ≤ c → 50 ≤ c → greaterAmount 30 50 ≤ c :=
  (greater_is_least_upper_bound 30 50).2.2

example : ∀ c, c ≤ 30 → c ≤ 50 → c ≤ lesserAmount 30 50 :=
  (lesser_is_greatest_lower_bound 30 50).2.2

end JapanTaxLaw.AmountSelection
