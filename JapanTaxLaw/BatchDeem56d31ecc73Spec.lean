import JapanTaxLaw.BatchDeem56d31ecc73

/-! Independent spec: deadline guard with an inner negation. -/
namespace JapanTaxLaw.BatchDeem56d31ecc73

def specDeemed (decided : Bool) (deadlineReached : Bool) : Bool :=
  if deadlineReached then !decided else false

theorem agree_spec_impl (d t : Bool) : specDeemed d t = deemedEffect d t := by
  cases d <;> cases t <;> rfl

end JapanTaxLaw.BatchDeem56d31ecc73
