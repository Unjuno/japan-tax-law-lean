import JapanTaxLaw.BatchExcept61dd0d2daa

/-! Independent branch-form spec; exhaustive over both Bool values. -/
namespace JapanTaxLaw.BatchExcept61dd0d2daa

def specEffect (trigger : Bool) : Bool :=
  if trigger then false else true

theorem agree_spec_impl (t : Bool) : specEffect t = effectApplies t := by
  cases t <;> rfl

end JapanTaxLaw.BatchExcept61dd0d2daa
