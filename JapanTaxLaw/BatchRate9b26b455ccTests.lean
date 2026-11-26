import JapanTaxLaw.BatchRate9b26b455ccSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchRate9b26b455cc

example : rate.den = 100 := by decide
example : amount 0 = 0 := by decide
example : amount 100 = 19 := by decide
example : specAmount 0 = amount 0 := agree_spec_impl 0
example : specAmount 100 = amount 100 := agree_spec_impl 100
example : specAmount 1_000 = amount 1_000 := agree_spec_impl 1_000

end JapanTaxLaw.BatchRate9b26b455cc
