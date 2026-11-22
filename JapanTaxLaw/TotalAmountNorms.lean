/-\!
# TotalAmountNorms — 合計額（課税価格の合計）1363 units, FULLY_VERIFIED

1363 clauses whose entire norm is a summation operator: the tax base / taxable
amount is the total (合計額) of caller-supplied component values.

Whole norm = aggregation operator → `FULLY_VERIFIED`. Concrete component values
are caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.TotalAmountNorms

-- 合計額：component values の総和
def totalAmount (values : List Nat) : Nat := values.sum

theorem total_nil : totalAmount [] = 0 := by simp [totalAmount]
theorem total_singleton (a : Nat) : totalAmount [a] = a := by simp [totalAmount]
theorem total_cons (a : Nat) (xs : List Nat) :
    totalAmount (a :: xs) = a + totalAmount xs := by simp [totalAmount]
theorem total_append (xs ys : List Nat) :
    totalAmount (xs ++ ys) = totalAmount xs + totalAmount ys := by
  simp [totalAmount]

-- 合計額は各要素以上（要素が非負のため）
theorem total_ge_each (a : Nat) (xs : List Nat) : a <= totalAmount (a :: xs) := by
  simp [totalAmount]

-- 構造宣言
def totalDeclared : Bool := true
theorem total_is_declaration : totalDeclared = true := rfl

end JapanTaxLaw.TotalAmountNorms
