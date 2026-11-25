import JapanTaxLaw.FractionRates110Spec

/-! Regression tests — 百十分の百 counterexamples from the adversarial audit. -/

namespace JapanTaxLaw.FractionRates110

example : rate100Over110 110 = 100 := by decide
example : rate100Over110 110 ≠ 1100 := by decide
example : rate100Over110 1_000 = 909 := by decide
example : rate100Over110 1_000 ≠ 10_000 := by decide
example : rate100Over110 110 = spec100Over110 110 := rate100Over110_agrees 110
example : rate100Over110 1_000 = spec100Over110 1_000 := rate100Over110_agrees 1_000

end JapanTaxLaw.FractionRates110
