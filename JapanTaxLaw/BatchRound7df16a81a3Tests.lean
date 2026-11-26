import JapanTaxLaw.BatchRound7df16a81a3Spec

namespace JapanTaxLaw.BatchRound7df16a81a3

example : unit = 10000 := by rfl
example : truncateAmount 0 = 0 := by decide
example : truncateAmount (10000 - 1) = 0 := by decide
example : truncateAmount 10000 = 10000 := by decide
example : truncateAmount (10000 + 1) = 10000 := by decide
example : truncateAmount (10000 * 7 + 3) = 10000 * 7 := by decide
example : specTruncate (10000 * 7 + 3) = truncateAmount (10000 * 7 + 3) := agree_spec_impl (10000 * 7 + 3)

end JapanTaxLaw.BatchRound7df16a81a3
