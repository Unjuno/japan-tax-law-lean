import JapanTaxLaw.CustomsTariffArt12MiningEmergencyConditionSpec

/-!
# CustomsTariffArt12MiningEmergencyConditionTests — kernel-checked checks for 第十二条(1)

Verifies the CONDITION 「凶作の場合又は天災、事変その他の緊急の場合において必要があるとき。」: enumerated case applies, ordinary does not.
-/

namespace JapanTaxLaw.CustomsTariffArt12MiningEmergencyCondition

example : appliesTo Case.enumerated = true := enumerated_applies
example : appliesTo Case.ordinary = false := ordinary_not_applies
example : Case.enumerated ≠ Case.ordinary := cases_distinct
example (c : Case) : (appliesTo c = true) ↔ SpecEnumerated c := agree_applies c

end JapanTaxLaw.CustomsTariffArt12MiningEmergencyCondition
