import JapanTaxLaw.InheritanceResidual25_30

/-! Independent spec for InheritanceResidual25_30: `¬ x <= 25 ∧ ¬ 30 < x`. -/

namespace JapanTaxLaw.InheritanceResidual25_30Spec

def specInBand (x : Nat) : Bool :=
  decide (¬ x <= 25 ∧ ¬ 30 < x)

def agree (x : Nat) : Prop :=
  specInBand x = JapanTaxLaw.InheritanceResidual25_30.inBand x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specInBand JapanTaxLaw.InheritanceResidual25_30.inBand
  unfold JapanTaxLaw.InheritanceResidual25_30.lowerBound JapanTaxLaw.InheritanceResidual25_30.upperBound
  simp

end JapanTaxLaw.InheritanceResidual25_30Spec
