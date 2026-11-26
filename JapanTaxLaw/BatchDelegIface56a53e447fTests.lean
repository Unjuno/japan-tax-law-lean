import JapanTaxLaw.BatchDelegIface56a53e447fSpec

namespace JapanTaxLaw.BatchDelegIface56a53e447f

example : active ⟨true, 0⟩ = true := by decide
example : active ⟨false, 0⟩ = false := by decide
example : specActive ⟨true, 1⟩ = active ⟨true, 1⟩ := agree_spec_impl ⟨true, 1⟩
example : specActive ⟨false, 1⟩ = active ⟨false, 1⟩ := agree_spec_impl ⟨false, 1⟩

end JapanTaxLaw.BatchDelegIface56a53e447f
