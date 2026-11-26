import JapanTaxLaw.BatchDelegIface3955dfb073Spec

namespace JapanTaxLaw.BatchDelegIface3955dfb073

example : active ⟨true, 0⟩ = true := by decide
example : active ⟨false, 0⟩ = false := by decide
example : specActive ⟨true, 1⟩ = active ⟨true, 1⟩ := agree_spec_impl ⟨true, 1⟩
example : specActive ⟨false, 1⟩ = active ⟨false, 1⟩ := agree_spec_impl ⟨false, 1⟩

end JapanTaxLaw.BatchDelegIface3955dfb073
