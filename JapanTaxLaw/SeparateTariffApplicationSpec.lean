import JapanTaxLaw.SeparateTariffApplication

/-
Independent spec for SeparateTariffApplication (関税定率法 第五条).
Own constants only: specChapterRef = 2 (第二章 chapter cross-reference, not a
substantive threshold), specSeparately = true (それぞれ別個の関税として),
specTotal g r = g + r (both tariffs apply in parallel and are summed).
No implementation identifiers in the spec definitions; agreement is established
by the separate unfold + rfl bridge theorems below.
-/

open JapanTaxLaw.SeparateTariffApplication

namespace JapanTaxLaw.SeparateTariffApplicationSpec

def specChapterRef : Nat := 2

def specSeparately : Bool := true

def specTotal (g : Nat) (r : Nat) : Nat := g + r

theorem agreeChapterRef : chapterRef = specChapterRef := by unfold chapterRef specChapterRef; rfl

theorem agreeSeparately : appliedSeparately = specSeparately := by unfold appliedSeparately specSeparately; rfl

theorem agreeTotal (g : Nat) (r : Nat) : totalTariff g r = specTotal g r := by
  unfold totalTariff specTotal
  rfl

end JapanTaxLaw.SeparateTariffApplicationSpec
