import JapanTaxLaw.BatchDeem6c50ac8559Spec

namespace JapanTaxLaw.BatchDeem6c50ac8559

example : periodCount = 0 := by rfl
example : deemedEffect false true = true := by rfl
example : deemedEffect true true = false := by rfl
example : deemedEffect false false = false := by rfl
example : specDeemed false true = deemedEffect false true := agree_spec_impl false true
example : specDeemed true false = deemedEffect true false := agree_spec_impl true false

end JapanTaxLaw.BatchDeem6c50ac8559
