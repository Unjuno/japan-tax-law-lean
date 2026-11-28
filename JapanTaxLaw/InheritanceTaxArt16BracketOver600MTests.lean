import JapanTaxLaw.InheritanceTaxArt16BracketOver600MSpec

/-!
# InheritanceTaxArt16BracketOver600M tests — kernel-decided boundary checks

Pinned to law 325AC0000000073 / revision 325AC0000000073_20260401_506AC0000000008.
境界: 599,999,999 / 600,000,000 / 600,000,001（六億円超）。
-/

namespace JapanTaxLaw.InheritanceTaxArt16BracketOver600M

example : inBracket 0 = false := by decide
example : inBracket 1 = false := by decide
example : inBracket 599999999 = false := by decide
example : inBracket 600000000 = false := by decide
example : inBracket 600000001 = true := by decide
example : specInBracket 599999999 = false := by decide
example : specInBracket 600000001 = true := by decide
example : lowerExclusive = specLower := by decide

end JapanTaxLaw.InheritanceTaxArt16BracketOver600M
