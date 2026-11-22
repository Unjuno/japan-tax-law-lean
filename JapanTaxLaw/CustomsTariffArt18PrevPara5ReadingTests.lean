import JapanTaxLaw.CustomsTariffArt18PrevPara5ReadingSpec

/-!
# CustomsTariffArt18PrevPara5ReadingTests — kernel-checked checks for 第十八条(3)

Verifies the READING 「この場合においては、前条第五項の規定を準用する。」: 前条第五項 read in for この場合 only.
-/

namespace JapanTaxLaw.CustomsTariffArt18PrevPara5Reading

example : sourceParagraph = 5 := source_paragraph_is_five
example : sourceArticleOffset = 1 := source_article_offset_is_one
example : appliesViaReading Case.thisCase Provision.prevArticlePara5 := rfl
example : ¬ appliesViaReading Case.other Provision.prevArticlePara5 := not_applies_in_other
example (c : Case) (p : Provision) : appliesViaReading c p ↔ SpecApplies c p :=
  agree_applies_via_reading c p

end JapanTaxLaw.CustomsTariffArt18PrevPara5Reading
