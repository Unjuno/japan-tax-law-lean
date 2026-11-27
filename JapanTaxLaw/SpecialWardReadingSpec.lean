import JapanTaxLaw.SpecialWardReading

/-
# SpecialWardReadingSpec — independent spec for 口蹄疫特例法施行令 第二条

Declared statutory scope:
  Law id: 422CO0000000221, revision 422CO0000000221_20101029_000000000000000
  Article: 第二条 第六項 — only the 準用 to 特別区.

The implementation uses a structural match on the first Nat constructor.
This spec transcribes the same reading independently with a propositional
equality test (`if c = 0 then 1 else c`): a different operator, with no
implementation definition reused in any `spec*` def. The universal agreement
theorem is proved by `cases` + `rfl` only, so no axiom is introduced.

Not modelled: preceding paragraphs' content, other articles, and human legal
determination.
-/

namespace JapanTaxLaw.SpecialWardReading

/-- Independent transcription: the special ward is read as a listed jurisdiction. -/
def specAsSpecialWard (c : Nat) : Nat :=
  if c = 0 then 1 else c

/-- Universal, axiom-free kernel correspondence for every jurisdiction code. -/
theorem agree_as_special_ward (c : Nat) :
    asSpecialWard c = specAsSpecialWard c := by
  cases c <;> rfl

end JapanTaxLaw.SpecialWardReading
