import JapanTaxLaw.LocalTaxArt23IncomeCeiling5MSpec

/-!
# LocalTaxArt23IncomeCeiling5M tests — kernel-decided boundary checks

Pinned to law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
境界: 4999999 / 5000000 / 5000001（五百万円以下）。
-/

namespace JapanTaxLaw.LocalTaxArt23IncomeCeiling5M

example : withinCeiling 0 = true := by decide
example : withinCeiling 1 = true := by decide
example : withinCeiling 4999999 = true := by decide
example : withinCeiling 5000000 = true := by decide
example : withinCeiling 5000001 = false := by decide
example : specWithin 4999999 = true := by decide
example : specWithin 5000000 = true := by decide
example : ceiling = specCeiling := by decide
example : ceiling = 5000000 := by decide
example : withinCeiling 10000000 = specWithin 10000000 := by decide

end JapanTaxLaw.LocalTaxArt23IncomeCeiling5M
