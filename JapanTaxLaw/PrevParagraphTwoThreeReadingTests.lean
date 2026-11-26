import JapanTaxLaw.PrevParagraphTwoThreeReadingSpec

/-
# PrevParagraphTwoThreeReadingTests — kernel-decided checks for 前条二・三項準用

Closed Nat/Bool expressions discharged by `by decide`, plus applications of
the universal agreement theorem. Coverage: zero, both cited labels, just below
and just above the cited range, and agreement at boundary points.
-/

namespace JapanTaxLaw.PrevParagraphTwoThreeReading

example : appliesTo 0 = false := by decide
example : appliesTo 1 = false := by decide
example : appliesTo 2 = true := by decide
example : appliesTo 3 = true := by decide
example : appliesTo 4 = false := by decide
example : appliesTo 5 = false := by decide

example : specAppliesTo 1 = false := by decide
example : specAppliesTo 2 = true := by decide
example : specAppliesTo 3 = true := by decide
example : specAppliesTo 4 = false := by decide

example : appliesTo 1 = specAppliesTo 1 := by decide
example : appliesTo 2 = specAppliesTo 2 := by decide
example : appliesTo 3 = specAppliesTo 3 := by decide

example (x : Nat) : appliesTo x = specAppliesTo x := agree_applies_to x
example : appliesTo 11 = specAppliesTo 11 := agree_applies_to 11

end JapanTaxLaw.PrevParagraphTwoThreeReading
