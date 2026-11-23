import JapanTaxLaw.TreatyJPUSLimitationOnBenefits
import JapanTaxLaw.TreatyJPUSLimitationOnBenefitsSpec

/-!
# TreatyJPUSLimitationOnBenefitsTests — 第二十二条（特典制限）
-/
namespace JapanTaxLaw.TreatyJPUSLimitationOnBenefitsTests
open JapanTaxLaw.TreatyJPUSLimitationOnBenefits

theorem category_spec (a b c d e f g : Bool) : isQualifyingCategory a b c d e f g = JapanTaxLaw.TreatyJPUSLimitationOnBenefitsSpec.isQualifyingCategorySpec a b c d e f g := by rfl
theorem eligible_spec (m q s : Bool) : treatyEligible m q s = JapanTaxLaw.TreatyJPUSLimitationOnBenefitsSpec.treatyEligibleSpec m q s := by rfl
example : isQualifyingCategory true false false false false false false = true := individual_qualifies
example : isQualifyingCategory false true false false false false false = true := government_qualifies
example : isQualifyingCategory false false false false false false false = false := no_category_not_qualified
example : treatyEligible true true false = true := eligible_when_all
example : treatyEligible false true false = false := requirements_fail
example : treatyEligible true false false = false := category_fail
example : treatyEligible false false true = true := separate_provision_overrides
example (m q s : Bool) (h : treatyEligible m q s = true) (hs : s = false) : q = true := eligibility_requires_category m q s h hs
example : limitationOnBenefitsDeclared = true := limitation_on_benefits_is_declaration

end JapanTaxLaw.TreatyJPUSLimitationOnBenefitsTests
