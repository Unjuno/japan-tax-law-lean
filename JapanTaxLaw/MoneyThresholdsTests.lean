import JapanTaxLaw.MoneyThresholdsSpec

/-! Regression tests — threshold boundary equivalence. -/

namespace JapanTaxLaw.MoneyThresholds

example : atLeast 700_000 700_000 = specAtLeast 700_000 700_000 :=
  atLeast_agrees 700_000 700_000
example : atLeast 699_999 700_000 = specAtLeast 699_999 700_000 :=
  atLeast_agrees 699_999 700_000
example : exceeds 500_000 500_000 = specExceeds 500_000 500_000 :=
  exceeds_agrees 500_000 500_000
example : exceeds 500_001 500_000 = specExceeds 500_001 500_000 :=
  exceeds_agrees 500_001 500_000

end JapanTaxLaw.MoneyThresholds
