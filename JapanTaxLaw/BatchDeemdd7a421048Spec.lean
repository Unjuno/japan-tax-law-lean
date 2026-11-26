import JapanTaxLaw.BatchDeemdd7a421048

/-! Independent spec: deadline guard with an inner negation. -/
namespace JapanTaxLaw.BatchDeemdd7a421048

def specDeemed (decided : Bool) (deadlineReached : Bool) : Bool :=
  if deadlineReached then !decided else false

theorem agree_spec_impl (d t : Bool) : specDeemed d t = deemedEffect d t := by
  cases d <;> cases t <;> rfl

end JapanTaxLaw.BatchDeemdd7a421048
