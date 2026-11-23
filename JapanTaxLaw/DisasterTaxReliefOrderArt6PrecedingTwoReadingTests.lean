import JapanTaxLaw.DisasterTaxReliefOrderArt6PrecedingTwoReadingSpec

/-!
# DisasterTaxReliefOrderArt6PrecedingTwoReadingTests — kernel-checked checks

Verifies READING 「前二条の規定は、第三条の二第四項の場合について、これを準用する。」: Articles 4/5 for the target case only.
-/

namespace JapanTaxLaw.DisasterTaxReliefOrderArt6PrecedingTwoReading

example : sourceArticleLo = 4 ∧ sourceArticleHi = 5 := source_range
example : appliesViaReading TriggerCase.targetCase := applies_in_target
example : ¬ appliesViaReading TriggerCase.other := not_applies_in_other
example : SpecReading TriggerCase.targetCase sourceArticleLo sourceArticleHi :=
  implementation_satisfies_spec

end JapanTaxLaw.DisasterTaxReliefOrderArt6PrecedingTwoReading
