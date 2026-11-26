import JapanTaxLaw.ApprovalRevocationSameTreatment

/-
# ApprovalRevocationSameTreatmentSpec — independent spec for 石油ガス税法施行規則 第一条

Declared statutory scope:
  Law id: 341M50000040004, revision 341M50000040004_20250401_507M60000040023
  Article: 第一条 第五項 — only the case-extending condition 「承認を取り消す場合も同様」.

The implementation uses a structural match on the first Nat constructor.
This spec transcribes the same condition independently with a propositional
equality test (`if c = 0 then 1 else c`): a different operator, with no
implementation definition reused in any `spec*` def. The universal agreement
theorem is proved by `cases` + `rfl` only, so no axiom is introduced.

Not modelled: the preceding rule, approval procedure, other articles, and
human legal determination.
-/

namespace JapanTaxLaw.ApprovalRevocationSameTreatment

/-- Independent transcription: the revocation case is read as the same-treatment case. -/
def specAsSameTreatment (c : Nat) : Nat :=
  if c = 0 then 1 else c

/-- Universal, axiom-free kernel correspondence for every case code. -/
theorem agree_as_same_treatment (c : Nat) :
    asSameTreatment c = specAsSameTreatment c := by
  cases c <;> rfl

end JapanTaxLaw.ApprovalRevocationSameTreatment
