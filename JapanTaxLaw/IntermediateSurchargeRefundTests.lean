import JapanTaxLaw.IntermediateSurchargeRefund

/-!
# IntermediateSurchargeRefundTests — 地方税法施行令 art. 26 の smoke checks

Decidable kernel-decided smoke tests, pinned to

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  Amendment enforcement date: 2026-11-01

本則の按分（分母零、還付額 = 中間納付額で納付済延滞金額そのもの、端数切り捨て）と
ただし書の控除（amount2 > amount1 で 0、第二号 0、境界）を確認する。

NOT MODELLED: 第二号の「法の規定により計算される延滞金額の合計額」の算定
（各中間納付額につき法の規定により計算する手続）、充当の成立、前条の還付成立、
区分の判定（すべて caller-established、impl の doc-comment 参照）。

-/

namespace JapanTaxLaw.IntermediateSurchargeRefund

open JapanTaxLaw.TaxFinance

-- ==== 本則: surchargeRefund ====
-- 分母零 → 0（安全版）
example : surchargeRefund 10 3 0 = 0 := by decide
example : surchargeRefund 0 0 0 = 0 := by decide
-- 還付額 = 中間納付額 → 納付済延滞金額そのもの
example : surchargeRefund 1_000 1_000 1_000 = 1_000 := by decide
example : surchargeRefund 65_432 65_432 65_432 = 65_432 := by decide
-- 端数切り捨て
example : surchargeRefund 1_000 1 3 = 333 := by decide
example : surchargeRefund 1_000 2 3 = 666 := by decide
example : surchargeRefund 100_000 2 3 = 66_666 := by decide
example : surchargeRefund 12_345 3_000 10_000 = 3_703 := by decide
-- 按分（割合 30%）
example : surchargeRefund 100_000 3_000 10_000 = 30_000 := by decide
-- 還付額零 / 納付済延滞金額零
example : surchargeRefund 100_000 0 10_000 = 0 := by decide
example : surchargeRefund 0 3_000 10_000 = 0 := by decide

-- ==== ただし書: splitRefund ====
-- 第一号 − 第二号
example : splitRefund 5_000 2_000 = 3_000 := by decide
example : splitRefund 1_000 999 = 1 := by decide
-- amount2 > amount1 → 0（saturating）
example : splitRefund 2_000 5_000 = 0 := by decide
example : splitRefund 0 1 = 0 := by decide
-- 境界
example : splitRefund 5_000 5_000 = 0 := by decide
example : splitRefund 5_000 0 = 5_000 := by decide
example : splitRefund 0 0 = 0 := by decide

end JapanTaxLaw.IntermediateSurchargeRefund
