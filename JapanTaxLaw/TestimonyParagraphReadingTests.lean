import JapanTaxLaw.TestimonyParagraphReadingSpec

/-
# TestimonyParagraphReadingTests — kernel-decided boundary checks
-/

namespace JapanTaxLaw.TestimonyParagraphReading

example : appliesToTestimony 0 = false := by decide
example : appliesToTestimony 1 = true := by decide
example : appliesToTestimony 2 = true := by decide
example : appliesToTestimony 3 = false := by decide
example : specAppliesToTestimony 1 = true := by decide
example : specAppliesToTestimony 2 = true := by decide
example : specAppliesToTestimony 3 = false := by decide
example : appliesToTestimony 1 = specAppliesToTestimony 1 := by decide
example : appliesToTestimony 2 = specAppliesToTestimony 2 := by decide
example (x : Nat) : appliesToTestimony x = specAppliesToTestimony x := agree_applies_to_testimony x

end JapanTaxLaw.TestimonyParagraphReading
