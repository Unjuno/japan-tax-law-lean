import JapanTaxLaw.LocalInsuranceDeduction

/-!
# LocalInsuranceDeduction tests — art. 34(1)第五号/第五号の三 smoke checks

Decidable smoke tests for the life-insurance and earthquake-insurance deductions,
pinned to
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01

Each example covers a boundary of an art. 34(1)第五号 bracket or the cap.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 新生命保険料欄: <= ¥12,000 は全額、≥ ¥56,000 は ¥28,000
example : newLifeInsuranceDeduction 0 = 0 := by decide
example : newLifeInsuranceDeduction 12_000 = 12_000 := by decide
example : newLifeInsuranceDeduction 12_001 = 12_000 := by decide
example : newLifeInsuranceDeduction 32_000 = 22_000 := by decide
example : newLifeInsuranceDeduction 32_001 = 22_000 := by decide
example : newLifeInsuranceDeduction 40_000 = 24_000 := by decide
example : newLifeInsuranceDeduction 56_000 = 28_000 := by decide
example : newLifeInsuranceDeduction 56_001 = 28_000 := by decide

-- 旧生命保険料欄: <= ¥15,000 は全額、≥ ¥70,000 は ¥35,000
example : oldLifeInsuranceDeduction 0 = 0 := by decide
example : oldLifeInsuranceDeduction 15_000 = 15_000 := by decide
example : oldLifeInsuranceDeduction 15_001 = 15_000 := by decide
example : oldLifeInsuranceDeduction 40_000 = 27_500 := by decide
example : oldLifeInsuranceDeduction 40_001 = 27_500 := by decide
example : oldLifeInsuranceDeduction 70_000 = 35_000 := by decide
example : oldLifeInsuranceDeduction 70_001 = 35_000 := by decide

-- 介護医療保険料欄: 新生命保険料と同じ
example : nursingCareMedicalInsuranceDeduction 20_000 = 16_000 := by decide
example : nursingCareMedicalInsuranceDeduction 100_000 = 28_000 := by decide

-- イ欄: 新・旧両方支払い → ¥28,000 合計上限
example : lifeInsuranceColumnI 20_000 20_000 = 28_000 := by decide
example : lifeInsuranceColumnI 0 100_000_000 = 35_000 := by decide
example : lifeInsuranceColumnI 100_000_000 0 = 28_000 := by decide
example : lifeInsuranceColumnI 0 0 = 0 := by decide

-- ハ欄: 新個人年金・旧個人年金両方支払い → ¥28,000 合計上限
example : lifeInsuranceColumnH 20_000 20_000 = 28_000 := by decide
example : newPersonalAnnuityDeduction 20_000 = 16_000 := by decide
example : oldPersonalAnnuityDeduction 20_000 = 17_500 := by decide

-- 合計額: イ + ロ + ハの sum を ¥70,000 に
example : lifeInsuranceDeduction 10_000 10_000 10_000 10_000 10_000 = 50_000 := by decide
example : lifeInsuranceDeduction 20_000 20_000 20_000 20_000 20_000 = 70_000 := by decide
example : lifeInsuranceDeduction 100_000_000 100_000_000 100_000_000 100_000_000 100_000_000 = 70_000 := by decide
-- ゼロ全支払で 0
example : lifeInsuranceDeduction 0 0 0 0 0 = 0 := by decide

-- 地震保険料控除: 二分の一、¥25,000 上限
example : earthquakeInsuranceDeduction 0 = 0 := by decide
example : earthquakeInsuranceDeduction 1 = 0 := by decide
example : earthquakeInsuranceDeduction 49_998 = 24_999 := by decide
example : earthquakeInsuranceDeduction 50_000 = 25_000 := by decide
example : earthquakeInsuranceDeduction 100_000 = 25_000 := by decide
example : earthquakeInsuranceDeduction 100_000_000 = 25_000 := by decide

end JapanTaxLaw
