import JapanTaxLaw.TreatyJPUSDiplomaticAndConsultation
import JapanTaxLaw.TreatyJPUSDiplomaticAndConsultationSpec

/-!
# TreatyJPUSDiplomaticAndConsultationTests — 第二十八条・第二十九条
-/
namespace JapanTaxLaw.TreatyJPUSDiplomaticAndConsultationTests
open JapanTaxLaw.TreatyJPUSDiplomaticAndConsultation

theorem requested_spec (c : Bool) : consultationRequested c = JapanTaxLaw.TreatyJPUSDiplomaticAndConsultationSpec.consultationRequestedSpec c := by rfl
theorem months_spec (m : Nat) : withinThreeMonths m = JapanTaxLaw.TreatyJPUSDiplomaticAndConsultationSpec.withinThreeMonthsSpec m := by
  unfold withinThreeMonths JapanTaxLaw.TreatyJPUSDiplomaticAndConsultationSpec.withinThreeMonthsSpec
  by_cases h : m <= 3 <;> simp [h]
example : diplomaticPrivilegesPreserved = true := treaty_does_not_affect_privileges
example : consultationRequested true = true := change_enables_request
example : consultationRequested false = false := no_change_no_request
example : withinThreeMonths 3 = true := three_months_ok
example : withinThreeMonths 4 = false := four_months_late
example : diplomaticAndConsultationDeclared = true := diplomatic_and_consultation_is_declaration

end JapanTaxLaw.TreatyJPUSDiplomaticAndConsultationTests
