import JapanTaxLaw.DiscountBondRefund

/-!
# DiscountBondRefundTests — 租税特別措置法施行令 art. 26の12 の smoke checks

Decidable kernel-decided smoke tests, pinned to

  Law id: 332CO0000000043
  Revision: 332CO0000000043_20261101_507CO0000000127
  Amendment enforcement date: 2026-11-01

確認する境界:

  * 本則: 券面 = 償還で 0、券面 < 償還（買入金額が券面を超える場合も）で 0、
    税率分子 0 で 0、通常の 10% / 20%、端数切り捨て。
  * 一号・二号の金額: 社債発行差金（分母）0 で 0、券面 = 償還で 0、
    国内帰属部分 0 で 0、割合 1、按分 25%、端数切り捨て。
  * 外国法人分の還付額: 券面 = 償還で 0、分母 0 で 0、割合 1 のとき
    本則に一致、端数切り捨て。

`redemptionAmount` には原文「買入消却が行われる場合には、その買入金額」を
適用済みの値を渡す（買入消却区分は caller-established、Bool は金額式に入れない）。

NOT MODELLED: 平成二十六年旧法人税法第百四十一条の外国法人の具体的認定
（一号・二号の区分、国内帰属部分の算定）、税率そのものの算定、
第五項の還付成立・納付額からの控除処理（すべて caller-established、
impl の doc-comment 参照）。

-/

namespace JapanTaxLaw.DiscountBondRefund

open JapanTaxLaw.TaxFinance

-- ==== 本則: discountBondRefund ===

-- 通常の 10% / 20%（償還差益 100,000 → 10,000 / 20,000）
example : discountBondRefund 1_000_000 900_000 (⟨10, 100, by decide⟩ : TaxRate) = 10_000 := by decide
example : discountBondRefund 1_000_000 900_000 (⟨20, 100, by decide⟩ : TaxRate) = 20_000 := by decide

-- 券面 = 償還 → 0
example : discountBondRefund 1_000 1_000 (⟨10, 100, by decide⟩ : TaxRate) = 0 := by decide
example : discountBondRefund 0 0 (⟨10, 100, by decide⟩ : TaxRate) = 0 := by decide

-- 券面 < 償還（買入消却で買入金額が券面を超える場合）→ 0（saturating）
example : discountBondRefund 500 1_000 (⟨10, 100, by decide⟩ : TaxRate) = 0 := by decide
example : discountBondRefund 0 1 (⟨10, 100, by decide⟩ : TaxRate) = 0 := by decide

-- 税率分子 0 → 0
example : discountBondRefund 1_000 0 (⟨0, 100, by decide⟩ : TaxRate) = 0 := by decide

-- 端数切り捨て
example : discountBondRefund 1_001 1_000 (⟨20, 100, by decide⟩ : TaxRate) = 0 := by decide
example : discountBondRefund 1_050 1_000 (⟨3, 10, by decide⟩ : TaxRate) = 15 := by decide
example : discountBondRefund 1_000 997 (⟨3, 10, by decide⟩ : TaxRate) = 0 := by decide

-- 買入消却区分は caller-established: 同じ引数位置に買入金額 800 を渡す例
example : discountBondRefund 1_000 800 (⟨10, 100, by decide⟩ : TaxRate) = 20 := by decide

-- ==== 一号・二号の金額: foreignBondBase ===

-- 按分 25%: (1,000,000 - 900,000) * 25,000 / 100,000 = 25,000
example : foreignBondBase 1_000_000 900_000 100_000 25_000 = 25_000 := by decide

-- 分母（社債発行差金）0 → 0（安全版）
example : foreignBondBase 1_000 900 0 100 = 0 := by decide
example : foreignBondBase 0 0 0 0 = 0 := by decide

-- 券面 = 償還 → 0 / 券面 < 償還 → 0
example : foreignBondBase 1_000 1_000 100 50 = 0 := by decide
example : foreignBondBase 500 1_000 100 50 = 0 := by decide

-- 国内帰属部分 0 → 0
example : foreignBondBase 1_000 900 100 0 = 0 := by decide

-- 割合 1（国内帰属部分 = 社債発行差金）→ 券面 − 償還
example : foreignBondBase 1_000 900 100 100 = 100 := by decide
example : foreignBondBase 1_000 900 200 150 = 75 := by decide

-- 端数切り捨て
example : foreignBondBase 1_000 999 3 1 = 0 := by decide
example : foreignBondBase 1_000 997 3 1 = 1 := by decide
example : foreignBondBase 1_000 991 7 3 = 3 := by decide

-- ==== 外国法人分の還付額: foreignBondRefund ===

example : foreignBondRefund 1_000_000 900_000 100_000 25_000 (⟨10, 100, by decide⟩ : TaxRate) = 2_500 := by decide

-- 券面 = 償還 → 0 / 分母 0 → 0
example : foreignBondRefund 1_000 1_000 100 50 (⟨10, 100, by decide⟩ : TaxRate) = 0 := by decide
example : foreignBondRefund 1_000 900 0 100 (⟨10, 100, by decide⟩ : TaxRate) = 0 := by decide

-- 割合 1 のとき本則に一致: (1,000-900) * 3/10 = 30
example : foreignBondRefund 1_000 900 100 100 (⟨3, 10, by decide⟩ : TaxRate) = 30 := by decide
example : discountBondRefund 1_000 900 (⟨3, 10, by decide⟩ : TaxRate) = 30 := by decide

-- 端数切り捨て（基盤 0 → 還付額 0）
example : foreignBondRefund 1_000 999 3 1 (⟨20, 100, by decide⟩ : TaxRate) = 0 := by decide

end JapanTaxLaw.DiscountBondRefund
