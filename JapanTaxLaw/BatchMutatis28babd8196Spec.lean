import JapanTaxLaw.BatchMutatis28babd8196

/-! Independent branch-form spec over the two caller-established Bools. -/
namespace JapanTaxLaw.BatchMutatis28babd8196

def specApplies (t r : Bool) : Bool :=
  if t then r else false

theorem agree_spec_impl (t r : Bool) : specApplies t r = appliesVia t r := by
  cases t <;> cases r <;> rfl

end JapanTaxLaw.BatchMutatis28babd8196
