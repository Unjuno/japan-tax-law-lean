import JapanTaxLaw.ConsolidationCreditLimit

/-!
# ConsolidationCreditLimit tests — 法人税法施行令 art.148 smoke checks

Decidable smoke tests, pinned to

  Law id: 340CO0000000097
  Revision: 340CO0000000097_20261001_507CO0000000121

CORRECTED 2026-11-20 (Batch S adversarial CONFIRMED finding):
  §2 は原文どおり `第一号 × 第三号 / 第二号`（旧値は誤って `+` を使用）。
  境界: 分母 0、第三号 0、端数（割り切れない入力）、割合 > 1、
  控除 ≥ 調整前で 0、一致・不一致の分岐境界を確認する。
-/

namespace JapanTaxLaw.ConsolidationCreditLimit

-- §2（調整前控除限度額）: 第一号 100, 第二号 200, 第三号 50 → 100*50/200 = 25（原文どおり）
example : preAdjustmentLimit 100 200 50 = 25 := by decide
-- §2: 第一号 0 → 0
example : preAdjustmentLimit 0 10 4 = 0 := by decide
-- §2: 第三号 0 → 0
example : preAdjustmentLimit 1_000 10 0 = 0 := by decide
-- §2: 境界 — 分母 0 → 0（第三号が大きくても 0）
example : preAdjustmentLimit 999 0 777 = 0 := by decide
-- §2: 境界 — 第二号 = 1（割合 100%）→ 第一号そのもの
example : preAdjustmentLimit 50 1 1 = 50 := by decide
-- §2: 端数 — 第二号 3, 第三号 1（割合 1/3）→ 100/3 = 33（切り捨て）
example : preAdjustmentLimit 100 3 1 = 33 := by decide
-- §2: 端数 — 第二号 7, 第三号 2（割合 2/7）→ 250*2/7 = 71（切り捨て）
example : preAdjustmentLimit 250 7 2 = 71 := by decide
-- §2: 割合 > 1（第三号 9, 第二号 5）→ 10*9/5 = 18（クランプなし）
example : preAdjustmentLimit 10 5 9 = 18 := by decide

-- §1（控除限度額）: 調整前 500, 調整額 120 → 380
example : consolidationCreditLimit 500 120 = 380 := by decide
-- §1: 境界 — 調整額 = 調整前 → 0
example : consolidationCreditLimit 500 500 = 0 := by decide
-- §1: 境界 — 調整額 > 調整前 → 0（零を下回る場合には零）
example : consolidationCreditLimit 500 501 = 0 := by decide
-- §1: 境界 — 調整前 0 → 0
example : consolidationCreditLimit 0 100 = 0 := by decide
-- §1: 境界 — 調整額 0 → 調整前そのもの
example : consolidationCreditLimit 123 0 = 123 := by decide
-- §1: 調整額 = 調整前 − 1 → 1
example : consolidationCreditLimit 124 123 = 1 := by decide

end JapanTaxLaw.ConsolidationCreditLimit
