import JapanTaxLaw.LocalTaxArt20_4_2RoundDown1000Spec

/-!
# LocalTaxArt20_4_2RoundDown1000 tests — kernel-decided boundary checks

Pinned to law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
境界: 999 / 1000 / 1999 / 2000（千円未満切り捨て）。
-/

namespace JapanTaxLaw.LocalTaxArt20_4_2RoundDown1000

example : roundDown 0 = 0 := by decide
example : roundDown 1 = 0 := by decide
example : roundDown 999 = 0 := by decide
example : roundDown 1000 = 1000 := by decide
example : roundDown 1001 = 1000 := by decide
example : roundDown 1999 = 1000 := by decide
example : roundDown 2000 = 2000 := by decide
example : specFloor 999 = 0 := by decide
example : specFloor 1000 = 1000 := by decide
example : roundDown 12345 = specFloor 12345 := by decide

end JapanTaxLaw.LocalTaxArt20_4_2RoundDown1000
