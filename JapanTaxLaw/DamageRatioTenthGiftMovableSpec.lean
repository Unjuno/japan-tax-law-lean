import JapanTaxLaw.DamageRatioTenthGiftMovable

/-! Independent spec for DamageRatioTenthGiftMovable: `total > 0 ∧ ¬ oneTenth * damaged < total`. -/

namespace JapanTaxLaw.DamageRatioTenthGiftMovableSpec

def specTenth (total damaged : Nat) : Bool :=
  decide (total > 0 ∧ ¬ 10 * damaged < total)

def agree (total damaged : Nat) : Prop :=
  specTenth total damaged = JapanTaxLaw.DamageRatioTenthGiftMovable.hasTenthOrMore total damaged

theorem agree_thm (total damaged : Nat) : agree total damaged := by
  unfold agree specTenth JapanTaxLaw.DamageRatioTenthGiftMovable.hasTenthOrMore
  unfold JapanTaxLaw.DamageRatioTenthGiftMovable.oneTenth
  simp

end JapanTaxLaw.DamageRatioTenthGiftMovableSpec
