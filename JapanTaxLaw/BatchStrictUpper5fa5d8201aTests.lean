import JapanTaxLaw.BatchStrictUpper5fa5d8201aSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchStrictUpper5fa5d8201a

example : upperYen = 180000 := by decide
example : meets 179999 = true := by decide
example : meets 180000 = false := by decide
example : specMeets 179999 = meets 179999 := agree_spec_impl 179999
example : specMeets 180000 = meets 180000 := agree_spec_impl 180000
example : specMeets 180001 = meets 180001 := agree_spec_impl 180001

end JapanTaxLaw.BatchStrictUpper5fa5d8201a
