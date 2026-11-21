import JapanTaxLaw.CollectionPeriodCap30Spec

/-! Kernel-decided boundary examples for 国税徴収法 art. 115 (30-day cap). -/

namespace JapanTaxLaw.CollectionPeriodCap30Tests

open JapanTaxLaw.CollectionPeriodCap30
open JapanTaxLaw.CollectionPeriodCap30Spec

example : withinPeriod 0 = true := by decide
example : withinPeriod 29 = true := by decide
example : withinPeriod 30 = true := by decide
example : withinPeriod 31 = false := by decide
example : specWithin 29 = true := by decide
example : specWithin 30 = true := by decide
example : specWithin 31 = false := by decide
example : agreeWithin 0 := agree_within 0
example : agreeWithin 29 := agree_within 29
example : agreeWithin 30 := agree_within 30
example : agreeWithin 31 := agree_within 31

end JapanTaxLaw.CollectionPeriodCap30Tests
