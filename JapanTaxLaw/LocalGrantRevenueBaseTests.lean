import JapanTaxLaw.LocalGrantRevenueBase

/-!
# LocalGrantRevenueBaseTests — 地方交付税法 art. 14「交付金の百分の七十五控除」の smoke checks

Decidable kernel-decided smoke tests, pinned to

  Law id: 325AC0000000211
  Revision: 325AC0000000211_20261102_508AC0000000062

pinned 原文（needle, 一字も変更せず、全角空白 U+3000 なし）:

  「利子割の収入見込額については基準税率をもつて算定した当該道府県の利子割の収入見込額から利子割交付金の交付見込額の百分の七十五に相当する額を控除した額とし、」
  「当該道府県の配当割の収入見込額から地方税法第七十一条の四十七の規定により市町村に対し交付するものとされる配当割に係る交付金（以下この項及び第三項において「配当割交付金」という。）の交付見込額の百分の七十五に相当する額を控除した額とし、」
  「当該道府県の株式等譲渡所得割の収入見込額から同法第七十一条の六十七の規定により市町村に対し交付するものとされる株式等譲渡所得割に係る交付金（以下この項及び第三項において「株式等譲渡所得割交付金」という。）の交付見込額の百分の七十五に相当する額を控除した額とし、」

本テストは 75% = 75/100 と saturating 減算（控除>見込額なら 0）を確認する。
境界: 0、控除>見込額で 0、端数（101→75、76−75=1）。

NOT MODELLED: 本文の他税目・控除、経過措置・附則。基準税率・収入見込額・交付金見込額・
該当性はすべて caller-established。Bool は計算式に混入させていない。

-/

namespace JapanTaxLaw.LocalGrantRevenueBase

open JapanTaxLaw.TaxFinance

-- 定数（原文どおり 75/100）
example : grantDeductionRate.numDen = (75, 100) := by decide
example : grantDeductionRate.den = 100 := by decide
example : 0 < grantDeductionRate.den := by decide
example : grantDeductionRate.applyFloor 0 = 0 := by decide
example : grantDeductionRate.applyFloor 100 = 75 := by decide
example : grantDeductionRate.applyFloor 101 = 75 := by decide
example : grantDeductionRate.applyFloor 200 = 150 := by decide

-- 共通関数 netRevenue: 境界 0 / 控除>見込額で 0 / 端数
example : netRevenue 0 0 = 0 := by decide
example : netRevenue 0 100 = 0 := by decide
example : netRevenue 74 100 = 0 := by decide  -- 75 > 74 → 0
example : netRevenue 75 100 = 0 := by decide  -- 75 = 75 → 0
example : netRevenue 76 100 = 1 := by decide  -- 端数 75、76-75=1
example : netRevenue 1000 0 = 1000 := by decide
example : netRevenue 1000 100 = 925 := by decide  -- 1000-75
example : netRevenue 101 100 = 26 := by decide

-- 利子割
example : interestSplitNetRevenue 0 0 = 0 := by decide
example : interestSplitNetRevenue 0 100 = 0 := by decide
example : interestSplitNetRevenue 74 100 = 0 := by decide
example : interestSplitNetRevenue 76 100 = 1 := by decide
example : interestSplitNetRevenue 1000 100 = 925 := by decide

-- 配当割
example : dividendSplitNetRevenue 0 100 = 0 := by decide
example : dividendSplitNetRevenue 74 100 = 0 := by decide
example : dividendSplitNetRevenue 76 100 = 1 := by decide
example : dividendSplitNetRevenue 1000 100 = 925 := by decide

-- 株式等譲渡所得割
example : stockTransferIncomeSplitNetRevenue 0 100 = 0 := by decide
example : stockTransferIncomeSplitNetRevenue 74 100 = 0 := by decide
example : stockTransferIncomeSplitNetRevenue 76 100 = 1 := by decide
example : stockTransferIncomeSplitNetRevenue 1000 100 = 925 := by decide

-- 3 税目は共通関数と一致する（kernel-decide）
example : interestSplitNetRevenue 1000 100 == netRevenue 1000 100 := by decide
example : dividendSplitNetRevenue 1000 100 == netRevenue 1000 100 := by decide
example : stockTransferIncomeSplitNetRevenue 1000 100 == netRevenue 1000 100 := by decide

end JapanTaxLaw.LocalGrantRevenueBase
