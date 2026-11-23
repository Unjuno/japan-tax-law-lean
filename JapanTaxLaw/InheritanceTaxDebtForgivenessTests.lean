import JapanTaxLaw.InheritanceTaxDebtForgiveness
import JapanTaxLaw.InheritanceTaxDebtForgivenessSpec

/-!
# InheritanceTaxDebtForgivenessTests — 相続税法 第八条（実質的証明）
-/
namespace JapanTaxLaw.InheritanceTaxDebtForgivenessTests
open JapanTaxLaw.InheritanceTaxDebtForgiveness

theorem gift_amount_spec (d c : Nat) : deemedGiftAmount d c = JapanTaxLaw.InheritanceTaxDebtForgivenessSpec.deemedGiftAmountSpec d c := by rfl
theorem proviso_spec (i e1 e2 : Bool) : provisoApplies i e1 e2 = JapanTaxLaw.InheritanceTaxDebtForgivenessSpec.provisoAppliesSpec i e1 e2 := by rfl
theorem effective_spec (d c : Nat) (p : Bool) :
    effectiveDeemedGift d c p = JapanTaxLaw.InheritanceTaxDebtForgivenessSpec.effectiveDeemedGiftSpec d c p := by
  unfold effectiveDeemedGift JapanTaxLaw.InheritanceTaxDebtForgivenessSpec.effectiveDeemedGiftSpec
  by_cases h : p <;> simp [h, deemedGiftAmount, JapanTaxLaw.InheritanceTaxDebtForgivenessSpec.deemedGiftAmountSpec]

example (d : Nat) : deemedGiftAmount d 0 = d := gift_without_consideration d
example (d c : Nat) (h : c <= d) : deemedGiftAmount d c + c = d := gift_with_consideration d c h
example (d c : Nat) (h : d <= c) : deemedGiftAmount d c = 0 := gift_zero_when_consideration_ge d c h
example (i : Bool) : provisoApplies i true false = i := proviso_item1 i
example (i : Bool) : provisoApplies i false true = i := proviso_item2 i
example (e1 e2 : Bool) : provisoApplies false e1 e2 = false := proviso_needs_insolvency e1 e2
example (i : Bool) : provisoApplies i false false = false := proviso_no_item_no_apply i
example (d c : Nat) : effectiveDeemedGift d c true = 0 := exception_zeroes_deemed_gift d c
example (d c : Nat) : effectiveDeemedGift d c false = deemedGiftAmount d c := no_exception_keeps_deemed_gift d c
example (d c : Nat) (p : Bool) : effectiveDeemedGift d c p <= deemedGiftAmount d c := effective_le_deemed d c p
example : inheritanceTaxDebtForgivenessDeclared = true := inheritance_tax_debt_forgiveness_is_declaration

end JapanTaxLaw.InheritanceTaxDebtForgivenessTests
