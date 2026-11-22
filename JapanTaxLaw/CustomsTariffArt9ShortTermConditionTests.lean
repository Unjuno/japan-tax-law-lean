import JapanTaxLaw.CustomsTariffArt9ShortTermConditionSpec

/-!
# CustomsTariffArt9ShortTermConditionTests — kernel-checked boundary checks for 第九条(13)

Verifies the CONDITION 「過去五年以内に当該短期の措置に係る貨物について緊急措置が三回以上とられていない場合」:
look-back window 5 years, threshold 3 measures, boundary at 3.
-/

namespace JapanTaxLaw.CustomsTariffArt9ShortTermCondition

example : lookbackYears = 5 := rfl
example : thresholdCount = 3 := rfl

-- Exhaustive check of the finite boundary band (NOT a universal claim).
example : conditionMet 0 = true := by decide
example : conditionMet 1 = true := by decide
example : conditionMet 2 = true := by decide
example : conditionMet 3 = false := by decide
example : conditionMet 4 = false := by decide
example : conditionMet 5 = false := by decide

-- Boundary theorems.
example : conditionMet (thresholdCount - 1) = true := below_threshold_meets
example : conditionMet thresholdCount = false := at_threshold_fails
example : conditionMet (thresholdCount + 1) = false := above_threshold_fails

-- Universal agreement with the independent spec (axiom-free).
example (n : Nat) : (conditionMet n = true) ↔ SpecConditionMet n := agree_condition n

end JapanTaxLaw.CustomsTariffArt9ShortTermCondition
