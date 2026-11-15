import JapanTaxLaw.LocalIncomeTax

/-!
# LocalIncomeTax tests — 地方税法 art. 34(2)/(1)十号/art. 35 smoke checks

Decidable smoke tests for the prefectural inhabitant tax income slice, pinned to
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01

Each `example` covers a band boundary of art. 34(2)（基礎控除, ¥24M/¥24.5M/¥25M）,
art. 34(1) 十号（配偶者控除, ¥9M/¥9.5M/¥10M, 通常/老人控除対象配偶者）, and the flat
standard rates of art. 35（百分の四 / 指定都市百分の二）with their application to mixed
taxable bases.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- art. 34(2) 基礎控除: band boundaries (inclusive cap, ¥1 above it drops to next band)
example : basicDeduction 0 = 430_000 := by decide
example : basicDeduction 24_000_000 = 430_000 := by decide
example : basicDeduction 24_000_001 = 290_000 := by decide
example : basicDeduction 24_500_000 = 290_000 := by decide
example : basicDeduction 24_500_001 = 150_000 := by decide
example : basicDeduction 25_000_000 = 150_000 := by decide
example : basicDeduction 25_000_001 = 0 := by decide
example : basicDeduction 100_000_000 = 0 := by decide

-- art. 34(1) 十号 配偶者控除 (控除対象配偶者): 通常
example : spouseDeduction 0 false = 330_000 := by decide
example : spouseDeduction 9_000_000 false = 330_000 := by decide
example : spouseDeduction 9_000_001 false = 220_000 := by decide
example : spouseDeduction 9_500_000 false = 220_000 := by decide
example : spouseDeduction 9_500_001 false = 110_000 := by decide
example : spouseDeduction 10_000_000 false = 110_000 := by decide
example : spouseDeduction 10_000_001 false = 0 := by decide

-- art. 34(1) 十号 配偶者控除: 老人控除対象配偶者
example : spouseDeduction 0 true = 380_000 := by decide
example : spouseDeduction 9_000_000 true = 380_000 := by decide
example : spouseDeduction 9_000_001 true = 260_000 := by decide
example : spouseDeduction 9_500_000 true = 260_000 := by decide
example : spouseDeduction 9_500_001 true = 130_000 := by decide
example : spouseDeduction 10_000_000 true = 130_000 := by decide
example : spouseDeduction 10_000_001 true = 0 := by decide

-- art. 35 標準税率: 百分の四 / 指定都市百分の二
example : (localPrefecturalStandardRate false).applyFloor 1_000_000 = 40_000 := by decide
example : (localPrefecturalStandardRate true).applyFloor 1_000_000 = 20_000 := by decide

-- art. 35: 課税総所得金額のみ
example : localPrefecturalIncomeTaxAmount 10_000_000 0 0 false = 400_000 := by decide
example : localPrefecturalIncomeTaxAmount 10_000_000 0 0 true = 200_000 := by decide

-- art. 35: 課税総所得 + 課税退職所得 + 課税山林所得の合計 × 標準税率
example : localPrefecturalIncomeTaxAmount 3_000_000 2_000_000 1_000_000 false = 240_000 := by decide
example : localPrefecturalIncomeTaxAmount 3_000_000 2_000_000 1_000_000 true = 120_000 := by decide
example : localPrefecturalIncomeTaxAmount 9_999_999 0 0 false = 399_999 := by decide
example : localPrefecturalIncomeTaxAmount 0 0 0 false = 0 := by decide

end JapanTaxLaw
