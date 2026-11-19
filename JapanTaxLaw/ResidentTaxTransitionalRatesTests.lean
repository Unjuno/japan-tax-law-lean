import JapanTaxLaw.ResidentTaxTransitionalRates

/-!
# ResidentTaxTransitionalRates tests — 地方税法施行令 art. 12 smoke checks

Decidable kernel smoke tests, pinned to
  Law id: 347CO0000000161
  Revision: 347CO0000000161_20010106_412CO0000000304

Each `example` is closed by kernel `decide`; no theorem names are added.
The table rate, the population classification and applicability are
caller-established; no Bool enters any money formula.
Rounding is floor (切り捨て) via TaxRate.applyFloor.
-/

namespace JapanTaxLaw.ResidentTaxTransitionalRates

open JapanTaxLaw.TaxFinance

-- 一 イ / ロ 均等割の年額（290 / 150 / 430 / 230 円）
example : standardPerCapita = 290 := by decide
example : standardPerCapitaSmall = 150 := by decide
example : limitPerCapita = 430 := by decide
example : limitPerCapitaSmall = 230 := by decide

-- 人口境界（人口五万未満 / 以上）
example : populationUnder50k 0 = true := by decide
example : populationUnder50k 49_999 = true := by decide
example : populationUnder50k 50_000 = false := by decide
example : populationUnder50k 50_001 = false := by decide

-- 二 イ 所得割標準税率 = 表の率 × 80/100（端数切り捨て）
example : incomeTaxStandardRate 0 = 0 := by decide
example : incomeTaxStandardRate 1 = 0 := by decide
example : incomeTaxStandardRate 2 = 1 := by decide
example : incomeTaxStandardRate 3 = 2 := by decide
example : incomeTaxStandardRate 10 = 8 := by decide
example : incomeTaxStandardRate 100 = 80 := by decide
example : incomeTaxStandardRate 1000 = 800 := by decide

-- 二 ロ 所得割制限税率 = イの率 × 15/10（一・五倍、150/10 ではない）
example : incomeTaxLimitRate 0 = 0 := by decide
example : incomeTaxLimitRate 1 = 0 := by decide
example : incomeTaxLimitRate 2 = 1 := by decide
example : incomeTaxLimitRate 3 = 3 := by decide
example : incomeTaxLimitRate 8 = 9 := by decide
example : incomeTaxLimitRate 10 = 12 := by decide
example : incomeTaxLimitRate 100 = 120 := by decide
example : incomeTaxLimitRate 2 ≠ 30 := by decide
example : incomeTaxLimitRate 100 ≠ 1200 := by decide

-- 三 退職手当等に係る所得割 = 表の率 × 80/100（二 イ と同じ算術）
example : retirementIncomeTaxStandardRate 0 = 0 := by decide
example : retirementIncomeTaxStandardRate 1 = 0 := by decide
example : retirementIncomeTaxStandardRate 2 = 1 := by decide
example : retirementIncomeTaxStandardRate 10 = 8 := by decide
example : retirementIncomeTaxStandardRate 1000 = 800 := by decide

end JapanTaxLaw.ResidentTaxTransitionalRates
