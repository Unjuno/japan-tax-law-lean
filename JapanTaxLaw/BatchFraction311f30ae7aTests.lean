import JapanTaxLaw.BatchFraction311f30ae7aSpec

/-! Kernel-decided boundary checks. -/
namespace JapanTaxLaw.BatchFraction311f30ae7a

example : den = 538 := by decide
example : specMeets 0 538 = meets 0 538 := agree_spec_impl 0 538
example : specMeets 1 538 = meets 1 538 := agree_spec_impl 1 538
example : specMeets 2 538 = meets 2 538 := agree_spec_impl 2 538

end JapanTaxLaw.BatchFraction311f30ae7a
