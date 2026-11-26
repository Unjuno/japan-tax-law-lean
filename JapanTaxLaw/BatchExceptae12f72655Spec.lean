import JapanTaxLaw.BatchExceptae12f72655

/-! Independent branch-form spec; exhaustive over both Bool values. -/
namespace JapanTaxLaw.BatchExceptae12f72655

def specEffect (trigger : Bool) : Bool :=
  if trigger then false else true

theorem agree_spec_impl (t : Bool) : specEffect t = effectApplies t := by
  cases t <;> rfl

end JapanTaxLaw.BatchExceptae12f72655
