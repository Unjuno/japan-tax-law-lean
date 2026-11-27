import JapanTaxLaw.InheritanceTaxArt16Bracket50M100MSpec

/-!
# InheritanceTaxArt16Bracket50M100M tests — kernel-decided boundary checks

Pinned to law 325AC0000000073 / revision 325AC0000000073_20260401_506AC0000000008.
境界: 49,999,999 / 50,000,000 / 50,000,001 と 99,999,999 / 100,000,000 / 100,000,001。
-/

namespace JapanTaxLaw.InheritanceTaxArt16Bracket50M100M

example : inBracket 0 = false := by decide
example : inBracket 1 = false := by decide
example : inBracket 49999999 = false := by decide
example : inBracket 50000000 = false := by decide
example : inBracket 50000001 = true := by decide
example : inBracket 99999999 = true := by decide
example : inBracket 100000000 = true := by decide
example : inBracket 100000001 = false := by decide
example : specInBracket 50000000 = false := by decide
example : specInBracket 100000000 = true := by decide

end JapanTaxLaw.InheritanceTaxArt16Bracket50M100M
