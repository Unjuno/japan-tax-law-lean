import JapanTaxLaw.GiftTaxLiability
import JapanTaxLaw.GiftTaxLiabilitySpec

/-!
# GiftTaxLiabilityTests — 相続税法 第一条の四（実質的証明）
-/
namespace JapanTaxLaw.GiftTaxLiabilityTests
open JapanTaxLaw.GiftTaxLiability

theorem obligation_spec (a b c d : Bool) : hasGiftTaxObligation a b c d = JapanTaxLaw.GiftTaxLiabilitySpec.hasGiftTaxObligationSpec a b c d := by rfl
theorem item2i1_spec (j d h : Bool) : item2i1 j d h = JapanTaxLaw.GiftTaxLiabilitySpec.item2i1Spec j d h := by rfl
theorem item2i_spec (j d h f : Bool) : item2i j d h f = JapanTaxLaw.GiftTaxLiabilitySpec.item2iSpec j d h f := by rfl
example : hasGiftTaxObligation true false false false = true := item1_obliges
example : hasGiftTaxObligation false false false true = true := item4_obliges
example : hasGiftTaxObligation false false false false = false := no_item_no_obligation
example : item2i1 true false true = true := item2i1_holds
example : item2i1 true true true = false := item2i1_needs_no_current_domicile
example : item2i1 false false true = false := item2i1_needs_japanese
example : item2i1 true false false = false := item2i1_needs_10y_domicile
example (j d h f : Bool) (h1 : item2i1 j d h = true) : item2i j d h f = true := item2i1_implies_item2i j d h f h1
example : giftTaxLiabilityDeclared = true := gift_tax_liability_is_declaration

end JapanTaxLaw.GiftTaxLiabilityTests
