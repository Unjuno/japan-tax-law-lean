import JapanTaxLaw.SpecialTonSecurityEightTen
import JapanTaxLaw.SpecialTonSecurityEightTenSpec

/-
# SpecialTonSecurityEightTenTests — 特別とん税法施行令 3(1) の kernel-decided 検証

Pinned: law 332CO0000000049 / revision 332CO0000000049_20201001_502CO0000000128.
Closed Nat expressions discharged by `by decide`.
Coverage: zero, boundaries of the spec literals 8 and 10, the 10/8=5/4 rate
identity and impl/spec agreement. Finite smoke suite.
-/

namespace JapanTaxLaw.SpecialTonSecurityEightTen

example : rateNumerator = 10 := by decide
example : rateDenominator = 8 := by decide
example : rateNumerator * 4 = rateDenominator * 5 := by decide

-- 零入力・小さい入力
example : specialAmountTimesDenominator 0 = 0 := by decide
example : specialAmountTimesDenominator 1 = 10 := by decide
example : specialAmountTimesDenominator 2 = 20 := by decide
example : specialAmountTimesDenominator 3 = 30 := by decide

-- 境界: 分子 10
example : specialAmountTimesDenominator 9 = 90 := by decide
example : specialAmountTimesDenominator 10 = 100 := by decide
example : specialAmountTimesDenominator 11 = 110 := by decide

-- 境界: 分母 8
example : specialAmountTimesDenominator 7 = 70 := by decide
example : specialAmountTimesDenominator 8 = 80 := by decide
example : specialAmountTimesDenominator 9 = 90 := by decide

-- impl / 独立仕様の一致
example : rateNumerator = specNum := by decide
example : rateDenominator = specDen := by decide
example : specialAmountTimesDenominator 0 = specTimesDen 0 := by decide
example : specialAmountTimesDenominator 7 = specTimesDen 7 := by decide
example : specialAmountTimesDenominator 8 = specTimesDen 8 := by decide
example : specialAmountTimesDenominator 9 = specTimesDen 9 := by decide
example : specialAmountTimesDenominator 10 = specTimesDen 10 := by decide
example : specialAmountTimesDenominator 11 = specTimesDen 11 := by decide

end JapanTaxLaw.SpecialTonSecurityEightTen
