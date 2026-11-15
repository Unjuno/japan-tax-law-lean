import JapanTaxLaw.InheritanceMinorDisabledDeduction

/-!
# InheritanceMinorDisabledDeduction tests — 相続税法 art. 19-3/19-4 smoke checks

Decidable smoke tests for the minor and disabled heirs' deductions, pinned to
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01

Each `example` covers an art. 19-3(1)/19-4(1) boundary, a rounding case
(months ceiling to years), a non-eligible case, or the excess calculation.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 切上げ: 端数があるとき・一年未満のときは一年とする
example : yearsCeil 1 = 1 := by decide
example : yearsCeil 11 = 1 := by decide
example : yearsCeil 12 = 1 := by decide
example : yearsCeil 13 = 2 := by decide
example : yearsCeil 216 = 18 := by decide

-- art. 19-3(1): 十八歳未満の相続人に十万円 × 18歳に達するまでの年数
example : minorDeduction ⟨true, 30⟩ = 300_000 := by decide
example : minorDeduction ⟨true, 12⟩ = 100_000 := by decide
example : minorDeduction ⟨true, 13⟩ = 200_000 := by decide
example : minorDeduction ⟨true, 216⟩ = 1_800_000 := by decide
-- 該当しない場合は 0
example : minorDeduction ⟨false, 60⟩ = 0 := by decide
-- 相続開始時点ですでに 18 歳の場合は 0（0 年）
example : minorDeduction ⟨true, 0⟩ = 0 := by decide

-- art. 19-4(1): 障害者（特別でない）なら十万円 × 85 歳に達するまでの年数
example : disabledDeduction ⟨true, false, 180⟩ = 1_500_000 := by decide
example : disabledDeduction ⟨true, false, 1020⟩ = 8_500_000 := by decide
-- art. 19-4(1) ただし書き: 特別障害者なら二十万円 × 年数
example : disabledDeduction ⟨true, true, 180⟩ = 3_000_000 := by decide
example : disabledDeduction ⟨true, true, 1020⟩ = 17_000_000 := by decide
example : disabledDeduction ⟨true, true, 13⟩ = 400_000 := by decide
-- 該当しない場合は 0
example : disabledDeduction ⟨false, true, 100⟩ = 0 := by decide

-- art. 19-3(2): 控除できなかった超過分（扶養義務者の算出額から控除される金額）
example : minorExcess ⟨true, 60⟩ 100_000 = 400_000 := by decide
example : minorExcess ⟨true, 60⟩ 600_000 = 0 := by decide
-- art. 19-4(3): 19-3(2) を準用
example : disabledExcess ⟨true, true, 60⟩ 100_000 = 900_000 := by decide
example : disabledExcess ⟨true, true, 60⟩ 1_000_000 = 0 := by decide

end JapanTaxLaw
