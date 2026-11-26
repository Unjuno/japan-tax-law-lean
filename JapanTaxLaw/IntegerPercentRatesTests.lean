import JapanTaxLaw.IntegerPercentRatesSpec

/-! Regression tests — rate identity, complement, scaling, monotonicity. -/

namespace JapanTaxLaw.IntegerPercentRates

example : percentNumerator 1000 100 = 100 * 1000 := numerator_hundred 1000
example : percentNumerator 200 25 + percentNumerator 200 75 = 100 * 200 :=
  numerator_complement 200 25 (by decide)
example : percentNumerator (7 * 100) 15 = 100 * percentNumerator 7 15 :=
  numerator_scaling 7 15
example : percentNumerator 500 5 ≤ percentNumerator 500 20 :=
  numerator_monotone 500 5 20 (by decide)
example : percentNumerator 1000 5 = specNumerator 1000 5 := numerator_agrees 1000 5

end JapanTaxLaw.IntegerPercentRates
