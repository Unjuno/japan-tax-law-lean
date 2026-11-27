import JapanTaxLaw.ParagraphSixSevenReadingSpec

/-
# ParagraphSixSevenReadingTests — kernel-decided boundary checks
-/

namespace JapanTaxLaw.ParagraphSixSevenReading

example : asListed 0 = 1 := by decide
example : asListed 1 = 1 := by decide
example : asListed 2 = 0 := by decide
example : asListed 3 = 0 := by decide
example : specAsListed 0 = 1 := by decide
example : specAsListed 1 = 1 := by decide
example : asListed 0 = specAsListed 0 := by decide
example : asListed 2 = specAsListed 2 := by decide
example (x : Nat) : asListed x = specAsListed x := agree_as_listed x
example : asListed 9 = specAsListed 9 := agree_as_listed 9

end JapanTaxLaw.ParagraphSixSevenReading
