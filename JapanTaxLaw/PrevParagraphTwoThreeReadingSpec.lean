import JapanTaxLaw.PrevParagraphTwoThreeReading

/-
# PrevParagraphTwoThreeReadingSpec — independent spec for 米軍地位協定臨時特例法施行令 第三条の二

Declared statutory scope:
  Law id: 327CO0000000124, revision 327CO0000000124_20220401_502CO0000000207
  Article: 第三条の二 (art. 3_2), 第二項 — only the selection 「前条第二項及び第三項」.
  No other article, paragraph or law is modelled here.

The implementation names the two paragraphs with propositional equality
disjunction (`decide (p = 2 ∨ p = 3)`). This spec transcribes the same labels
independently as an explicit structural pattern match on the Nat constructors
(0/1 -> false, 2/3 -> true, any fourth successor -> false): no implementation
definition, no `omega` and no classical reasoning. The universal agreement
theorem is proved by nested `cases` + `decide` (kernel computation only), so
it introduces no axiom at all.

Not modelled: the content of those paragraphs, 課税石油ガス identity, tax
computation, other articles, and human legal determination.
-/

namespace JapanTaxLaw.PrevParagraphTwoThreeReading

/-- Independent structural transcription: only paragraph labels 2 and 3 apply. -/
def specAppliesTo : Nat → Bool
  | 0 => false
  | 1 => false
  | 2 => true
  | 3 => true
  | Nat.succ (Nat.succ (Nat.succ (Nat.succ _))) => false

/-- Universal, axiom-free kernel correspondence for every paragraph label. -/
theorem agree_applies_to (paragraph : Nat) :
    appliesTo paragraph = specAppliesTo paragraph := by
  unfold appliesTo specAppliesTo
  cases paragraph with
  | zero => decide
  | succ p1 =>
    cases p1 with
    | zero => decide
    | succ p2 =>
      cases p2 with
      | zero => decide
      | succ p3 =>
        cases p3 with
        | zero => decide
        | succ _ => rfl

end JapanTaxLaw.PrevParagraphTwoThreeReading
