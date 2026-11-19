import JapanTaxLaw.ConsolidationCreditLimit

/-!
# ConsolidationCreditLimit tests — 法人税法施行令 art.148 smoke checks

Decidable smoke tests, pinned to

  Law id: 340CO0000000097
  Revision: 340CO0000000097_20261001_507CO0000000121

境界: 分母 0、控除 ≥ 調整前で 0、端数（割合が割り切れない入力）、
第三号 0、一致・不一致の分岐境界を確認する。
-/

namespace JapanTaxLaw.ConsolidationCreditLimit

-- §2（調整前控除限度額）: 第一号 100, 第二号 200, 第三号 50 → 150
example : preAdjustmentLimit 100 200 50 = 150 := by decide
-- §2: 第一号 0 → 第三号そのもの
example : preAdjustmentLimit 0 10 4 = 4 := by decide
-- §2: 第三号 0 → 第一号そのもの
example : preAdjustmentLimit 1_000 10 0 = 1_000 := by decide
-- §2: 境界 — 分母 0 → 0（第三号が大きくても 0）
example : preAdjustmentLimit 999 0 777 = 0 := by decide
-- §2: 境界 — 第二号 = 1（割合 100%）
example : preAdjustmentLimit 50 1 1 = 51 := by decide
-- §2: 端数 — 第二号 3, 第三号 1（割合 1/3）は乗算先行のため 100 + 1（切り捨てなし）
example : preAdjustmentLimit 100 3 1 = 101 := by decide
-- §2: 端数 — 第二号 7, 第三号 2（割合 2/7）→ 250 + 2 = 252
example : preAdjustmentLimit 250 7 2 = 252 := by decide
-- §2: 第三号 > 第二号（不整合データ、caller-established）でも和を返す（クランプなし）
example : preAdjustmentLimit 10 5 9 = 19 := by decide

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
