import JapanTaxLaw.ResidualDistributionOneMonth
import JapanTaxLaw.ResidualDistributionOneMonthSpec

/-
# ResidualDistributionOneMonthTests — 復興特別法人税省令 1(1)(4) の kernel-decided 検証

Pinned: law 424M60000040007 / revision 424M60000040007_20210415_503M60000040045.
Coverage: zero/small inputs, strict-after-FY-end boundary, one-month inclusive
boundary (L-1/L/L+1), shifted FY-end months and impl/spec agreement.
-/

namespace JapanTaxLaw.ResidualDistributionOneMonth

example : oneMonth = 1 := by decide

-- 零入力・小さい入力
example : withinOneMonth 0 0 = false := by decide
example : withinOneMonth 0 1 = true := by decide
example : withinOneMonth 1 2 = true := by decide

-- 境界: 一月 (L-1 / L / L+1)
example : withinOneMonth 0 0 = false := by decide
example : withinOneMonth 0 1 = true := by decide
example : withinOneMonth 0 2 = false := by decide

-- シフトした終了月
example : withinOneMonth 5 5 = false := by decide
example : withinOneMonth 5 6 = true := by decide
example : withinOneMonth 5 7 = false := by decide

-- impl / 独立仕様の一致
example : oneMonth = specOneMonth := by decide
example : withinOneMonth 0 0 = specWithin 0 0 := by decide
example : withinOneMonth 0 1 = specWithin 0 1 := by decide
example : withinOneMonth 0 2 = specWithin 0 2 := by decide
example : withinOneMonth 5 6 = specWithin 5 6 := by decide
example : withinOneMonth 5 7 = specWithin 5 7 := by decide

end JapanTaxLaw.ResidualDistributionOneMonth
