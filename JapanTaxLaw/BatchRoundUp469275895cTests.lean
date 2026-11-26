import JapanTaxLaw.BatchRoundUp469275895cSpec

namespace JapanTaxLaw.BatchRoundUp469275895c

example : unit = 1000 := by rfl
example : roundUpAmount 0 = 0 := by decide
example : roundUpAmount (1000 - 1) = 1000 := by decide
example : roundUpAmount 1000 = 1000 := by decide
example : roundUpAmount (1000 + 1) = 1000 + 1000 := by decide
example : specRoundUp (1000 * 7 + 3) = roundUpAmount (1000 * 7 + 3) := agree_spec_impl (1000 * 7 + 3)

end JapanTaxLaw.BatchRoundUp469275895c
