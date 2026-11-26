import JapanTaxLaw.FreeTradeZoneReading

/-
# FreeTradeZoneReadingSpec — independent spec for 沖縄地方税課税免除省令 第一条

Declared statutory scope:
  Law id: 404M50000008008, revision 404M50000008008_20020301_414M60000008019
  Article: 第一条 第二項 — only the 準用 selection of the two free-trade zones.

The implementation uses a structural match on the first two Nat constructors.
This spec transcribes the same selection independently with propositional
equality tests (`if k = 0 || k = 1 then 1 else 0`): a different operator, with
no implementation definition reused in any `spec*` def. The universal agreement
theorem is proved by nested `cases` + kernel computation (`decide`/`rfl`), so
no axiom is introduced.

Not modelled: 前項's content, tax exemption, other articles, and human legal
determination.
-/

namespace JapanTaxLaw.FreeTradeZoneReading

/-- Independent formulation: exactly the two cited region codes are listed. -/
def specAsListedZone (k : Nat) : Nat :=
  if k = 0 || k = 1 then 1 else 0

/-- Universal, axiom-free kernel correspondence for every region code. -/
theorem agree_as_listed_zone (k : Nat) :
    asListedZone k = specAsListedZone k := by
  unfold asListedZone specAsListedZone
  cases k with
  | zero => decide
  | succ k =>
    cases k with
    | zero => decide
    | succ _ => rfl

end JapanTaxLaw.FreeTradeZoneReading
