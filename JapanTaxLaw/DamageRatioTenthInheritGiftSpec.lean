import JapanTaxLaw.DamageRatioTenthInheritGift

/-! Independent spec for DamageRatioTenthInheritGift: `total > 0 ∧ ¬ oneTenth * damaged < total`. -/

namespace JapanTaxLaw.DamageRatioTenthInheritGiftSpec

def specTenth (total damaged : Nat) : Bool :=
  decide (total > 0 ∧ ¬ 10 * damaged < total)

def agree (total damaged : Nat) : Prop :=
  specTenth total damaged = JapanTaxLaw.DamageRatioTenthInheritGift.hasTenthOrMore total damaged

theorem agree_thm (total damaged : Nat) : agree total damaged := by
  unfold agree specTenth JapanTaxLaw.DamageRatioTenthInheritGift.hasTenthOrMore
  unfold JapanTaxLaw.DamageRatioTenthInheritGift.oneTenth
  simp

end JapanTaxLaw.DamageRatioTenthInheritGiftSpec
