import JapanTaxLaw.LocalGrantTaxShares

/-!
# LocalGrantTaxShares tests — 94%/6% の境界検査

Pinned to law 325AC0000000211 / revision 325AC0000000211_20261102_508AC0000000062,
art. 6の2. zero / small input / just-below / at / just-above the statutory
numerators, plus a non-multiple-of-100 total to expose floor rounding.
-/

namespace JapanTaxLaw.LocalGrantTaxShares

example : ordinaryShare 0 = 0 := by decide
example : ordinaryShare 1 = 0 := by decide
example : ordinaryShare 93 = 87 := by decide
example : ordinaryShare 94 = 88 := by decide
example : ordinaryShare 100 = 94 := by decide
example : ordinaryShare 101 = 94 := by decide
example : specialShare 1 = 0 := by decide
example : specialShare 6 = 0 := by decide
example : specialShare 100 = 6 := by decide
example : specialShare 10_000 = 600 := by decide

end JapanTaxLaw.LocalGrantTaxShares
