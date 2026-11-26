import JapanTaxLaw.BatchRate7938f3c051Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRate7938f3c051

example : rate.den = 100 := by decide
example : amount 0 = 0 := by decide
example : amount 100 = 10 := by decide
example : specAmount 0 = amount 0 := agree_spec_impl 0
example : specAmount 100 = amount 100 := agree_spec_impl 100
example : specAmount 1_000 = amount 1_000 := agree_spec_impl 1_000

end JapanTaxLaw.BatchRate7938f3c051
