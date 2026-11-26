import JapanTaxLaw.BatchDeemc654495c0a

/-! Independent spec: deadline guard with an inner negation. -/
namespace JapanTaxLaw.BatchDeemc654495c0a

def specDeemed (decided : Bool) (deadlineReached : Bool) : Bool :=
  if deadlineReached then !decided else false

theorem agree_spec_impl (d t : Bool) : specDeemed d t = deemedEffect d t := by
  cases d <;> cases t <;> rfl

end JapanTaxLaw.BatchDeemc654495c0a
