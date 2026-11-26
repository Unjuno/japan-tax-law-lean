import JapanTaxLaw.BatchRoundbb9718ad77Spec

namespace JapanTaxLaw.BatchRoundbb9718ad77

example : unit = 1 := by rfl
example : truncateAmount 0 = 0 := by decide
example : truncateAmount (1 - 1) = 0 := by decide
example : truncateAmount 1 = 1 := by decide
example : truncateAmount (1 + 1) = 1 + 1 := by decide
example : truncateAmount (1 * 7) = 1 * 7 := by decide
example : specTruncate (1 * 7) = truncateAmount (1 * 7) := agree_spec_impl (1 * 7)

end JapanTaxLaw.BatchRoundbb9718ad77
