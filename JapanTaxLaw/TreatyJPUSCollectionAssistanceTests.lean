import JapanTaxLaw.TreatyJPUSCollectionAssistance
import JapanTaxLaw.TreatyJPUSCollectionAssistanceSpec

/-!
# TreatyJPUSCollectionAssistanceTests — 第二十七条（徴収の援助）
-/
namespace JapanTaxLaw.TreatyJPUSCollectionAssistanceTests
open JapanTaxLaw.TreatyJPUSCollectionAssistance

theorem may_spec (p : Bool) : mayAssist p = JapanTaxLaw.TreatyJPUSCollectionAssistanceSpec.mayAssistSpec p := by rfl
theorem eligible_spec (e p : Bool) : assistanceEligible e p = JapanTaxLaw.TreatyJPUSCollectionAssistanceSpec.assistanceEligibleSpec e p := by rfl
example : mayAssist true = true := law_permitted_assist
example : mayAssist false = false := law_forbids_no_assist
example : notLimitedByScope = true := assistance_unbounded_by_scope
example : assistanceEligible true true = true := eligible_and_permitted
example : assistanceEligible false true = false := ineligible_no_assist
example : assistanceEligible true false = false := law_barred_no_assist
example (e p : Bool) (h : assistanceEligible e p = true) : e = true ∧ p = true := assist_requires_both e p h
example : collectionAssistanceDeclared = true := collection_assistance_is_declaration

end JapanTaxLaw.TreatyJPUSCollectionAssistanceTests
