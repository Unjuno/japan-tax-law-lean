/-\!
# SubtractionOperatorNorms — 減算演算子（「…を控除した額」）45 units, PROVED_SCOPE

45 clauses containing the arithmetic operator: an amount is obtained by
subtracting a deduction from a base (base − deduction = amount). Genuine norma-
tive computation primitive in tax law (控除した額/控除して得た/減額した額).

変数の意味・単位・定義域：
  base : Nat — 控除前の金額（単位：円）、定義域：非負整数
  deduction : Nat — 控除額（単位：円、0 ≤ deduction）
  result : Nat — 控除後金額（単位：円）
次元整合性：base[円] − deduction[円] = result[円]（同次元）。
Nat の減算は saturating（base < deduction なら 0）。

Only the subtraction structure (Nat.sub laws incl. saturation) is kernel-proven;
concrete values, ordering constraints and other provision conditions are NOT
MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.SubtractionOperatorNorms

-- 減算：base − deduction（Nat.sub、base < deduction なら 0）
def deductedAmount (base deduction : Nat) : Nat := base - deduction

theorem subtract_zero (b : Nat) : deductedAmount b 0 = b := by simp [deductedAmount]
theorem subtract_self (b : Nat) : deductedAmount b b = 0 := by simp [deductedAmount]
theorem saturating (b d : Nat) (h : b <= d) : deductedAmount b d = 0 := by
  simp [deductedAmount, Nat.sub_eq_zero_of_le h]
theorem add_back (b d : Nat) (h : d <= b) : deductedAmount b d + d = b := by
  exact Nat.sub_add_cancel h

def subtractionOperatorDeclared : Bool := true
theorem subtraction_operator_is_declaration : subtractionOperatorDeclared = true := rfl

end JapanTaxLaw.SubtractionOperatorNorms
