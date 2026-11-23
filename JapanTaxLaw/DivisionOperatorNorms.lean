/-\!
# DivisionOperatorNorms — 除算演算子（「…を…で除して得た…」）47 units, PROVED_SCOPE

47 clauses containing the arithmetic operator: a value is obtained by dividing
a numerator by a divisor (numerator ÷ divisor). Genuine normative computation
primitive in tax law (e.g. 配偶者居住権の年数除算, 住宅用地の面積÷住居数).

変数の意味・単位・定義域：
  numerator : Nat — 被除数（単位：条文依存、例：年数・面積・金額）
  divisor : Nat — 除数（単位：同左、定義域：正の自然数を想定）
  result : Nat — 商（自然数、小数点以下切り捨て）
次元整合性：numerator[単位] ÷ divisor[同単位] = result[無次元] 又は
  divisor[個数] の場合は result[単位/個]。除数ゼロは条文で「零」と規定される
  場合があり、Nat の除算では 0 を返す（Lean の Nat.div 規約）。

Only the division structure (Nat.div laws incl. zero-divisor convention) is
kernel-proven; concrete values, rounding policy and other provision conditions
are NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.DivisionOperatorNorms

-- 除算：被除数 ÷ 除数（Nat 除算、除数0は0を返す）
def dividedValue (numerator divisor : Nat) : Nat := numerator / divisor

theorem div_self (n : Nat) (h : n > 0) : dividedValue n n = 1 := by
  unfold dividedValue
  exact Nat.div_self h
theorem div_zero_divisor (n : Nat) : dividedValue n 0 = 0 := by simp [dividedValue]
theorem div_zero_numerator (d : Nat) : dividedValue 0 d = 0 := by simp [dividedValue]
theorem div_by_one (n : Nat) : dividedValue n 1 = n := by simp [dividedValue]
-- 商×除数 <= 被除数（切り捨ての性質）
theorem mul_div_le (n d : Nat) : (n / d) * d <= n := Nat.div_mul_le_self n d

def divisionOperatorDeclared : Bool := true
theorem division_operator_is_declaration : divisionOperatorDeclared = true := rfl

end JapanTaxLaw.DivisionOperatorNorms
