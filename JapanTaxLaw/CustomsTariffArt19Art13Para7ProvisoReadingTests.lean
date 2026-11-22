import JapanTaxLaw.CustomsTariffArt19Art13Para7ProvisoReadingSpec

/-!
# CustomsTariffArt19Art13Para7ProvisoReadingTests — kernel-checked checks for 第十九条(4)

Verifies the READING 「この場合においては、第十三条第七項但書の規定を準用する。」: 第十三条第七項但書 read in for この場合 only.
-/

namespace JapanTaxLaw.CustomsTariffArt19Art13Para7ProvisoReading

example : sourceArticle = 13 := source_article_is_13
example : sourceParagraph = 7 := source_paragraph_is_7
example : sourceIsProviso = true := source_is_proviso
example : appliesViaReading TriggerCase.thisCase Provision.art13Para7Proviso := applies_in_this_case
example : ¬ appliesViaReading TriggerCase.other Provision.art13Para7Proviso := not_applies_in_other
example (c : TriggerCase) (p : Provision) : appliesViaReading c p ↔ SpecApplies c p :=
  agree_applies_via_reading c p

end JapanTaxLaw.CustomsTariffArt19Art13Para7ProvisoReading
