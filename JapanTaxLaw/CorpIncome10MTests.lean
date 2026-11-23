import JapanTaxLaw.CorpIncome10MSpec

/-! Kernel-decided boundary examples: 0/9999999/10000000/10000001 円. -/

namespace JapanTaxLaw.CorpIncome10MTests

open JapanTaxLaw.CorpIncome10M
open JapanTaxLaw.CorpIncome10MSpec

example : withinCorpIncome10M 0 = true := by decide
example : withinCorpIncome10M 9999999 = true := by decide
example : withinCorpIncome10M 10000000 = true := by decide
example : withinCorpIncome10M 10000001 = false := by decide
example : specWithin 9999999 = true := by decide
example : specWithin 10000000 = true := by decide
example : specWithin 10000001 = false := by decide
example : agree 0 := agree_thm 0
example : agree 9999999 := agree_thm 9999999
example : agree 10000000 := agree_thm 10000000
example : agree 10000001 := agree_thm 10000001

end JapanTaxLaw.CorpIncome10MTests
