import JapanTaxLaw.BatchFraction1b4097bb68Spec

/-! Kernel-decided boundary checks. -/
namespace JapanTaxLaw.BatchFraction1b4097bb68

example : den = 100 := by decide
example : specMeets 0 100 = meets 0 100 := agree_spec_impl 0 100
example : specMeets 1 100 = meets 1 100 := agree_spec_impl 1 100
example : specMeets 2 100 = meets 2 100 := agree_spec_impl 2 100

end JapanTaxLaw.BatchFraction1b4097bb68
