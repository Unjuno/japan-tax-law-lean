import JapanTaxLaw.TreatyJPUSEntryTermination
import JapanTaxLaw.TreatyJPUSEntryTerminationSpec

/-!
# TreatyJPUSEntryTerminationTests — 第三十条・第三十一条
-/
namespace JapanTaxLaw.TreatyJPUSEntryTerminationTests
open JapanTaxLaw.TreatyJPUSEntryTermination

theorem month_spec (e : Bool) : withholdingStartMonth e = JapanTaxLaw.TreatyJPUSEntryTerminationSpec.withholdingStartMonthSpec e := by rfl
theorem term_spec (y : Nat) : terminationAllowed y = JapanTaxLaw.TreatyJPUSEntryTerminationSpec.terminationAllowedSpec y := by
  unfold terminationAllowed JapanTaxLaw.TreatyJPUSEntryTerminationSpec.terminationAllowedSpec
  by_cases h : 5 <= y <;> simp [h]
theorem notice_spec (m : Nat) : validNotice m = JapanTaxLaw.TreatyJPUSEntryTerminationSpec.validNoticeSpec m := by
  unfold validNotice JapanTaxLaw.TreatyJPUSEntryTerminationSpec.validNoticeSpec
  by_cases h : 6 <= m <;> simp [h]
theorem can_spec (y n : Bool) : canTerminate y n = JapanTaxLaw.TreatyJPUSEntryTerminationSpec.canTerminateSpec y n := by rfl
example : withholdingStartMonth true = 7 := early_effect_july
example : withholdingStartMonth false = 1 := late_effect_january
example : terminationAllowed 5 = true := at_5_years_allowed
example : terminationAllowed 4 = false := before_5_years_barred
example : validNotice 6 = true := six_month_notice_ok
example : validNotice 5 = false := short_notice_invalid
example : canTerminate true true = true := terminate_both_ok
example : canTerminate false true = false := terminate_missing_years
example : entryTerminationDeclared = true := entry_termination_is_declaration

end JapanTaxLaw.TreatyJPUSEntryTerminationTests
