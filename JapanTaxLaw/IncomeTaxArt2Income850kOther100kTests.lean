import JapanTaxLaw.IncomeTaxArt2Income850kOther100kSpec

/-!
# IncomeTaxArt2Income850kOther100k tests — kernel-decided boundary checks

Pinned to law 340AC0000000033 / revision 340AC0000000033_20261001_507AC0000000070.
境界: 849999/850000/850001 と 99999/100000/100001。
-/

namespace JapanTaxLaw.IncomeTaxArt2Income850kOther100k

example : withinBoth 0 0 = true := by decide
example : withinBoth 1 1 = true := by decide
example : withinBoth 849999 99999 = true := by decide
example : withinBoth 850000 100000 = true := by decide
example : withinBoth 850001 100000 = false := by decide
example : withinBoth 850000 100001 = false := by decide
example : specWithinBoth 849999 99999 = true := by decide
example : specWithinBoth 850001 100000 = false := by decide

end JapanTaxLaw.IncomeTaxArt2Income850kOther100k
