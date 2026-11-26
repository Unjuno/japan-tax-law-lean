import JapanTaxLaw.ApplicationChangeSameTreatment

/-
# ApplicationChangeSameTreatmentSpec — independent spec for 相互防衛援助協定施行令 第四条

Declared statutory scope:
  Law id: 329CO0000000103, revision 329CO0000000103_20250401_507CO0000000006
  Article: 第四条 第一項 — only the case-extending condition 「変更しようとする場合も同様」.

The implementation uses a structural match on the first Nat constructor.
This spec transcribes the same condition independently with a propositional
equality test (`if c = 0 then 1 else c`): a different operator, with no
implementation definition reused in any `spec*` def. The universal agreement
theorem is proved by `cases` + `rfl` only, so no axiom is introduced.

Not modelled: 前項's content, application procedure, other articles, and human
legal determination.
-/

namespace JapanTaxLaw.ApplicationChangeSameTreatment

/-- Independent transcription: the change case is read as the same-treatment case. -/
def specAsSameTreatment (c : Nat) : Nat :=
  if c = 0 then 1 else c

/-- Universal, axiom-free kernel correspondence for every case code. -/
theorem agree_as_same_treatment (c : Nat) :
    asSameTreatment c = specAsSameTreatment c := by
  cases c <;> rfl

end JapanTaxLaw.ApplicationChangeSameTreatment
