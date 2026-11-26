import JapanTaxLaw.BatchRound5b5ac360b8Spec

namespace JapanTaxLaw.BatchRound5b5ac360b8

example : unit = 100 := by rfl
example : truncateAmount 0 = 0 := by decide
example : truncateAmount (100 - 1) = 0 := by decide
example : truncateAmount 100 = 100 := by decide
example : truncateAmount (100 + 1) = 100 := by decide
example : truncateAmount (100 * 7 + 3) = 100 * 7 := by decide
example : specTruncate (100 * 7 + 3) = truncateAmount (100 * 7 + 3) := agree_spec_impl (100 * 7 + 3)

end JapanTaxLaw.BatchRound5b5ac360b8
