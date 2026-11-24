import JapanTaxLaw.InterestSplitRate5Pct
import JapanTaxLaw.InterestSplitRate5PctSpec

/-
# InterestSplitRate5PctTests — 第七十一条の六 第一款 の kernel-decided 検証

Pinned: law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
All checks are closed Nat expressions discharged by `by decide`.
Coverage: zero, small inputs, the rate literals 5 and 100 with their
just-below / at / just-above boundaries, exact 5% results and impl/spec
agreement. Finite smoke suite; the universal statement is the spec bridge.
-/

namespace JapanTaxLaw.InterestSplitRate5Pct

-- 原文の数値
example : rateNumerator = 5 := by decide
example : rateDenominator = 100 := by decide
example : rateNumerator * 20 = rateDenominator := by decide

-- 零入力
example : hundredFoldAmount 0 = 0 := by decide

-- 小さい入力
example : hundredFoldAmount 1 = 5 := by decide
example : hundredFoldAmount 2 = 10 := by decide
example : hundredFoldAmount 3 = 15 := by decide

-- 境界: 分子 5 の L-1 / L / L+1
example : hundredFoldAmount 4 = 20 := by decide
example : hundredFoldAmount 5 = 25 := by decide
example : hundredFoldAmount 6 = 30 := by decide

-- 境界: 分母 100 の L-1 / L / L+1
example : hundredFoldAmount 99 = 495 := by decide
example : hundredFoldAmount 100 = 500 := by decide
example : hundredFoldAmount 101 = 505 := by decide

-- 正確な 5%（百で割り切れる課税標準）
example : hundredFoldAmount 200 = 1000 := by decide
example : hundredFoldAmount 1000 = 5000 := by decide

-- impl / 独立仕様の一致
example : rateNumerator = specRateNumerator := by decide
example : rateDenominator = specRateDenominator := by decide
example : hundredFoldAmount 0 = specHundredFold 0 := by decide
example : hundredFoldAmount 100 = specHundredFold 100 := by decide
example : hundredFoldAmount 101 = specHundredFold 101 := by decide
example : hundredFoldAmount 1000 = specHundredFold 1000 := by decide

end JapanTaxLaw.InterestSplitRate5Pct
