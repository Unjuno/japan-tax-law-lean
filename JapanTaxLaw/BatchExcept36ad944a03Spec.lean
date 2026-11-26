import JapanTaxLaw.BatchExcept36ad944a03

/-! Independent branch-form spec; exhaustive over both Bool values. -/
namespace JapanTaxLaw.BatchExcept36ad944a03

def specEffect (trigger : Bool) : Bool :=
  if trigger then false else true

theorem agree_spec_impl (t : Bool) : specEffect t = effectApplies t := by
  cases t <;> rfl

end JapanTaxLaw.BatchExcept36ad944a03
