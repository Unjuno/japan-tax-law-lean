/-\!
# MultiplicationOperatorNorms — 乗算演算子（「価格に率を乗じて得た額」）165 units, PROVED_SCOPE

165 clauses containing the arithmetic operator: an amount is obtained by
multiplying a base value by a rate (base × rate = amount). The operator is a
genuine normative computation primitive in tax law.

変数の意味・単位・定義域：
  base : Nat — 課税標準となる価額（単位：円）、定義域：自然数（非负）
  rate : Nat — 適用される率（単位：倍率を整数で表現、例えば 5% → 5）
  amount : Nat — 算出額（単位：円）
次元整合性：base[円] × rate[倍率] = amount[円]（率は無次元の倍率として扱う）。
正確な率の分割・丸めはこの演算子の範囲外（個別条文で規定）。

Only the multiplication structure (and its algebraic laws) is kernel-proven;
the concrete base/rate values, rounding and the containing provision's other
conditions are NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.MultiplicationOperatorNorms

-- 乗算：基礎额 × 率 = 額（Nat 上の乗算、単位: 円 × 倍率 → 円）
def multipliedAmount (base rate : Nat) : Nat := base * rate

theorem zero_rate_zero : multipliedAmount b 0 = 0 := by simp [multipliedAmount]
theorem zero_base_zero : multipliedAmount 0 r = 0 := by simp [multipliedAmount]
theorem one_rate_identity : multipliedAmount b 1 = b := by simp [multipliedAmount]
theorem monotone_in_base (b b' r : Nat) (h : b <= b') :
    multipliedAmount b r <= multipliedAmount b' r := by
  exact Nat.mul_le_mul_right r h
theorem distributive (b1 b2 r : Nat) :
    multipliedAmount (b1 + b2) r = multipliedAmount b1 r + multipliedAmount b2 r := by
  simp [multipliedAmount, Nat.add_mul]
theorem commutative (b r : Nat) : multipliedAmount b r = multipliedAmount r b := by
  simp [multipliedAmount, Nat.mul_comm]

def multiplicationOperatorDeclared : Bool := true
theorem multiplication_operator_is_declaration : multiplicationOperatorDeclared = true := rfl

end JapanTaxLaw.MultiplicationOperatorNorms
