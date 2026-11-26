import JapanTaxLaw.BatchRound5339396a52Spec

namespace JapanTaxLaw.BatchRound5339396a52

example : unit = 1 := by rfl
example : truncateAmount 0 = 0 := by decide
example : truncateAmount (1 - 1) = 0 := by decide
example : truncateAmount 1 = 1 := by decide
example : truncateAmount (1 + 1) = 1 + 1 := by decide
example : truncateAmount (1 * 7) = 1 * 7 := by decide
example : specTruncate (1 * 7) = truncateAmount (1 * 7) := agree_spec_impl (1 * 7)

end JapanTaxLaw.BatchRound5339396a52
