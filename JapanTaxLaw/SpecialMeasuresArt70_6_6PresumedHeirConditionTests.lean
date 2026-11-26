import JapanTaxLaw.SpecialMeasuresArt70_6_6PresumedHeirConditionSpec

/-!
# SpecialMeasuresArt70_6_6PresumedHeirConditionTests — kernel-checked checks

Verifies PRESUMPTION 「当該個人が、当該相続の開始の直前において、当該被相続人の推定相続人であること。」: presumed heir qualifies, non-heir not.
-/

namespace JapanTaxLaw.SpecialMeasuresArt70_6_6PresumedHeirCondition

example : qualifies true := presumed_heir_qualifies
example : ¬ qualifies false := non_heir_rejected
example : qualifies true ↔ SpecQualifies true := qualifies_spec_agreement true
example : qualifies false ↔ SpecQualifies false := qualifies_spec_agreement false

end JapanTaxLaw.SpecialMeasuresArt70_6_6PresumedHeirCondition
