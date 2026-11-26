import JapanTaxLaw.BatchDeem94a02b67ec

/-! Independent spec: deadline guard with an inner negation. -/
namespace JapanTaxLaw.BatchDeem94a02b67ec

def specDeemed (decided : Bool) (deadlineReached : Bool) : Bool :=
  if deadlineReached then !decided else false

theorem agree_spec_impl (d t : Bool) : specDeemed d t = deemedEffect d t := by
  cases d <;> cases t <;> rfl

end JapanTaxLaw.BatchDeem94a02b67ec
