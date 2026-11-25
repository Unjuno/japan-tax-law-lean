import JapanTaxLaw.ReconstructionEqualLevySurcharge500
import JapanTaxLaw.ReconstructionEqualLevySurcharge500Spec

/-
# ReconstructionEqualLevySurcharge500Tests — 復興特例法 2(1) の kernel-decided 検証

Pinned: law 423AC0000000118 / revision 423AC0000000118_20111202_000000000000000.
Closed Nat expressions discharged by `by decide`.
Coverage: zero, boundaries of the 500-yen surcharge, the cross-law ¥1,000 base
reconstruction (1500) and impl/spec agreement.
-/

namespace JapanTaxLaw.ReconstructionEqualLevySurcharge500

example : surchargeYen = 500 := by decide

-- 零入力・小さい入力
example : specialStandardRate 0 = 500 := by decide
example : specialStandardRate 1 = 501 := by decide
example : specialStandardRate 2 = 502 := by decide

-- 境界: 500 の L-1 / L / L+1
example : specialStandardRate 499 = 999 := by decide
example : specialStandardRate 500 = 1000 := by decide
example : specialStandardRate 501 = 1001 := by decide

-- 地方税法38条の千円 base との再構成
example : JapanTaxLaw.PerCapitaEqualRate.standardRate = 1000 := by decide
example : specialStandardRate JapanTaxLaw.PerCapitaEqualRate.standardRate = 1500 := by decide

-- impl / 独立仕様の一致
example : surchargeYen = specSurcharge := by decide
example : specialStandardRate 0 = specSpecialRate 0 := by decide
example : specialStandardRate 499 = specSpecialRate 499 := by decide
example : specialStandardRate 500 = specSpecialRate 500 := by decide
example : specialStandardRate 501 = specSpecialRate 501 := by decide
example : specialStandardRate 1000 = specSpecialRate 1000 := by decide

end JapanTaxLaw.ReconstructionEqualLevySurcharge500
