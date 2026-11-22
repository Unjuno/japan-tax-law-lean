import JapanTaxLaw.CustomsSmallConsignmentCap

/-! Independent spec for CustomsSmallConsignmentCap: strict `¬ 10000 < x` form. -/

namespace JapanTaxLaw.CustomsSmallConsignmentCapSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ 10000 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.CustomsSmallConsignmentCap.customsSmallCap x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.CustomsSmallConsignmentCap.customsSmallCap
  unfold JapanTaxLaw.CustomsSmallConsignmentCap.smallConsignmentCapYen
  simp

end JapanTaxLaw.CustomsSmallConsignmentCapSpec
