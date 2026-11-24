import JapanTaxLaw.BatchFraction87afee96dbSpec

/-! Kernel-decided boundary checks. -/
namespace JapanTaxLaw.BatchFraction87afee96db

example : den = 5 := by decide
example : specMeets 0 5 = meets 0 5 := agree_spec_impl 0 5
example : specMeets 1 5 = meets 1 5 := agree_spec_impl 1 5
example : specMeets 2 5 = meets 2 5 := agree_spec_impl 2 5

end JapanTaxLaw.BatchFraction87afee96db
