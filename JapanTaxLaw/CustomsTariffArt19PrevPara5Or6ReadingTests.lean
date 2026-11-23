import JapanTaxLaw.CustomsTariffArt19PrevPara5Or6ReadingSpec

/-!
# CustomsTariffArt19PrevPara5Or6ReadingTests — kernel-checked checks for 第十九条(8)

Verifies READING 「前項の規定は、第五項又は第六項の規定を適用する場合について準用する。」: 前項 read in for 第五項 or 第六項 only.
-/

namespace JapanTaxLaw.CustomsTariffArt19PrevPara5Or6Reading

example : sourceParagraphOffset = 1 := source_offset_is_one
example : triggerParaA = 5 ∧ triggerParaB = 6 := trigger_numbers
example : appliesViaReading Trigger.para5 Provision.prevParagraph := applies_for_para5
example : appliesViaReading Trigger.para6 Provision.prevParagraph := applies_for_para6
example : ¬ appliesViaReading Trigger.other Provision.prevParagraph := not_applies_for_other
example (tr : Trigger) (p : Provision) : appliesViaReading tr p ↔ SpecAppliesBool tr = true :=
  agree_applies tr p

end JapanTaxLaw.CustomsTariffArt19PrevPara5Or6Reading
