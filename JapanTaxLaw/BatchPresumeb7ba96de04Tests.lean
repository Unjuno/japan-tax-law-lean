import JapanTaxLaw.BatchPresumeb7ba96de04Spec

namespace JapanTaxLaw.BatchPresumeb7ba96de04

example : presumed false true = false := by rfl
example : presumed true false = false := by rfl
example : specPresumed true true = presumed true true := agree_spec_impl true true
example : specPresumed false true = presumed false true := agree_spec_impl false true

end JapanTaxLaw.BatchPresumeb7ba96de04
