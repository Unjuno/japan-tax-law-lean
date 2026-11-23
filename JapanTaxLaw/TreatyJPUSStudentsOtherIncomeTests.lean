import JapanTaxLaw.TreatyJPUSStudentsOtherIncome
import JapanTaxLaw.TreatyJPUSStudentsOtherIncomeSpec

/-!
# TreatyJPUSStudentsOtherIncomeTests — 第十九条・第二十一条
-/
namespace JapanTaxLaw.TreatyJPUSStudentsOtherIncomeTests
open JapanTaxLaw.TreatyJPUSStudentsOtherIncome

theorem grant_spec (a b : Bool) : studentGrantExempt a b = JapanTaxLaw.TreatyJPUSStudentsOtherIncomeSpec.studentGrantExemptSpec a b := by rfl
theorem trainee_spec (y : Nat) : traineeWithinOneYear y = JapanTaxLaw.TreatyJPUSStudentsOtherIncomeSpec.traineeWithinOneYearSpec y := by
  unfold traineeWithinOneYear JapanTaxLaw.TreatyJPUSStudentsOtherIncomeSpec.traineeWithinOneYearSpec
  by_cases h : y <= 1 <;> simp [h]
theorem art7_spec (p l : Bool) : article7ForOtherIncome p l = JapanTaxLaw.TreatyJPUSStudentsOtherIncomeSpec.article7ForOtherIncomeSpec p l := by rfl
example : studentGrantExempt true true = true := student_grant_exempt
example : studentGrantExempt false true = false := domestic_payment_not_exempt
example : studentGrantExempt true false = false := local_resident_not_exempt
example : traineeWithinOneYear 1 = true := one_year_within
example : traineeWithinOneYear 2 = false := two_years_exceeded
example : otherIncomeSourceTax = false := other_income_residence_only
example : article7ForOtherIncome true true = true := pe_link_switches_to_art7
example : article7ForOtherIncome false true = false := no_pe_stays_residence
example : studentsOtherIncomeDeclared = true := students_other_income_is_declaration

end JapanTaxLaw.TreatyJPUSStudentsOtherIncomeTests
