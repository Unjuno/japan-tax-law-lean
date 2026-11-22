import JapanTaxLaw.CostAdditionOperators
import JapanTaxLaw.CostAdditionOperatorsSpec

/-!
# CostAdditionOperatorsTests — 購入費用の加算
-/
namespace JapanTaxLaw.CostAdditionOperatorsTests

open JapanTaxLaw.CostAdditionOperators

theorem spec_agreement (p c : Nat) :
    withCosts p c = JapanTaxLaw.CostAdditionOperatorsSpec.addCostsSpec p c := by
  unfold withCosts JapanTaxLaw.CostAdditionOperatorsSpec.addCostsSpec
  by_cases h : c = 0
  · simp [h]
  · simp [h]

example (p : Nat) : withCosts p 0 = p := no_costs p
example (p c : Nat) (h : 0 < c) : withCosts p c = p + c := with_positive_costs p c h
example (p c : Nat) : p <= withCosts p c := ge_price p c
example (c : Nat) : withCosts 0 c = c := zero_price_with_costs c
example : costAddDeclared = true := cost_add_is_declaration

end JapanTaxLaw.CostAdditionOperatorsTests
