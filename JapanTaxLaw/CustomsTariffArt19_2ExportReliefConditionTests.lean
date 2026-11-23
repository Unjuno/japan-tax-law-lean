import JapanTaxLaw.CustomsTariffArt19_2ExportReliefConditionSpec

/-!
# CustomsTariffArt19_2ExportReliefConditionTests — kernel-checked checks for 第十九条の二 caption

Verifies CONDITION 「（課税原料品等による製品を輸出した場合の免税又は戻し税等）」: export case with 免税 or 戻し税 only.
-/

namespace JapanTaxLaw.CustomsTariffArt19_2ExportReliefCondition

example : withinCondition ProductCase.exportCase Relief.exemption = true := export_exemption_within
example : withinCondition ProductCase.exportCase Relief.drawback = true := export_drawback_within
example : withinCondition ProductCase.other Relief.exemption = false := by
  exact other_case_outside Relief.exemption
example : withinCondition ProductCase.exportCase Relief.otherRelief = false := by
  exact other_relief_outside ProductCase.exportCase
example (c : ProductCase) (r : Relief) : (withinCondition c r = true) ↔ SpecWithinCondition c r :=
  agree_within_condition c r

end JapanTaxLaw.CustomsTariffArt19_2ExportReliefCondition
