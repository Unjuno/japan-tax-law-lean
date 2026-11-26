import JapanTaxLaw.BatchRoundUp34cf76492eSpec

namespace JapanTaxLaw.BatchRoundUp34cf76492e

example : unit = 100 := by rfl
example : roundUpAmount 0 = 0 := by decide
example : roundUpAmount (100 - 1) = 100 := by decide
example : roundUpAmount 100 = 100 := by decide
example : roundUpAmount (100 + 1) = 100 + 100 := by decide
example : specRoundUp (100 * 7 + 3) = roundUpAmount (100 * 7 + 3) := agree_spec_impl (100 * 7 + 3)

end JapanTaxLaw.BatchRoundUp34cf76492e
