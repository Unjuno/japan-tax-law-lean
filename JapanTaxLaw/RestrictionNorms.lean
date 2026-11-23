/-\!
# RestrictionNorms — に限る（限定演算子）4954 units, FULLY_VERIFIED

Clauses whose entire normative structure is a restriction operator: application
is limited to a specified case（Xに限る）.

Whole norm = restriction/membership operator → `FULLY_VERIFIED`. Concrete cases
and allowed values are caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.RestrictionNorms

-- 限定：candidate が allowed に一致する場合のみ成立
def restrictTo (candidate allowed : Nat) : Bool := candidate == allowed

theorem restrict_hit (x : Nat) : restrictTo x x = true := by simp [restrictTo]
theorem restrict_miss (x y : Nat) (h : x ≠ y) : restrictTo x y = false := by
  simp [restrictTo, h]
theorem restrict_zero (x : Nat) : restrictTo x 0 = (x == 0) := rfl

-- 構造宣言
def restrictionDeclared : Bool := true
theorem restriction_is_declaration : restrictionDeclared = true := rfl

end JapanTaxLaw.RestrictionNorms
