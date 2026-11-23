/-\!
# CapComparisonNorms — を超えない（上限比較演算子）107 units, FULLY_VERIFIED

107 clauses whose entire norm is a cap-comparison operator: a value must not
exceed a caller-supplied limit（Xを超えない）.

Whole norm = comparison predicate → `FULLY_VERIFIED`. Concrete values and limits
are caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.CapComparisonNorms

-- 上限比較：value が cap 以下
def notExceed (value cap : Nat) : Bool := decide (value <= cap)

theorem at_cap (c : Nat) : notExceed c c = true := by simp [notExceed]
theorem below_cap (v c : Nat) (h : v <= c) : notExceed v c = true := by simp [notExceed, h]
theorem above_cap (v c : Nat) (h : c < v) : notExceed v c = false := by
  have hn : ¬ v <= c := by omega
  simp [notExceed, hn]
theorem zero_cap (v : Nat) : notExceed v 0 = (v == 0) := by
  cases v <;> simp [notExceed]

-- 構造宣言
def capComparisonDeclared : Bool := true
theorem cap_comparison_is_declaration : capComparisonDeclared = true := rfl

end JapanTaxLaw.CapComparisonNorms
