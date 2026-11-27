import JapanTaxLaw.ParagraphSixSevenReading

/-
# ParagraphSixSevenReadingSpec — independent spec for たばこ税法改正政令整備政令 第三条

Declared statutory scope:
  Law id: 422CO0000000060, revision 422CO0000000060_20101001_000000000000000
  Article: 第三条 — only the selection 「第六項及び第七項」 for 準用.

The implementation uses a structural match on the first two Nat constructors.
This spec transcribes the same selection independently with propositional
equality tests (`if k = 0 || k = 1 then 1 else 0`): a different operator, with
no implementation definition reused in any `spec*` def. The universal agreement
theorem is proved by `cases` + kernel computation (`decide`/`rfl`), so no axiom
is introduced.

Not modelled: content of the selected paragraphs, triggering case, other
articles, and human legal determination.
-/

namespace JapanTaxLaw.ParagraphSixSevenReading

/-- Independent formulation: exactly the two cited paragraph labels are listed. -/
def specAsListed (k : Nat) : Nat :=
  if k = 0 || k = 1 then 1 else 0

/-- Universal, axiom-free kernel correspondence for every paragraph label. -/
theorem agree_as_listed (k : Nat) :
    asListed k = specAsListed k := by
  unfold asListed specAsListed
  cases k with
  | zero => decide
  | succ k =>
    cases k with
    | zero => decide
    | succ _ => rfl

end JapanTaxLaw.ParagraphSixSevenReading
