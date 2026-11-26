import JapanTaxLaw.PrivateContractPublicAuctionReading

/-
# PrivateContractPublicAuctionReadingSpec — independent spec for 国税徴収法施行規則 第一条の六

Declared statutory scope:
  Law id: 337M50000040031, revision 337M50000040031_20260521_506M60000040023
  Article: 第一条の六 — only the 準用 reading 「随意契約 … 公売の規定」.

The implementation uses a structural match on the first Nat constructor.
This spec transcribes the same reading independently with a propositional
equality test (`if c = 0 then 1 else c`): a different operator, with no
implementation definition reused in any `spec*` def. The universal agreement
theorem is proved by `cases` + `rfl` only, so no axiom is introduced.

Not modelled: private-contract conditions, auction procedure, other articles,
and human legal determination.
-/

namespace JapanTaxLaw.PrivateContractPublicAuctionReading

/-- Independent fiction: 随意契約 is read as 公売; other modes preserved. -/
def specAsPublicAuction (c : Nat) : Nat :=
  if c = 0 then 1 else c

/-- Universal, axiom-free kernel correspondence for every mode code. -/
theorem agree_as_public_auction (c : Nat) :
    asPublicAuction c = specAsPublicAuction c := by
  cases c <;> rfl

end JapanTaxLaw.PrivateContractPublicAuctionReading
