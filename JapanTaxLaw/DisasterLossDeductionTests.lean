import JapanTaxLaw.DisasterLossDeduction

/-!
# DisasterLossDeduction tests — art. 34(1)第一号 smoke checks

Decidable smoke tests for the disaster-loss deduction, pinned to
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- イ: 災害関連支出が ¥50,000 以下（or none）→ 閾値は総所得×10%
example : disasterLossDeductionThreshold ⟨1_000_000, 150_000, 0⟩ = 100_000 := by decide
-- イ: 損失がちょうど閾値と同じ → 0
example : disasterLossDeduction ⟨1_000_000, 100_000, 0⟩ = 0 := by decide
-- イ: 損失 > 閾値 → 差額
example : disasterLossDeduction ⟨1_000_000, 150_000, 0⟩ = 50_000 := by decide
-- ロ: 災害関連支出 ¥80,000 → loss 200_000、th = min(200_000 − 30_000, 100_000) = 100_000
example : disasterLossDeductionThreshold ⟨1_000_000, 200_000, 80_000⟩ = 100_000 := by decide
example : disasterLossDeduction ⟨1_000_000, 200_000, 80_000⟩ = 100_000 := by decide
-- ハ: 全て災害関連支出 → th = min(50_000, 100_000) = 50_000
example : disasterLossDeductionThreshold ⟨1_000_000, 80_000, 80_000⟩ = 50_000 := by decide
example : disasterLossDeduction ⟨1_000_000, 80_000, 80_000⟩ = 30_000 := by decide
-- ハ: イ < ¥50,000 かつ全て災害関連支出のときはイを使う
example : disasterLossDeductionThreshold ⟨100_000, 80_000, 80_000⟩ = 10_000 := by decide
example : disasterLossDeduction ⟨100_000, 80_000, 80_000⟩ = 70_000 := by decide
-- イ: 総所得ゼロ → th=0
example : disasterLossDeductionThreshold ⟨0, 100_000, 0⟩ = 0 := by decide
example : disasterLossDeduction ⟨0, 100_000, 0⟩ = 100_000 := by decide
-- 損失ゼロ
example : disasterLossDeduction ⟨1_000_000, 0, 0⟩ = 0 := by decide
-- boundary ¥50,000 spend — still イ
example : disasterLossDeductionThreshold ⟨1_000_000, 200_000, 50_000⟩ = 100_000 := by decide
-- ¥50,001 — ロ prorated
example : disasterLossDeductionThreshold ⟨1_000_000, 200_000, 50_001⟩ = 100_000 := by decide
-- イ: 小さい総所得 13 の十分の一は 13×10/100 = 1 (floor)、損失 5 → 控除 5−1 = 4
example : disasterLossDeduction ⟨13, 5, 0⟩ = 4 := by decide

end JapanTaxLaw
