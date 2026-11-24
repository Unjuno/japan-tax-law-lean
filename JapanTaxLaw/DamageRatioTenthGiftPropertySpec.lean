import JapanTaxLaw.DamageRatioTenthGiftProperty

/-! Independent spec for DamageRatioTenthGiftProperty: `total > 0 ∧ ¬ oneTenth * damaged < total`. -/

namespace JapanTaxLaw.DamageRatioTenthGiftPropertySpec

def specTenth (total damaged : Nat) : Bool :=
  decide (total > 0 ∧ ¬ 10 * damaged < total)

def agree (total damaged : Nat) : Prop :=
  specTenth total damaged = JapanTaxLaw.DamageRatioTenthGiftProperty.hasTenthOrMore total damaged

theorem agree_thm (total damaged : Nat) : agree total damaged := by
  unfold agree specTenth JapanTaxLaw.DamageRatioTenthGiftProperty.hasTenthOrMore
  unfold JapanTaxLaw.DamageRatioTenthGiftProperty.oneTenth
  simp

end JapanTaxLaw.DamageRatioTenthGiftPropertySpec
