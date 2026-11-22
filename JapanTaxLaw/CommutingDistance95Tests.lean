import JapanTaxLaw.CommutingDistance95Spec

/-! Kernel-decided boundary examples for CommutingDistance95 (0/94/95/96 km). -/

namespace JapanTaxLaw.CommutingDistance95Tests

open JapanTaxLaw.CommutingDistance95
open JapanTaxLaw.CommutingDistance95Spec

example : withinCommute 0 = false := by decide
example : withinCommute 94 = false := by decide
example : withinCommute 95 = true := by decide
example : withinCommute 96 = true := by decide
example : specCommute 94 = false := by decide
example : specCommute 95 = true := by decide
example : specCommute 96 = true := by decide
example : agreeCommute 0 := agree_commute 0
example : agreeCommute 94 := agree_commute 94
example : agreeCommute 95 := agree_commute 95
example : agreeCommute 96 := agree_commute 96

end JapanTaxLaw.CommutingDistance95Tests
