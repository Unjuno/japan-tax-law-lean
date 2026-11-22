import JapanTaxLaw.TaxErasureExtension30

/-! Independent spec for TaxErasureExtension30: strict `¬ 30 < x` form. -/

namespace JapanTaxLaw.TaxErasureExtension30Spec

def specWithin (x : Nat) : Bool :=
  decide (¬ 30 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.TaxErasureExtension30.withinExtension x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.TaxErasureExtension30.withinExtension
  unfold JapanTaxLaw.TaxErasureExtension30.extensionCapDays
  simp

end JapanTaxLaw.TaxErasureExtension30Spec
