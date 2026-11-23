import JapanTaxLaw.LocalSecondaryTaxLiability
import JapanTaxLaw.LocalSecondaryTaxLiabilitySpec

/-!
# LocalSecondaryTaxLiabilityTests — 地方税法 第十一条の六（実質的証明）
-/
namespace JapanTaxLaw.LocalSecondaryTaxLiabilityTests
open JapanTaxLaw.LocalSecondaryTaxLiability

theorem liability_spec (p i d s c1 c2 : Bool) : secondaryLiability p i d s c1 c2 = JapanTaxLaw.LocalSecondaryTaxLiabilitySpec.secondaryLiabilitySpec p i d s c1 c2 := by rfl
example : secondaryLiability true true true true true false = true := all_conditions_cat1
example : secondaryLiability true true true true false true = true := all_conditions_cat2
example : secondaryLiability false true true true true false = false := missing_property_no_liability
example : secondaryLiability true true true false true false = false := no_shortfall_no_liability
example : secondaryLiability true true true true false false = false := no_category_no_liability
example : secondaryLiability true true true true true false = true := cat1_suffices_true
example : secondaryLiability false true true true true false = false := cat1_suffices_false
example : secondaryLiability true true true true false true = true := cat2_suffices_true
example : secondaryLiability true true true true false false = false := cat2_suffices_false
example : localSecondaryTaxLiabilityDeclared = true := local_secondary_tax_liability_is_declaration

end JapanTaxLaw.LocalSecondaryTaxLiabilityTests
