import JapanTaxLaw.BatchRoundd25590ff50Spec

namespace JapanTaxLaw.BatchRoundd25590ff50

example : unit = 1000 := by rfl
example : truncateAmount 0 = 0 := by decide
example : truncateAmount (1000 - 1) = 0 := by decide
example : truncateAmount 1000 = 1000 := by decide
example : truncateAmount (1000 + 1) = 1000 := by decide
example : truncateAmount (1000 * 7 + 3) = 1000 * 7 := by decide
example : specTruncate (1000 * 7 + 3) = truncateAmount (1000 * 7 + 3) := agree_spec_impl (1000 * 7 + 3)

end JapanTaxLaw.BatchRoundd25590ff50
