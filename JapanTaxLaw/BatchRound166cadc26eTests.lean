import JapanTaxLaw.BatchRound166cadc26eSpec

namespace JapanTaxLaw.BatchRound166cadc26e

example : unit = 100 := by rfl
example : truncateAmount 0 = 0 := by decide
example : truncateAmount (100 - 1) = 0 := by decide
example : truncateAmount 100 = 100 := by decide
example : truncateAmount (100 + 1) = 100 := by decide
example : truncateAmount (100 * 7 + 3) = 100 * 7 := by decide
example : specTruncate (100 * 7 + 3) = truncateAmount (100 * 7 + 3) := agree_spec_impl (100 * 7 + 3)

end JapanTaxLaw.BatchRound166cadc26e
