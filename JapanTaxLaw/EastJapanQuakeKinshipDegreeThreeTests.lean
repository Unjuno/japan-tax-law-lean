import JapanTaxLaw.EastJapanQuakeKinshipDegreeThree
import JapanTaxLaw.EastJapanQuakeKinshipDegreeThreeSpec

/-
# EastJapanQuakeKinshipDegreeThreeTests — 東日本大震災特例法施行規則 15(2)(4)ロ の kernel-decided 検証

Pinned: law 423M60000040020 / revision 423M60000040020_20260414_508M60000040039.
Coverage: 三=3, inclusive upper boundary (3 true / 4 false), lower degrees,
impl/spec agreement.
-/

namespace JapanTaxLaw.EastJapanQuakeKinshipDegreeThree

example : thirdDegree = 3 := by decide

-- 「親等内」境界
example : withinThirdDegree 0 = true := by decide
example : withinThirdDegree 1 = true := by decide
example : withinThirdDegree 2 = true := by decide
example : withinThirdDegree 3 = true := by decide
example : withinThirdDegree 4 = false := by decide

-- impl / 独立仕様の一致
example : thirdDegree = specDegree := by decide
example : withinThirdDegree 0 = specWithin 0 := by decide
example : withinThirdDegree 1 = specWithin 1 := by decide
example : withinThirdDegree 2 = specWithin 2 := by decide
example : withinThirdDegree 3 = specWithin 3 := by decide
example : withinThirdDegree 4 = specWithin 4 := by decide

end JapanTaxLaw.EastJapanQuakeKinshipDegreeThree
