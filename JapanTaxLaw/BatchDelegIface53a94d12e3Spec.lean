import JapanTaxLaw.BatchDelegIface53a94d12e3

/-! Independent spec: authorization as an explicit branch. -/
namespace JapanTaxLaw.BatchDelegIface53a94d12e3

def specActive (d : DelegatedRecord) : Bool :=
  if d.authorized then true else false

theorem agree_spec_impl (d : DelegatedRecord) : specActive d = active d := by
  cases d with
  | mk a n =>
    unfold specActive active
    cases a <;> rfl

end JapanTaxLaw.BatchDelegIface53a94d12e3
