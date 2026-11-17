import JapanTaxLaw.LocalTaxMedicalIncomeRatio

/-!
# LocalTaxMedicalIncomeRatioTests — 地方税法施行令 第二十一条の八 の smoke checks

Decidable kernel-decided smoke tests, pinned to

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  Amendment enforcement date: 2026-11-01

「割合が十分の三以下」の境界（ちょうど 3/10 → true／3/10 超 → false）、
分母零・医療収入零、および caller-established Bool の結合を確認する。

NOT MODELLED: 金額の認定・該当性・法的判断（すべて caller-established、impl の doc-comment 参照）。

-/

namespace JapanTaxLaw.LocalTaxMedicalIncomeRatio

open JapanTaxLaw.TaxFinance

-- 境界: ちょうど 3/10 → true（適用側）
example : medicalIncomeRatioWithin3Tenths 3 10 = true := by decide
example : medicalIncomeRatioWithin3Tenths 30 100 = true := by decide
example : medicalIncomeRatioWithin3Tenths 300_000 1_000_000 = true := by decide
-- 境界: 3/10 超 → false
example : medicalIncomeRatioWithin3Tenths 4 10 = false := by decide
example : medicalIncomeRatioWithin3Tenths 31 100 = false := by decide
example : medicalIncomeRatioWithin3Tenths 300_001 1_000_000 = false := by decide

-- 分母零でも安全（停止する）
example : medicalIncomeRatioWithin3Tenths 0 0 = true := by decide
example : medicalIncomeRatioWithin3Tenths 1 0 = false := by decide

-- 医療収入（分子）零
example : medicalIncomeRatioWithin3Tenths 0 1 = true := by decide
example : medicalIncomeRatioWithin3Tenths 0 100 = true := by decide

-- 小さい割合
example : medicalIncomeRatioWithin3Tenths 1 100 = true := by decide

-- 適用除外判定（caller-established Bool の結合）
example : medicalFacilityApplicationExcluded 3 10 true true = true := by decide
example : medicalFacilityApplicationExcluded 30 100 true true = true := by decide
example : medicalFacilityApplicationExcluded 4 10 true true = false := by decide
example : medicalFacilityApplicationExcluded 3 10 false true = false := by decide
example : medicalFacilityApplicationExcluded 3 10 true false = false := by decide
example : medicalFacilityApplicationExcluded 3 10 false false = false := by decide
example : medicalFacilityApplicationExcluded 0 0 true true = true := by decide
example : medicalFacilityApplicationExcluded 1 0 true true = false := by decide

end JapanTaxLaw.LocalTaxMedicalIncomeRatio
