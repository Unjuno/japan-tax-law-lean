import JapanTaxLaw.TreatyJPUSMutualAgreement
import JapanTaxLaw.TreatyJPUSMutualAgreementSpec

/-!
# TreatyJPUSMutualAgreementTests — 第二十五条（相互協定手続）
-/
namespace JapanTaxLaw.TreatyJPUSMutualAgreementTests
open JapanTaxLaw.TreatyJPUSMutualAgreement

theorem within_spec (y : Nat) : withinThreeYears y = JapanTaxLaw.TreatyJPUSMutualAgreementSpec.withinThreeYearsSpec y := by
  unfold withinThreeYears JapanTaxLaw.TreatyJPUSMutualAgreementSpec.withinThreeYearsSpec
  by_cases h : y <= 3 <;> simp [h]
theorem implemented_spec (a tb : Bool) : agreementImplemented a tb = JapanTaxLaw.TreatyJPUSMutualAgreementSpec.agreementImplementedSpec a tb := by rfl
example : withinThreeYears 3 = true := three_years_within
example : withinThreeYears 4 = false := four_years_late
example : agreementImplemented true true = true := agreement_overrides_timebar
example : agreementImplemented false false = false := no_agreement_no_implementation
example (a tb : Bool) (h : agreementImplemented a tb = true) : a = true := implementation_requires_agreement a tb h
example : mutualAgreementDeclared = true := mutual_agreement_is_declaration

end JapanTaxLaw.TreatyJPUSMutualAgreementTests
