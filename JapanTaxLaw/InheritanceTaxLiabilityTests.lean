import JapanTaxLaw.InheritanceTaxLiability
import JapanTaxLaw.InheritanceTaxLiabilitySpec

/-!
# InheritanceTaxLiabilityTests — 相続税法 第一条の三（実質的証明）
-/
namespace JapanTaxLaw.InheritanceTaxLiabilityTests
open JapanTaxLaw.InheritanceTaxLiability

theorem obligation_spec (a b c d e : Bool) : hasTaxObligation a b c d e = JapanTaxLaw.InheritanceTaxLiabilitySpec.hasTaxObligationSpec a b c d e := by rfl
theorem item2i1_spec (j d h : Bool) : item2i1 j d h = JapanTaxLaw.InheritanceTaxLiabilitySpec.item2i1Spec j d h := by rfl
theorem item2i_spec (j d h f : Bool) : item2i j d h f = JapanTaxLaw.InheritanceTaxLiabilitySpec.item2iSpec j d h f := by rfl
example : hasTaxObligation true false false false false = true := item1_obliges
example : hasTaxObligation false false false false true = true := item5_obliges
example : hasTaxObligation false false false false false = false := no_item_no_obligation
example (a c d e : Bool) : hasTaxObligation a true c d e = true := item2_suffices a c d e
example : item2i1 true false true = true := item2i1_holds
example : item2i1 true true true = false := item2i1_needs_no_current_domicile
example : item2i1 false false true = false := item2i1_needs_japanese
example : item2i1 true false false = false := item2i1_needs_10y_domicile
example (j d h f : Bool) (h1 : item2i1 j d h = true) : item2i j d h f = true := item2i1_implies_item2i j d h f h1
example : inheritanceTaxLiabilityDeclared = true := inheritance_tax_liability_is_declaration

end JapanTaxLaw.InheritanceTaxLiabilityTests
