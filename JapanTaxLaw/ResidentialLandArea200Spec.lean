import JapanTaxLaw.ResidentialLandArea200

/-!
# ResidentialLandArea200Spec — independent spec for 地方税法 art. 349の3の二

Independently transcribed 「二百平方メートル以下」 as the strict `¬ 200 < sqm`
formulation, rather than the implementation's `sqm <= 200`. Agreement is
checked in the Lean kernel.
-/

namespace JapanTaxLaw.ResidentialLandArea200Spec

def specWithinArea (sqm : Nat) : Bool :=
  decide (¬ 200 < sqm)

def agreeArea (s : Nat) : Prop :=
  specWithinArea s = JapanTaxLaw.ResidentialLandArea200.withinArea s

theorem agree_area (s : Nat) : agreeArea s := by
  unfold agreeArea specWithinArea JapanTaxLaw.ResidentialLandArea200.withinArea
  unfold JapanTaxLaw.ResidentialLandArea200.areaThresholdSqm
  simp

end JapanTaxLaw.ResidentialLandArea200Spec
