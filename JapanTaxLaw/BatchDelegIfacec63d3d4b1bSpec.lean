import JapanTaxLaw.BatchDelegIfacec63d3d4b1b

/-! Independent spec: authorization as an explicit branch. -/
namespace JapanTaxLaw.BatchDelegIfacec63d3d4b1b

def specActive (d : DelegatedRecord) : Bool :=
  if d.authorized then true else false

theorem agree_spec_impl (d : DelegatedRecord) : specActive d = active d := by
  cases d with
  | mk a n =>
    unfold specActive active
    cases a <;> rfl

end JapanTaxLaw.BatchDelegIfacec63d3d4b1b
