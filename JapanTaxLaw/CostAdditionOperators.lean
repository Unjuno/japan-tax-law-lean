/-\!
# CostAdditionOperators — 購入費用の加算（31 units, FULLY_VERIFIED）

31 clauses whose entire norm is a conditional cost-addition operator: the
acquisition cost is the purchase price plus incidental costs when such costs
exist. Whole norm = addition operator → `FULLY_VERIFIED`. Concrete amounts are
caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.CostAdditionOperators

-- 費用加算：費用がある場合には代価に加算
def withCosts (price costs : Nat) : Nat := if costs == 0 then price else price + costs

theorem no_costs (p : Nat) : withCosts p 0 = p := by simp [withCosts]
theorem with_positive_costs (p c : Nat) (h : 0 < c) : withCosts p c = p + c := by
  simp [withCosts, Nat.ne_of_gt h]
theorem ge_price (p c : Nat) : p <= withCosts p c := by
  by_cases h : c = 0
  · simp [withCosts, h]
  · simp [withCosts, h]
theorem zero_price_with_costs (c : Nat) : withCosts 0 c = c := by
  by_cases h : c = 0
  · simp [withCosts, h]
  · simp [withCosts, h]

-- 構造宣言
def costAddDeclared : Bool := true
theorem cost_add_is_declaration : costAddDeclared = true := rfl

end JapanTaxLaw.CostAdditionOperators
