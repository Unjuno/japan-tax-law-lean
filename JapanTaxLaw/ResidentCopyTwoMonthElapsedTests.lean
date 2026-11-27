import JapanTaxLaw.ResidentCopyTwoMonthElapsed
import JapanTaxLaw.ResidentCopyTwoMonthElapsedSpec

/-
# ResidentCopyTwoMonthElapsedTests — 東日本大震災特例法施行規則 3の8(2)(2)ロ(3) の kernel-decided 検証

Pinned: law 423M60000040020 / revision 423M60000040020_20260414_508M60000040039.
Coverage: 二=2, exactly-two boundary false, strictly-after true, zero and
far-later boundaries, impl/spec agreement.
-/

namespace JapanTaxLaw.ResidentCopyTwoMonthElapsed

example : elapsedMonths = 2 := by decide

-- 境界: ちょうど二月は false、その後は true
example : qualified 3 5 = false := by decide
example : qualified 3 6 = true := by decide
example : qualified 3 7 = true := by decide

-- 他の境界
example : qualified 0 2 = false := by decide
example : qualified 0 3 = true := by decide
example : qualified 1 100 = true := by decide

-- impl / 独立仕様の一致
example : elapsedMonths = specTwoMonths := by decide
example : qualified 3 5 = specAfterTwoMonths 3 5 := by decide
example : qualified 3 6 = specAfterTwoMonths 3 6 := by decide
example : qualified 3 7 = specAfterTwoMonths 3 7 := by decide
example : qualified 0 2 = specAfterTwoMonths 0 2 := by decide
example : qualified 0 3 = specAfterTwoMonths 0 3 := by decide
example : qualified 1 100 = specAfterTwoMonths 1 100 := by decide

end JapanTaxLaw.ResidentCopyTwoMonthElapsed
