import JapanTaxLaw.CustomsTariffArt20ContrabandDisposalConditionSpec

/-!
# CustomsTariffArt20ContrabandDisposalConditionTests — kernel-checked checks for 第二十条 caption

Verifies CONDITION 「（違約品等の再輸出又は廃棄の場合の戻し税等）」: the disjunctive case (再輸出 or 廃棄) only.
-/

namespace JapanTaxLaw.CustomsTariffArt20ContrabandDisposalCondition

example : withinCondition GoodsCase.reexport = true := reexport_within
example : withinCondition GoodsCase.disposal = true := disposal_within
example : withinCondition GoodsCase.other = false := other_outside
example (c : GoodsCase) : (withinCondition c = true) ↔ SpecWithinCondition c :=
  agree_within_condition c

end JapanTaxLaw.CustomsTariffArt20ContrabandDisposalCondition
