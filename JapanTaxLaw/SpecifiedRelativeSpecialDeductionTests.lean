import JapanTaxLaw.SpecifiedRelativeSpecialDeduction

/-!
# SpecifiedRelativeSpecialDeductionTests — 所得税法 art.84の2 回帰テスト

Pinned: law 340AC0000000033 / revision ..._20261001_507AC0000000070.
境界（850,000 / 1,150,000 / 1,200,000）、丸め段差、定義域外の防御値、
840,001 を 841,000 と誤る 10倍誤りの反例を検査。
該当性・年齢・適用除外は NOT MODELLED。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

example : specifiedRelativeSpecialDeduction 0 = 630_000 := by decide
example : specifiedRelativeSpecialDeduction 850_000 = 630_000 := by decide
example : specifiedRelativeSpecialDeduction 850_001 = 610_000 := by decide
example : specifiedRelativeSpecialDeduction 1_150_000 = 110_000 := by decide
example : specifiedRelativeSpecialDeduction 1_150_001 = 60_000 := by decide
example : specifiedRelativeSpecialDeduction 1_200_000 = 60_000 := by decide
example : specifiedRelativeSpecialDeduction 1_200_001 = 30_000 := by decide
example : specifiedRelativeSpecialDeduction 850_001 ≠ 612_000 := by decide
example : specialRelativeRound 20_000 = 20_000 := by decide
example : specialRelativeRound 19_999 = 0 := by decide
example : specialRelativeRound 119_999 = 20_000 := by decide
example : specialRelativeRound 120_000 = 120_000 := by decide
example : specifiedRelativeSpecialDeduction 999_999 ≤ 630_000 := by decide

end JapanTaxLaw
