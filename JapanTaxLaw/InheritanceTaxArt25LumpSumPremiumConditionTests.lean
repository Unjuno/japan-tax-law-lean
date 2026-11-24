import JapanTaxLaw.InheritanceTaxArt25LumpSumPremiumConditionSpec

/-!
# InheritanceTaxArt25LumpSumPremiumConditionTests — kernel-checked checks

Verifies CONDITION 「当該契約に係る掛金又は保険料が一時に払い込まれた場合」: lump-sum timing selects the branch; other does not.
-/

namespace JapanTaxLaw.InheritanceTaxArt25LumpSumPremiumCondition

example : isLumpSum PaymentTiming.lumpSum = true := lump_sum_selected
example : isLumpSum PaymentTiming.other = false := other_not_selected
example : SpecLumpSum PaymentTiming.lumpSum := implementation_satisfies_spec
example : ¬ SpecLumpSum PaymentTiming.other := other_not_satisfying

end JapanTaxLaw.InheritanceTaxArt25LumpSumPremiumCondition
