import JapanTaxLaw.BatchDelegIface77ef0c086d

/-! Independent spec: authorization as an explicit branch. -/
namespace JapanTaxLaw.BatchDelegIface77ef0c086d

def specActive (d : DelegatedRecord) : Bool :=
  if d.authorized then true else false

theorem agree_spec_impl (d : DelegatedRecord) : specActive d = active d := by
  cases d with
  | mk a n =>
    unfold specActive active
    cases a <;> rfl

end JapanTaxLaw.BatchDelegIface77ef0c086d
