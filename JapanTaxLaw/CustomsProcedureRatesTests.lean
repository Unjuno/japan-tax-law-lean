import JapanTaxLaw.CustomsProcedureRates

/-!
# CustomsProcedureRates tests — 関税法 art. 14の5 smoke checks

Decidable smoke tests, pinned to
  Law id: 329AC0000000061
  Revision: 329AC0000000061_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01

第七条の十七・第十一条は NOT MODELLED（計算式なし）— docs/STAGING_WD.md 参照。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- art. 14の5: 控除後代金 = 公売・売却代金 − 関税に先だつ費用
example : replacementNetProceeds 1_000_000 200_000 = 800_000 := by decide
example : replacementNetProceeds 500_000 150_000 = 350_000 := by decide
example : replacementNetProceeds 1_000_000 0 = 1_000_000 := by decide
-- 境界: 費用 = 代金 / underflow（費用 > 代金、入力妥当性は caller-established）
example : replacementNetProceeds 1_000_000 1_000_000 = 0 := by decide
example : replacementNetProceeds 1_000_000 1_200_000 = 0 := by decide
example : replacementNetProceeds 0 5_000 = 0 := by decide

-- 上限: 充当額は控除後代金を超えない
example : cappedReplacementDuty 1_000_000 200_000 900_000 = 800_000 := by decide
example : cappedReplacementDuty 1_000_000 200_000 800_000 = 800_000 := by decide
example : cappedReplacementDuty 1_000_000 200_000 300_000 = 300_000 := by decide
example : cappedReplacementDuty 1_000_000 1_200_000 300_000 = 0 := by decide

-- within-cap 判定
example : replacementDutyWithinCap 1_000_000 200_000 800_000 = true := by decide
example : replacementDutyWithinCap 1_000_000 200_000 800_001 = false := by decide
example : replacementDutyWithinCap 1_000_000 200_000 0 = true := by decide
example : replacementDutyWithinCap 1_000_000 1_200_000 1 = false := by decide

end JapanTaxLaw
