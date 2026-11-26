import JapanTaxLaw.IncomeTaxArt2DependentAge19To23Spec

/-!
# IncomeTaxArt2DependentAge19To23 tests — kernel-decided boundary checks

Pinned to law 340AC0000000033 / revision 340AC0000000033_20261001_507AC0000000070.
境界: 18/19（十九歳以上）と 22/23（二十三歳未満）。
-/

namespace JapanTaxLaw.IncomeTaxArt2DependentAge19To23

example : inAgeBand 0 = false := by decide
example : inAgeBand 1 = false := by decide
example : inAgeBand 17 = false := by decide
example : inAgeBand 18 = false := by decide
example : inAgeBand 19 = true := by decide
example : inAgeBand 20 = true := by decide
example : inAgeBand 22 = true := by decide
example : inAgeBand 23 = false := by decide
example : inAgeBand 24 = false := by decide
example : specInBand 18 = false := by decide
example : specInBand 19 = true := by decide

end JapanTaxLaw.IncomeTaxArt2DependentAge19To23
