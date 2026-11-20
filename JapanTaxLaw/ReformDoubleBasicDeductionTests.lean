import JapanTaxLaw.ReformDoubleBasicDeduction

/-!
# ReformDoubleBasicDeduction tests — 税制改革関連法 art.9 smoke checks
Decidable smoke tests, pinned to law 363AC0000000107 / revision 363AC0000000107_19881230_000000000000000.
境界: 0、1、500→1000、100万→200万。有限領域の smoke。
-/

namespace JapanTaxLaw.ReformDoubleBasicDeduction

example : doubled 0 = 0 := by decide
example : doubled 1 = 2 := by decide
example : doubled 500 = 1000 := by decide
example : doubled 1_000_000 = 2_000_000 := by decide

end JapanTaxLaw.ReformDoubleBasicDeduction
