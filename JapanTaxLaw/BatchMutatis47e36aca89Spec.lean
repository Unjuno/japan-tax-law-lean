import JapanTaxLaw.BatchMutatis47e36aca89

/-! Independent branch-form spec over the two caller-established Bools. -/
namespace JapanTaxLaw.BatchMutatis47e36aca89

def specApplies (t r : Bool) : Bool :=
  if t then r else false

theorem agree_spec_impl (t r : Bool) : specApplies t r = appliesVia t r := by
  cases t <;> cases r <;> rfl

end JapanTaxLaw.BatchMutatis47e36aca89
