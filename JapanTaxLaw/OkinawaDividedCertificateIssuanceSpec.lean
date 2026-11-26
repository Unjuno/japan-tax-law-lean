import JapanTaxLaw.OkinawaDividedCertificateIssuance

/-
# OkinawaDividedCertificateIssuanceSpec — independent spec for 沖縄減免税割当省令 第四条

Declared statutory scope:
  Law id: 347M50010000033, revision 347M50010000033_19950401_407M50000200026
  Article: 第四条 第二項 — only the case condition 「受理したときは分割証明書を交付」.

The implementation uses a structural match on the first Nat constructor.
This spec transcribes the same condition independently with a propositional
equality test (`if c = 0 then 1 else c`): a different operator, with no
implementation definition reused in any `spec*` def. The universal agreement
theorem is proved by `cases` + `rfl` only, so no axiom is introduced.

Not modelled: 前項's application requirements, certificate contents, other
articles, and human legal determination.
-/

namespace JapanTaxLaw.OkinawaDividedCertificateIssuance

/-- Independent transcription: the acceptance case is read as the divided-certificate case. -/
def specAsDividedCert (c : Nat) : Nat :=
  if c = 0 then 1 else c

/-- Universal, axiom-free kernel correspondence for every case code. -/
theorem agree_as_divided_cert (c : Nat) :
    asDividedCert c = specAsDividedCert c := by
  cases c <;> rfl

end JapanTaxLaw.OkinawaDividedCertificateIssuance
