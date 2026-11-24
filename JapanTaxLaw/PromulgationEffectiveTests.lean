import JapanTaxLaw.PromulgationEffectiveSpec

/-! Regression tests — 公布の日から施行（0日オフセット). -/

namespace JapanTaxLaw.PromulgationEffective

example : daysAfterPromulgation = 0 := by decide
example : specPromulgationDay daysAfterPromulgation := agreePromulgationOffset
example : ∀ n, specPromulgationDay n → n = 0 := uniqueZero

end JapanTaxLaw.PromulgationEffective
