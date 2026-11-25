import JapanTaxLaw.InheritanceTaxArt21_7Bracket3M4MSpec

/-!
# InheritanceTaxArt21_7Bracket3M4M tests — kernel-decided boundary checks

Pinned to law 325AC0000000073 / revision 325AC0000000073_20260401_506AC0000000008.
表セルの境界: 2999999/3000000/3000001 と 3999999/4000000/4000001。
-/

namespace JapanTaxLaw.InheritanceTaxArt21_7Bracket3M4M

example : inBracket 0 = false := by decide
example : inBracket 1 = false := by decide
example : inBracket 2999999 = false := by decide
example : inBracket 3000000 = false := by decide
example : inBracket 3000001 = true := by decide
example : inBracket 3999999 = true := by decide
example : inBracket 4000000 = true := by decide
example : inBracket 4000001 = false := by decide
example : specInBracket 3000000 = false := by decide
example : specInBracket 4000000 = true := by decide

end JapanTaxLaw.InheritanceTaxArt21_7Bracket3M4M
