import JapanTaxLaw.BatchDeem739d0a1085Spec

namespace JapanTaxLaw.BatchDeem739d0a1085

example : periodCount = 1 := by rfl
example : deemedEffect false true = true := by rfl
example : deemedEffect true true = false := by rfl
example : deemedEffect false false = false := by rfl
example : specDeemed false true = deemedEffect false true := agree_spec_impl false true
example : specDeemed true false = deemedEffect true false := agree_spec_impl true false

end JapanTaxLaw.BatchDeem739d0a1085
