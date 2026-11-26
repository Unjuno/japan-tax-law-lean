import JapanTaxLaw.BatchPresume370232a5b0Spec

namespace JapanTaxLaw.BatchPresume370232a5b0

example : presumed false true = false := by rfl
example : presumed true false = false := by rfl
example : specPresumed true true = presumed true true := agree_spec_impl true true
example : specPresumed false true = presumed false true := agree_spec_impl false true

end JapanTaxLaw.BatchPresume370232a5b0
