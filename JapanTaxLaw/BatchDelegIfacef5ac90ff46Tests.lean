import JapanTaxLaw.BatchDelegIfacef5ac90ff46Spec

namespace JapanTaxLaw.BatchDelegIfacef5ac90ff46

example : active ⟨true, 0⟩ = true := by decide
example : active ⟨false, 0⟩ = false := by decide
example : specActive ⟨true, 1⟩ = active ⟨true, 1⟩ := agree_spec_impl ⟨true, 1⟩
example : specActive ⟨false, 1⟩ = active ⟨false, 1⟩ := agree_spec_impl ⟨false, 1⟩

end JapanTaxLaw.BatchDelegIfacef5ac90ff46
