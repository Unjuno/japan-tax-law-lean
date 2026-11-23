import JapanTaxLaw.CustomsTariffArt19_3ReexportSameStateConditionSpec

/-!
# CustomsTariffArt19_3ReexportSameStateConditionTests — kernel-checked checks for 第十九条の三 caption

Verifies CONDITION 「（輸入時と同一状態で再輸出される場合の戻し税等）」: re-export case with 戻し税 only.
-/

namespace JapanTaxLaw.CustomsTariffArt19_3ReexportSameStateCondition

example : withinCondition ExportCase.reexportSameState Relief.drawback = true := reexport_drawback_within
example : withinCondition ExportCase.other Relief.drawback = false := other_case_outside Relief.drawback
example : withinCondition ExportCase.reexportSameState Relief.otherRelief = false :=
  other_relief_outside ExportCase.reexportSameState
example (c : ExportCase) (r : Relief) : (withinCondition c r = true) ↔ SpecWithinCondition c r :=
  agree_within_condition c r

end JapanTaxLaw.CustomsTariffArt19_3ReexportSameStateCondition
