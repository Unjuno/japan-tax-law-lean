import JapanTaxLaw.LimitRate12Condition
import JapanTaxLaw.LimitRate12ConditionSpec

/-!
# LimitRate12ConditionTests — kernel-decided boundary examples
-/
namespace JapanTaxLaw.LimitRate12ConditionTests

open JapanTaxLaw.LimitRate12Condition
open JapanTaxLaw.LimitRate12ConditionSpec

theorem agrees_with_implementation (r : Nat) :
    isTwelvePercent r = true ↔ rateIsTwelve r := by
  simp [isTwelvePercent, rateIsTwelve, statutoryRatePercent]

example : isTwelvePercent 0 = false := by decide
example : isTwelvePercent 11 = false := by decide
example : isTwelvePercent 12 = true := by decide
example : isTwelvePercent 13 = false := by decide
example : rateIsTwelve 12 := by unfold rateIsTwelve; decide
example : ¬ rateIsTwelve 11 := by unfold rateIsTwelve; decide

end JapanTaxLaw.LimitRate12ConditionTests
