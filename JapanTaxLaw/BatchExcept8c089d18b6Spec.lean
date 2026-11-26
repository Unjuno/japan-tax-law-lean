import JapanTaxLaw.BatchExcept8c089d18b6

/-! Independent branch-form spec; exhaustive over both Bool values. -/
namespace JapanTaxLaw.BatchExcept8c089d18b6

def specEffect (trigger : Bool) : Bool :=
  if trigger then false else true

theorem agree_spec_impl (t : Bool) : specEffect t = effectApplies t := by
  cases t <;> rfl

end JapanTaxLaw.BatchExcept8c089d18b6
