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

-- art. 34(1) 第二号 医療費控除額（threshold-based）
example : medicalExpenseDeduction ⟨100_000_000, 0⟩ = 0 := by decide
example : medicalExpenseDeduction ⟨100_000_000, 100_000⟩ = 0 := by decide
example : medicalExpenseDeduction ⟨100_000_000, 300_000⟩ = 200_000 := by decide
example : medicalExpenseDeduction ⟨100_000_000, 2_100_000⟩ = 2_000_000 := by decide
example : medicalExpenseDeduction ⟨1_000_000, 60_000⟩ = 10_000 := by decide
example : medicalExpenseDeduction ⟨1_000_000, 90_000⟩ = 40_000 := by decide
example : medicalExpenseDeduction ⟨1_000_000, 100_000_000⟩ = 2_000_000 := by decide

-- art. 34(1) 第六号 障害者控除額（同一生計配偶者又は扶養親族が特別障害者・同居常況 → 五十三万円）
example : disabilityDeduction false false false = 260_000 := by decide
example : disabilityDeduction true false false = 300_000 := by decide
example : disabilityDeduction true true false = 300_000 := by decide
example : disabilityDeduction true true true = 530_000 := by decide
example : disabilityDeduction false true true = 260_000 := by decide

-- art. 34(1) 第八号 寡婦控除額 = ¥260,000 / 第八号の二 ひとり親控除額 = ¥300,000
example : widowDeduction = 260_000 := by decide
example : singleParentDeduction = 300_000 := by decide

-- art. 34(1)第十二号 特定親族特別控除額（イ/ロ/ハ/ニ 帯域）
example : specificDependentDeduction 0 = 450_000 := by decide
example : specificDependentDeduction 950_000 = 450_000 := by decide
example : specificDependentDeduction 950_001 = 510_000 := by decide
example : specificDependentDeduction 1_000_000 = 410_000 := by decide
example : specificDependentDeduction 1_150_000 = 110_000 := by decide
example : specificDependentDeduction 1_150_001 = 60_000 := by decide
example : specificDependentDeduction 1_200_000 = 60_000 := by decide
example : specificDependentDeduction 1_200_001 = 30_000 := by decide
example : specificDependentDeduction 2_000_000 = 30_000 := by decide

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

-- 追加の境界: 小さい正の入力 (1..13) — 控除帯の下限と 4% 標準税率の切り捨て
example : basicDeduction 7 = 430_000 := by decide
example : localPrefecturalIncomeTaxAmount 13 0 0 false = 0 := by decide  -- 13*4/100 = 0

end JapanTaxLaw
