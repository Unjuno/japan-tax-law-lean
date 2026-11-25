import JapanTaxLaw.ForeignTradeUsageRatio80Spec

/-! Kernel-decided boundary examples. -/

namespace JapanTaxLaw.ForeignTradeUsageRatio80Tests

open JapanTaxLaw.ForeignTradeUsageRatio80
open JapanTaxLaw.ForeignTradeUsageRatio80Spec

example : triggered 79 = false := by decide
example : triggered 80 = false := by decide
example : triggered 81 = true := by decide
example : agree 80 := agree_thm 80
example : agree 81 := agree_thm 81

end JapanTaxLaw.ForeignTradeUsageRatio80Tests
