import JapanTaxLaw.EvidenceNonSubmissionException

/-
# EvidenceNonSubmissionExceptionSpec — independent spec for 相殺関税政令 第七条

Declared statutory scope:
  Law id: 406CO0000000415, revision 406CO0000000415_20171008_428CO0000000240
  Article: 第七条 第四項 ただし書 — only the exception switch 「この限りでない」.

The implementation uses a structural match on the first Nat constructor.
This spec transcribes the same switch independently with a propositional
equality test (`if c = 0 then 1 else c`): a different operator, with no
implementation definition reused in any `spec*` def. The universal agreement
theorem is proved by `cases` + `rfl` only, so no axiom is introduced.

Not modelled: the qualified main rule, interested party identity, reasonable
period, other articles, and human legal determination.
-/

namespace JapanTaxLaw.EvidenceNonSubmissionException

/-- Independent transcription: the non-submission case is read as the exception case. -/
def specAsException (c : Nat) : Nat :=
  if c = 0 then 1 else c

/-- Universal, axiom-free kernel correspondence for every case code. -/
theorem agree_as_exception (c : Nat) :
    asException c = specAsException c := by
  cases c <;> rfl

end JapanTaxLaw.EvidenceNonSubmissionException
