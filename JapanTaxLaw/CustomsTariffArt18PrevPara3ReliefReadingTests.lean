import JapanTaxLaw.CustomsTariffArt18PrevPara3ReliefReadingSpec

/-!
# CustomsTariffArt18PrevPara3ReliefReadingTests — kernel-checked checks for 第十八条(4)

Verifies the READING 「前条第三項の規定は、第一項の規定により関税の軽減を受けた者について準用する。」: 前条第三項 read in for a relief recipient only.
-/

namespace JapanTaxLaw.CustomsTariffArt18PrevPara3ReliefReading

example : sourceParagraph = 3 := source_paragraph_is_three
example : sourceArticleOffset = 1 := source_article_offset_is_one
example : triggerParagraph = 1 := trigger_paragraph_is_one
example : appliesViaReading PersonClass.reliefRecipient Provision.prevArticlePara3 :=
  applies_to_relief_recipient
example : ¬ appliesViaReading PersonClass.other Provision.prevArticlePara3 := not_applies_to_other
example (p : PersonClass) (prov : Provision) : appliesViaReading p prov ↔ SpecApplies p prov :=
  agree_applies_via_reading p prov

end JapanTaxLaw.CustomsTariffArt18PrevPara3ReliefReading
