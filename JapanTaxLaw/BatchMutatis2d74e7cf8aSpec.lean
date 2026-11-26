import JapanTaxLaw.BatchMutatis2d74e7cf8a

/-! Independent branch-form spec over the two caller-established Bools. -/
namespace JapanTaxLaw.BatchMutatis2d74e7cf8a

def specApplies (t r : Bool) : Bool :=
  if t then r else false

theorem agree_spec_impl (t r : Bool) : specApplies t r = appliesVia t r := by
  cases t <;> cases r <;> rfl

end JapanTaxLaw.BatchMutatis2d74e7cf8a
