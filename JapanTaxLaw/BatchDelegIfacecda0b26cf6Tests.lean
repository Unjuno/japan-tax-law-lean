import JapanTaxLaw.BatchDelegIfacecda0b26cf6Spec

namespace JapanTaxLaw.BatchDelegIfacecda0b26cf6

example : active ⟨true, 0⟩ = true := by decide
example : active ⟨false, 0⟩ = false := by decide
example : specActive ⟨true, 1⟩ = active ⟨true, 1⟩ := agree_spec_impl ⟨true, 1⟩
example : specActive ⟨false, 1⟩ = active ⟨false, 1⟩ := agree_spec_impl ⟨false, 1⟩

end JapanTaxLaw.BatchDelegIfacecda0b26cf6
