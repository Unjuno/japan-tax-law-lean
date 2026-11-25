import JapanTaxLaw.CustomsTariffArt9AdditionalDutyCapSpec

/-!
# CustomsTariffArt9AdditionalDutyCapTests — kernel-checked checks

Verifies CONDITION 「当該貨物につき、別表の税率による関税のほか、当該輸入される貨物の課税価格と同額以下の関税を課すること。」: cap boundary, rejection, zero, additive split.
-/

namespace JapanTaxLaw.CustomsTariffArt9AdditionalDutyCap

example : withinCap 7 7 := cap_equal_allowed 7
example : ¬ withinCap 7 3 := cap_exceeded_rejected 7 3 (by decide)
example : withinCap 0 9 := zero_duty_allowed 9
example : 4 <= totalDuty 4 5 := total_at_least_table 4 5
example : 5 <= totalDuty 4 5 := total_at_least_additional 4 5
example : withinCap 5 7 ↔ SpecWithinCap 5 7 := cap_spec_agreement 5 7
example : SpecTotal 4 5 (totalDuty 4 5) := total_spec_agreement 4 5

end JapanTaxLaw.CustomsTariffArt9AdditionalDutyCap
