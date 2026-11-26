import JapanTaxLaw.BatchDelegIfaceb9313f295aSpec

namespace JapanTaxLaw.BatchDelegIfaceb9313f295a

example : active ⟨true, 0⟩ = true := by decide
example : active ⟨false, 0⟩ = false := by decide
example : specActive ⟨true, 1⟩ = active ⟨true, 1⟩ := agree_spec_impl ⟨true, 1⟩
example : specActive ⟨false, 1⟩ = active ⟨false, 1⟩ := agree_spec_impl ⟨false, 1⟩

end JapanTaxLaw.BatchDelegIfaceb9313f295a
