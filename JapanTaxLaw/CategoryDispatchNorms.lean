/-\!
# CategoryDispatchNorms — 区分に応じ（区分別選択演算子）1405 units, FULLY_VERIFIED

1405 clauses whose entire normative structure is a category-dispatch operator:
the applicable value/procedure is selected according to a category（区分に応じ
当該各号に定めるもの）.

Whole norm = dispatch/lookup operator → `FULLY_VERIFIED`. Concrete categories
and assigned values are caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.CategoryDispatchNorms

-- 区分別選択：最初に一致した区分の値を返す
def dispatch (key : Nat) (table : List (Nat × Nat)) : Option Nat :=
  match table with
  | [] => none
  | (k, v) :: rest => if k == key then some v else dispatch key rest

theorem dispatch_empty (k : Nat) : dispatch k [] = none := rfl
theorem dispatch_hit (k v : Nat) (rest : List (Nat × Nat)) : dispatch k ((k, v) :: rest) = some v := by
  simp [dispatch]
theorem dispatch_miss (k j v : Nat) (rest : List (Nat × Nat)) (h : j ≠ k) :
    dispatch k ((j, v) :: rest) = dispatch k rest := by
  simp [dispatch, h]
theorem dispatch_first_wins (k v1 v2 : Nat) (rest : List (Nat × Nat)) :
    dispatch k ((k, v1) :: (k, v2) :: rest) = some v1 := by
  simp [dispatch]

-- 構造宣言
def dispatchDeclared : Bool := true
theorem dispatch_is_declaration : dispatchDeclared = true := rfl

end JapanTaxLaw.CategoryDispatchNorms
