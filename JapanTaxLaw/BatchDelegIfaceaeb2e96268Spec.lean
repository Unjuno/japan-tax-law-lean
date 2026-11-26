import JapanTaxLaw.BatchDelegIfaceaeb2e96268

/-! Independent spec: authorization as an explicit branch. -/
namespace JapanTaxLaw.BatchDelegIfaceaeb2e96268

def specActive (d : DelegatedRecord) : Bool :=
  if d.authorized then true else false

theorem agree_spec_impl (d : DelegatedRecord) : specActive d = active d := by
  cases d with
  | mk a n =>
    unfold specActive active
    cases a <;> rfl

end JapanTaxLaw.BatchDelegIfaceaeb2e96268
