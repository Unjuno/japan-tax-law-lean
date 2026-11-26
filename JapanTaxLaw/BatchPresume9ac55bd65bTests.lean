import JapanTaxLaw.BatchPresume9ac55bd65bSpec

namespace JapanTaxLaw.BatchPresume9ac55bd65b

example : presumed false true = false := by rfl
example : presumed true false = false := by rfl
example : specPresumed true true = presumed true true := agree_spec_impl true true
example : specPresumed false true = presumed false true := agree_spec_impl false true

end JapanTaxLaw.BatchPresume9ac55bd65b
