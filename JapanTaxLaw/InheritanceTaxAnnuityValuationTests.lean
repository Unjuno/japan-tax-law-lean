import JapanTaxLaw.InheritanceTaxAnnuityValuation
import JapanTaxLaw.InheritanceTaxAnnuityValuationSpec

/-!
# InheritanceTaxAnnuityValuationTests — 相続税法 第二十五条（実質的証明）
-/
namespace JapanTaxLaw.InheritanceTaxAnnuityValuationTests
open JapanTaxLaw.InheritanceTaxAnnuityValuation

theorem rate90_spec (b : Nat) : rate90Base b = JapanTaxLaw.InheritanceTaxAnnuityValuationSpec.rate90BaseSpec b := by rfl
theorem case1_spec (l : Bool) (a p : Nat) : case1Base l a p = JapanTaxLaw.InheritanceTaxAnnuityValuationSpec.case1BaseSpec l a p := by rfl
theorem value_spec (n l : Bool) (a p s : Nat) :
    contractValue n l a p s = JapanTaxLaw.InheritanceTaxAnnuityValuationSpec.contractValueSpec n l a p s := by
  unfold contractValue JapanTaxLaw.InheritanceTaxAnnuityValuationSpec.contractValueSpec
  by_cases hn : n <;> simp [hn, case1Base, JapanTaxLaw.InheritanceTaxAnnuityValuationSpec.case1BaseSpec, rate90Base, JapanTaxLaw.InheritanceTaxAnnuityValuationSpec.rate90BaseSpec]
example (b : Nat) : rate90Base b <= b := ninety_percent_le_base b
example : rate90Base 0 = 0 := ninety_zero
example : case1Base true 10 20 = 10 := lump_sum_selects_1
example : case1Base false 10 20 = 20 := periodic_selects_2
example (a p s : Nat) : contractValue true true a p s = rate90Base a := no_surrender_lump_sum a p s
example (a p s : Nat) : contractValue true false a p s = rate90Base p := no_surrender_periodic a p s
example (l : Bool) (a p s : Nat) : contractValue false l a p s = s := with_surrender l a p s
example : inheritanceTaxAnnuityDeclared = true := inheritance_tax_annuity_is_declaration

end JapanTaxLaw.InheritanceTaxAnnuityValuationTests
