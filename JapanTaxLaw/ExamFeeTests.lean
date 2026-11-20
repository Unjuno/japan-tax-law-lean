import JapanTaxLaw.ExamFee

/-!
# ExamFee tests — 税理士法施行令 art.6の2 smoke checks
Decidable smoke tests, pinned to law 326CO0000000216 / revision 326CO0000000216_20240401_505CO0000000146.
境界: 0科目(適用外)/1科目4000/2科目5500/3科目7000/5科目10000、8条2項8800。有限領域の smoke。
-/

namespace JapanTaxLaw.ExamFee

example : baseFee = 4_000 := by decide
example : perExtraSubjectYen = 1_500 := by decide
example : secondClauseFee = 8_800 := by decide
example : examFee 0 = 0 := by decide
example : examFee 1 = 4_000 := by decide
example : examFee 2 = 5_500 := by decide
example : examFee 3 = 7_000 := by decide
example : examFee 4 = 8_500 := by decide
example : examFee 5 = 10_000 := by decide
example : examFee 10 = 17_500 := by decide

end JapanTaxLaw.ExamFee
