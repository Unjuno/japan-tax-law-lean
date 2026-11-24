import JapanTaxLaw.DisasterTaxReliefOrderArt10Item5FieldConditionSpec

/-!
# DisasterTaxReliefOrderArt10Item5FieldConditionTests — kernel-checked checks

Verifies CONDITION 「徴収猶予限度額又は徴収猶予期間及びこれらの計算の基礎」: (amount OR period) AND calculation basis.
-/

namespace JapanTaxLaw.DisasterTaxReliefOrderArt10Item5FieldCondition

example : satisfiesItem5 amountAndBasis = true := amount_path_satisfies
example : satisfiesItem5 periodAndBasis = true := period_path_satisfies
example : satisfiesItem5 amountOnly = false := missing_basis_fails
example : satisfiesItem5 basisOnly = false := missing_alternative_fails
example : SpecItem5 amountAndBasis := spec_amount_and_basis
example : SpecItem5 periodAndBasis := spec_period_and_basis
example : ¬ SpecItem5 amountOnly := spec_amount_only_fails
example : (satisfiesItem5 amountAndBasis = true) ↔ SpecItem5 amountAndBasis := agree_amount

end JapanTaxLaw.DisasterTaxReliefOrderArt10Item5FieldCondition
