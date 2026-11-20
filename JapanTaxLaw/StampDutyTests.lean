import JapanTaxLaw.StampDuty

/-!
# StampDuty tests — 印紙税法 art. 20 smoke checks

Decidable smoke tests for the 印紙税法 art. 20 過怠税 model, pinned to
  Law id: 342AC0000000023
  Revision: 342AC0000000023_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- art. 20(1) discovered non-payment: unpaid + 2× unpaid = 3× unpaid
example : stampAuditPenalty 0 = 0 := by decide
example : stampAuditPenalty 100 = 300 := by decide
example : stampAuditPenalty 334 = 1_002 := by decide

-- art. 20(2) anticipated self-declared (before investigation):
--   unpaid + 10% of unpaid
example : stampDeclaredPenalty 0 = 0 := by decide
example : stampDeclaredPenalty 100 = 110 := by decide
example : stampDeclaredPenalty 200 = 220 := by decide
example : stampDeclaredPenalty 1_000 = 1_100 := by decide

-- art. 20(4): aggregate underpayment penalty below ¥1,000 is rounded up
example : stampDutyFloor 0 = 1_000 := by decide
example : stampDutyFloor 500 = 1_000 := by decide
example : stampDutyFloor 999 = 1_000 := by decide
example : stampDutyFloor 1_000 = 1_000 := by decide
example : stampDutyFloor 1_001 = 1_001 := by decide

-- helper composition: audit penalty with floor applied below threshold
example : stampAuditPenaltyFloor 0 = 1_000 := by decide
example : stampAuditPenaltyFloor 333 = 1_000 := by decide
example : stampAuditPenaltyFloor 334 = 1_002 := by decide
example : stampAuditPenaltyFloor 500 = 1_500 := by decide

-- art. 20(5) note: the model distinguishes floor-applying aggregates
example : stampDeclaredOnlyTotalsExcludeFloor = true := by decide

-- art. 20(3): uncancelled stamps -> face value
example : stampUncancelledPenalty 300 = 300 := by decide

-- art. 20(4)/(5): aggregate with §20(5) exemption
example : stampAggregatePenalty ⟨0, 0, 0⟩ = 0 := by decide
example : stampAggregatePenalty ⟨0, 0, 500⟩ = 500 := by decide
example : stampAggregatePenalty ⟨0, 0, 999⟩ = 999 := by decide
example : stampAggregatePenalty ⟨0, 0, 1_000⟩ = 1_000 := by decide
example : stampAggregatePenalty ⟨0, 0, 2_500⟩ = 2_500 := by decide
example : stampAggregatePenalty ⟨0, 100, 0⟩ = 1_000 := by decide
example : stampAggregatePenalty ⟨0, 999, 0⟩ = 1_000 := by decide
example : stampAggregatePenalty ⟨0, 1_000, 0⟩ = 1_000 := by decide
example : stampAggregatePenalty ⟨0, 5_000, 0⟩ = 5_000 := by decide
example : stampAggregatePenalty ⟨100, 0, 0⟩ = 1_000 := by decide
example : stampAggregatePenalty ⟨2_500, 0, 0⟩ = 2_500 := by decide
example : stampAggregatePenalty ⟨300, 0, 100⟩ = 1_000 := by decide
example : stampAggregatePenalty ⟨0, 100, 200⟩ = 1_000 := by decide
example : stampAggregatePenalty ⟨300, 300, 300⟩ = 1_000 := by decide
example : stampAggregatePenalty ⟨2_000, 100, 500⟩ = 2_600 := by decide
example : stampAggregatePenalty ⟨0, 400, 400⟩ = 1_000 := by decide

-- ==== 追加の境界: ゼロ入力 / 小さい正の入力 (1..13) / 飽和・単位元境界 ====
-- (a) 零入力: 未消印の印紙税額面 0 → 過怠税 0（単位元）
example : stampUncancelledPenalty 0 = 0 := by decide
-- (b) 小さい正の入力 (1..13): 自己申告 13 円 → 13 + (13*10)/100 = 13 + 1 = 14
example : stampDeclaredPenalty 13 = 14 := by decide
-- (c) 単位元境界: 1 円の 10% は切捨てで 0 → 結果 1 = 入力（自己申告過怠税の identity）
example : stampDeclaredPenalty 1 = 1 := by decide

end JapanTaxLaw
