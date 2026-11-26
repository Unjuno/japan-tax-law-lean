import JapanTaxLaw.BatchPresumecf8d5c8453Spec

namespace JapanTaxLaw.BatchPresumecf8d5c8453

example : presumed false true = false := by rfl
example : presumed true false = false := by rfl
example : specPresumed true true = presumed true true := agree_spec_impl true true
example : specPresumed false true = presumed false true := agree_spec_impl false true

end JapanTaxLaw.BatchPresumecf8d5c8453
