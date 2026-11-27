import JapanTaxLaw.MinisterialNecessityException

/-
# MinisterialNecessityExceptionSpec — independent spec for 関税割当制度政令 第二条

Declared statutory scope:
  Law id: 336CO0000000153, revision 336CO0000000153_20260401_508CO0000000085
  Article: 第二条 第四項 ただし書 — only the exception switch 「この限りでない」.

The implementation uses a structural match on the first Nat constructor.
This spec transcribes the same switch independently with a propositional
equality test (`if c = 0 then 1 else c`): a different operator, with no
implementation definition reused in any `spec*` def. The universal agreement
theorem is proved by `cases` + `rfl` only, so no axiom is introduced.

Not modelled: the qualified main rule, ministerial authority, other articles,
and human legal determination.
-/

namespace JapanTaxLaw.MinisterialNecessityException

/-- Independent transcription: the necessity case is read as the exception case. -/
def specAsException (c : Nat) : Nat :=
  if c = 0 then 1 else c

/-- Universal, axiom-free kernel correspondence for every case code. -/
theorem agree_as_exception (c : Nat) :
    asException c = specAsException c := by
  cases c <;> rfl

end JapanTaxLaw.MinisterialNecessityException
