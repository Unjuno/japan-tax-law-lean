import JapanTaxLaw.AmountSettingNorms
import JapanTaxLaw.AmountSettingNormsSpec

/-!
# AmountSettingNormsTests — 額設定
-/
namespace JapanTaxLaw.AmountSettingNormsTests
open JapanTaxLaw.AmountSettingNorms

theorem add_spec (b a : Amount) : setWithAddition b a = JapanTaxLaw.AmountSettingNormsSpec.setWithAdditionSpec b a := by rfl
theorem ded_spec (b d : Amount) : setWithDeduction b d = JapanTaxLaw.AmountSettingNormsSpec.setWithDeductionSpec b d := by rfl
theorem comp_spec (a : Amount) : setComputed a = JapanTaxLaw.AmountSettingNormsSpec.setComputedSpec a := by rfl
theorem atd_spec (b a d : Amount) : addThenDeduct b a d = JapanTaxLaw.AmountSettingNormsSpec.addThenDeductSpec b a d := by rfl
example (b a : Amount) : setWithAddition b a = b + a := addition_is_sum b a
example (b a : Amount) (h : 0 < a) : b < setWithAddition b a := addition_exceeds_base b a h
example (b d : Amount) : setWithDeduction b d <= b := deduction_not_exceeds_base b d
example (b : Amount) : setWithDeduction b b = 0 := full_deduction_is_zero b
example (a : Amount) : setComputed a = a := computed_is_identity a
example (b a d : Amount) : addThenDeduct b a d = b + a - d := add_then_deduct_formula b a d
example (b a d : Amount) (h : d <= a) : (b + a) - d = b + (a - d) := add_sub_cancel_when_valid b a d h
example : amountSettingDeclared = true := amount_setting_is_declaration

end JapanTaxLaw.AmountSettingNormsTests
