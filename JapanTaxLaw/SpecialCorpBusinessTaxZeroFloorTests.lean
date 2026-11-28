import JapanTaxLaw.SpecialCorpBusinessTaxZeroFloor
import JapanTaxLaw.SpecialCorpBusinessTaxZeroFloorSpec

/-
# SpecialCorpBusinessTaxZeroFloorTests — 特別法人事業税施行令 附則2(1)(1) の kernel-decided 検証

Pinned: law 431CO0000000089 / revision 431CO0000000089_20240401_506CO0000000012.
Coverage: zero, small inputs, subtraction, equality and saturation at 零,
plus impl/spec agreement.
-/

namespace JapanTaxLaw.SpecialCorpBusinessTaxZeroFloor

example : floorYen = 0 := by decide

-- 零入力・小さい入力
example : netAmount 0 0 = 0 := by decide
example : netAmount 1 0 = 1 := by decide
example : netAmount 1 2 = 0 := by decide
example : netAmount 2 1 = 1 := by decide

-- 控除後残額・零飽和
example : netAmount 100 40 = 60 := by decide
example : netAmount 40 100 = 0 := by decide
example : netAmount 50 50 = 0 := by decide

-- impl / 独立仕様の一致
example : netAmount 0 0 = specNet 0 0 := by decide
example : netAmount 1 2 = specNet 1 2 := by decide
example : netAmount 100 40 = specNet 100 40 := by decide
example : netAmount 40 100 = specNet 40 100 := by decide
example : netAmount 50 50 = specNet 50 50 := by decide

end JapanTaxLaw.SpecialCorpBusinessTaxZeroFloor
