import JapanTaxLaw.InheritanceTaxArt21_7Bracket2MSpec

/-!
# InheritanceTaxArt21_7Bracket2M tests — kernel-decided boundary checks

Pinned to law 325AC0000000073 / revision 325AC0000000073_20260401_506AC0000000008.
境界: 1,999,999 / 2,000,000 / 2,000,001（二百万円以下）。
-/

namespace JapanTaxLaw.InheritanceTaxArt21_7Bracket2M

example : inBracket 0 = true := by decide
example : inBracket 1 = true := by decide
example : inBracket 1999999 = true := by decide
example : inBracket 2000000 = true := by decide
example : inBracket 2000001 = false := by decide
example : specInBracket 1999999 = true := by decide
example : specInBracket 2000001 = false := by decide
example : upperInclusive = specMax := by decide

end JapanTaxLaw.InheritanceTaxArt21_7Bracket2M
