import JapanTaxLaw.HistoricalSalaryDeduction

/-! Independent spec: 十分の二 = 五分の一, a different numeral proved equal. -/

namespace JapanTaxLaw.HistoricalSalaryDeduction

def specDeduction (band : Band) (income : Nat) : Nat :=
  let base := bandBase band
  base + (income - base) / 5

/-- 実装 ≡ 独立仕様（全称、すべての band と income）。 -/
theorem agreeDeduction (band : Band) (income : Nat) :
    deduction band income = specDeduction band income := by
  unfold deduction specDeduction
  dsimp
  congr 1
  exact Nat.mul_div_mul_right (income - bandBase band) 5 (by decide)

theorem monotone (band : Band) : ∀ a b, a ≤ b → deduction band a ≤ deduction band b := by
  intro a b h
  unfold deduction
  exact Nat.add_le_add_left (Nat.div_le_div_right (Nat.mul_le_mul_right 2 (Nat.sub_le_sub_right h _))) _

end JapanTaxLaw.HistoricalSalaryDeduction
