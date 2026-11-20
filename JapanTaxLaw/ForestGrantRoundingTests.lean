import JapanTaxLaw.ForestGrantRounding

/-!
# ForestGrantRounding tests — 森林環境譲与税法 art.31 smoke checks
Decidable smoke tests, pinned to law 431AC0000000003 / revision 431AC0000000003_20260401_508AC0000000002.
境界: 999→0, 1000→1000, 1499→1000, 12345→12000。有限領域の smoke。
-/

namespace JapanTaxLaw.ForestGrantRounding

example : grainYen = 1_000 := by decide
example : roundDownThousand 0 = 0 := by decide
example : roundDownThousand 1 = 0 := by decide
example : roundDownThousand 999 = 0 := by decide
example : roundDownThousand 1_000 = 1_000 := by decide
example : roundDownThousand 1_499 = 1_000 := by decide
example : roundDownThousand 1_500 = 1_000 := by decide
example : roundDownThousand 12_345 = 12_000 := by decide
example : roundDownThousand 100_000 = 100_000 := by decide

end JapanTaxLaw.ForestGrantRounding
