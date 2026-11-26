import JapanTaxLaw.BatchRounda052e6fb1fSpec

namespace JapanTaxLaw.BatchRounda052e6fb1f

example : unit = 1 := by rfl
example : truncateAmount 0 = 0 := by decide
example : truncateAmount (1 - 1) = 0 := by decide
example : truncateAmount 1 = 1 := by decide
example : truncateAmount (1 + 1) = 1 + 1 := by decide
example : truncateAmount (1 * 7) = 1 * 7 := by decide
example : specTruncate (1 * 7) = truncateAmount (1 * 7) := agree_spec_impl (1 * 7)

end JapanTaxLaw.BatchRounda052e6fb1f
