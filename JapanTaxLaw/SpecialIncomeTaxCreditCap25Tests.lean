import JapanTaxLaw.SpecialIncomeTaxCreditCap25
import JapanTaxLaw.SpecialIncomeTaxCreditCap25Spec

/-
# SpecialIncomeTaxCreditCap25Tests — 第四十一条の十八 第二項 の kernel-decided 検証

Pinned: law 332AC0000000026 / revision 332AC0000000026_20261101_507AC0000000013.
All checks are closed Nat expressions discharged by `by decide`.
Coverage: zero, small inputs, boundaries of the spec literals 25 and 100,
100-yen floor behaviour, strict 超える cap, and impl/spec agreement.
Finite smoke suite; universal claims are the impl theorems.
-/

namespace JapanTaxLaw.SpecialIncomeTaxCreditCap25

-- 原文の数値
example : rateNumerator = 25 := by decide
example : rateDenominator = 100 := by decide
example : floorUnitYen = 100 := by decide

-- 零入力・小さい入力
example : capAmount 0 = 0 := by decide
example : capAmount 1 = 0 := by decide
example : capAmount 99 = 0 := by decide
-- 25円・101円の 25% は 100 円未満なので端数切り捨てで 0。
example : capAmount 100 = 0 := by decide
example : capAmount 101 = 0 := by decide

-- 境界: 25 の L-1 / L / L+1（税額 24/25/26 → 限度額 0/0/0）
example : capAmount 24 = 0 := by decide
example : capAmount 25 = 0 := by decide
example : capAmount 26 = 0 := by decide

-- 境界: 100 の L-1 / L / L+1（税額 99/100/101 → 0/0/0）
example : capAmount 99 = 0 := by decide
example : capAmount 100 = 0 := by decide
example : capAmount 101 = 0 := by decide

-- 百円未満切り捨て（25% = 400円 → 400円、401円→100円（25%=100.25→100））
example : capAmount 400 = 100 := by decide
example : capAmount 401 = 100 := by decide
example : capAmount 799 = 100 := by decide
example : capAmount 800 = 200 := by decide

-- 上限適用（超えるは strict）
example : allowedCredit 80 400 = 80 := by decide
example : allowedCredit 100 400 = 100 := by decide
example : allowedCredit 101 400 = 100 := by decide
example : allowedCredit 0 0 = 0 := by decide

-- impl / 独立仕様の一致
example : rateNumerator = specNumerator := by decide
example : rateDenominator = specDenominator := by decide
example : floorUnitYen = specFloorUnit := by decide
example : capAmount 0 = specCap 0 := by decide
example : capAmount 400 = specCap 400 := by decide
example : capAmount 401 = specCap 401 := by decide
example : allowedCredit 101 400 = specAllowed 101 400 := by decide
example : allowedCredit 100 400 = specAllowed 100 400 := by decide

end JapanTaxLaw.SpecialIncomeTaxCreditCap25
