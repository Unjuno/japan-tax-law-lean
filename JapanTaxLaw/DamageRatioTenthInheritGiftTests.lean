import JapanTaxLaw.DamageRatioTenthInheritGiftSpec

/-! Kernel-decided ratio examples (no division). -/

namespace JapanTaxLaw.DamageRatioTenthInheritGiftTests

open JapanTaxLaw.DamageRatioTenthInheritGift
open JapanTaxLaw.DamageRatioTenthInheritGiftSpec

example : hasTenthOrMore 100 9 = false := by decide
example : hasTenthOrMore 100 10 = true := by decide
example : hasTenthOrMore 100 11 = true := by decide
example : hasTenthOrMore 0 10 = false := by decide
example : specTenth 100 9 = false := by decide
example : specTenth 100 10 = true := by decide
example : agree 100 9 := agree_thm 100 9
example : agree 100 10 := agree_thm 100 10
example : agree 0 10 := agree_thm 0 10

end JapanTaxLaw.DamageRatioTenthInheritGiftTests
