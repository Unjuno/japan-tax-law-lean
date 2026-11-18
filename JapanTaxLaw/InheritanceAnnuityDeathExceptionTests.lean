import JapanTaxLaw.InheritanceAnnuityDeathException

/-!
# InheritanceAnnuityDeathException tests — 相続税法 art. 24(2) smoke checks

Decidable kernel smoke tests, pinned to
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008

Each `example` is closed by kernel `decide`; no theorem names are added.
権利者分・第三者分・通常価額はすべて caller-established Money、Bool は選択
のみに使い金額式には入れない。ゼロ・第三者分あり／なし・境界を再確認する。
-/ 

namespace JapanTaxLaw.InheritanceAnnuityDeathException

open JapanTaxLaw.TaxFinance

-- deathExceptionValue: ゼロ / 第三者分なし / 第三者分あり / 境界
example : deathExceptionValue 0 0 = 0 := by decide
example : deathExceptionValue 100 0 = 100 := by decide
example : deathExceptionValue 0 50 = 50 := by decide
example : deathExceptionValue 100 50 = 150 := by decide
example : deathExceptionValue 1 1 = 2 := by decide
example : deathExceptionValue 1_000_000 250_000 = 1_250_000 := by decide

-- deathExceptionSelected: 第三者分あり／なしの選択
example : deathExceptionSelected true 100 50 = 150 := by decide
example : deathExceptionSelected false 100 50 = 100 := by decide
example : deathExceptionSelected true 0 0 = 0 := by decide
example : deathExceptionSelected false 0 50 = 0 := by decide

-- deathExceptionApplies: 死亡時期 × 給付終了の全組合せ
example : deathExceptionApplies true true = true := by decide
example : deathExceptionApplies true false = false := by decide
example : deathExceptionApplies false true = false := by decide
example : deathExceptionApplies false false = false := by decide

-- art24_2Value: 境界（特例適用／非適用 × 第三者分あり／なし × ゼロ）
example : art24_2Value true true true 100 50 999 = 150 := by decide
example : art24_2Value true true false 100 50 999 = 100 := by decide
example : art24_2Value true false true 100 50 999 = 999 := by decide
example : art24_2Value false true false 100 50 999 = 999 := by decide
example : art24_2Value false false true 0 0 7 = 7 := by decide
example : art24_2Value true true true 0 0 0 = 0 := by decide
example : art24_2Value true true false 7 3 999 = 7 := by decide

end JapanTaxLaw.InheritanceAnnuityDeathException
