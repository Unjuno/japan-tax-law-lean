import JapanTaxLaw.BatchDelegIfaceb9313f295a

/-! Independent spec: authorization as an explicit branch. -/
namespace JapanTaxLaw.BatchDelegIfaceb9313f295a

def specActive (d : DelegatedRecord) : Bool :=
  if d.authorized then true else false

theorem agree_spec_impl (d : DelegatedRecord) : specActive d = active d := by
  cases d with
  | mk a n =>
    unfold specActive active
    cases a <;> rfl

end JapanTaxLaw.BatchDelegIfaceb9313f295a
