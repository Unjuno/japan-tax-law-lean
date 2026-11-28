import JapanTaxLaw.PetroleumCoalSixMonthNoWithdrawalWindow
import JapanTaxLaw.PetroleumCoalSixMonthNoWithdrawalWindowSpec

/-
# PetroleumCoalSixMonthNoWithdrawalWindowTests — 石油石炭税法施行令 16(2)(8) の kernel-decided 検証

Pinned: law 353CO0000000132 / revision 353CO0000000132_20250401_507CO0000000006.
Coverage: 六=6, six-month window boundaries (E=9 → m=4..9 inclusive), future
month excluded, statement-required conjunction, impl/spec agreement.
-/

namespace JapanTaxLaw.PetroleumCoalSixMonthNoWithdrawalWindow

example : sixMonths = 6 := by decide
example : windowEnd 10 = 9 := by decide

-- 六月窓の境界 (E=9: m=4..9)
example : inWindow 10 9 = true := by decide
example : inWindow 10 4 = true := by decide
example : inWindow 10 3 = false := by decide
example : inWindow 10 10 = false := by decide
example : inWindow 10 0 = false := by decide

-- 記載要否
example : statementRequired 10 7 false true = true := by decide
example : statementRequired 10 7 true true = false := by decide
example : statementRequired 10 7 false false = false := by decide
example : statementRequired 10 3 false true = false := by decide

-- impl / 独立仕様の一致
example : sixMonths = specSix := by decide
example : windowEnd 10 = specPrevMonth 10 := by decide
example : inWindow 10 9 = specInSixMonths 10 9 := by decide
example : inWindow 10 4 = specInSixMonths 10 4 := by decide
example : inWindow 10 3 = specInSixMonths 10 3 := by decide
example : inWindow 10 10 = specInSixMonths 10 10 := by decide
example : statementRequired 10 7 false true = specMustState 10 7 false true := by decide
example : statementRequired 10 7 true true = specMustState 10 7 true true := by decide
example : statementRequired 10 7 false false = specMustState 10 7 false false := by decide
example : statementRequired 10 3 false true = specMustState 10 3 false true := by decide

end JapanTaxLaw.PetroleumCoalSixMonthNoWithdrawalWindow
