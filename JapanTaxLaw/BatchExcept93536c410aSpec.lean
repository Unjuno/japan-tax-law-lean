import JapanTaxLaw.BatchExcept93536c410a

/-! Independent branch-form spec; exhaustive over both Bool values. -/
namespace JapanTaxLaw.BatchExcept93536c410a

def specEffect (trigger : Bool) : Bool :=
  if trigger then false else true

theorem agree_spec_impl (t : Bool) : specEffect t = effectApplies t := by
  cases t <;> rfl

end JapanTaxLaw.BatchExcept93536c410a
