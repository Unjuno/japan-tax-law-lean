import JapanTaxLaw.DamageRatioTenthInheritMovable

/-! Independent spec for DamageRatioTenthInheritMovable: `total > 0 ∧ ¬ oneTenth * damaged < total`. -/

namespace JapanTaxLaw.DamageRatioTenthInheritMovableSpec

def specTenth (total damaged : Nat) : Bool :=
  decide (total > 0 ∧ ¬ 10 * damaged < total)

def agree (total damaged : Nat) : Prop :=
  specTenth total damaged = JapanTaxLaw.DamageRatioTenthInheritMovable.hasTenthOrMore total damaged

theorem agree_thm (total damaged : Nat) : agree total damaged := by
  unfold agree specTenth JapanTaxLaw.DamageRatioTenthInheritMovable.hasTenthOrMore
  unfold JapanTaxLaw.DamageRatioTenthInheritMovable.oneTenth
  simp

end JapanTaxLaw.DamageRatioTenthInheritMovableSpec
