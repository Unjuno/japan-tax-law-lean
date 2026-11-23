import JapanTaxLaw.DisasterTaxReliefArt3ArticleRangeReadingSpec

/-!
# DisasterTaxReliefArt3ArticleRangeReadingTests — kernel-checked checks

Verifies READING 「この場合においては、同法第百十二条から第百十四条までの規定を準用する。」: Articles 112..114 for この場合 only.
-/

namespace JapanTaxLaw.DisasterTaxReliefArt3ArticleRangeReading

example : sourceArticleLo = 112 ∧ sourceArticleHi = 114 := source_range
example : appliesViaReading TriggerCase.thisCase := applies_in_this_case
example : ¬ appliesViaReading TriggerCase.other := not_applies_in_other
example : SpecReading TriggerCase.thisCase sourceArticleLo sourceArticleHi :=
  implementation_satisfies_spec

end JapanTaxLaw.DisasterTaxReliefArt3ArticleRangeReading
