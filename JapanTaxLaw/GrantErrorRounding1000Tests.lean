import JapanTaxLaw.GrantErrorRounding1000

/-!
# GrantErrorRounding1000 tests — kernel-decided boundary examples
Pinned to law 331M50000002007, revision 331M50000002007_20230401_505M60000008036, art. 8(3).
Unit: 円; truncation to the nearest lower multiple of 1000.
-/

namespace JapanTaxLaw.GrantErrorRounding1000

example : roundedError 0 = 0 := by decide
example : roundedError 1 = 0 := by decide
example : roundedError 999 = 0 := by decide
example : roundedError 1000 = 1000 := by decide
example : roundedError 1001 = 1000 := by decide
example : roundedError 2500 = 2000 := by decide
example : roundedError 100000 = 100000 := by decide

end JapanTaxLaw.GrantErrorRounding1000
