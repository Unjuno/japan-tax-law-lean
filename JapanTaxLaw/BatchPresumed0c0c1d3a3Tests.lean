import JapanTaxLaw.BatchPresumed0c0c1d3a3Spec

namespace JapanTaxLaw.BatchPresumed0c0c1d3a3

example : presumed false true = false := by rfl
example : presumed true false = false := by rfl
example : specPresumed true true = presumed true true := agree_spec_impl true true
example : specPresumed false true = presumed false true := agree_spec_impl false true

end JapanTaxLaw.BatchPresumed0c0c1d3a3
