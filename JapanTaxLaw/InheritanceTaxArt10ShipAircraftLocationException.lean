import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxArt10ShipAircraftLocationException — EXCEPTION

Pinned source:
  Law id: 325AC0000000073
  Official title: 相続税法
  Law number: 昭和二十五年法律第七十三号
  Law type: Act (法律)
  Raw snapshot: data/raw/325AC0000000073_*.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|424b2bac8659abc04e9d8a1ad5d253983282371dfd1da0a4afcb881ca4e8072a
  Source path: LawBody[3]/MainProvision/MainProvision[0]/Article:10/Article#10/Paragraph#1/Item#1/ItemSentence/Sentence#2

原文逐語（pinned, 一字一句改変なし）:
  「ただし、船舶又は航空機については、船籍又は航空機の登録をした機関の所在」

Norm kind: EXCEPTION — the ただし (however) clause: for 船舶 or
航空機, the location is 船籍又は航空機の登録をした機関の所在 (the location of the organ where the ship
registry or aircraft registration was made), instead of the ordinary asset
location in Sentence#1. The computable slice models the exception discriminator:
which asset kinds take the registration-organ location. All statutory terms
below are reproduced programmatically from the verbatim needle; the canonical
quote is byte-verbatim.

Variable contract (meaning / domain / type):
  AssetKind : Type — ordinary ( Sentence#1 rule ), ship, aircraft.
  isRegistrationLocated : AssetKind -> Bool — true for 船舶 and 航空機.
  No numeric amount/unit applies (structural location-source exception).

Scope: only the exception discriminator. The substantive location determination,
the Sentence#1 general rule, and legal correctness are NOT MODELLED.
Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceTaxArt10ShipAircraftLocationException

/-- The asset kinds relevant to the location exception. -/
inductive AssetKind : Type
  | ordinary : AssetKind
  | ship : AssetKind
  | aircraft : AssetKind

/-- 船舶又は航空機については、登録をした機関の所在: registration-organ location. -/
def isRegistrationLocated (k : AssetKind) : Bool :=
  match k with
  | AssetKind.ordinary => false
  | AssetKind.ship => true
  | AssetKind.aircraft => true

/-- 船舶 takes the registration-organ location. -/
theorem ship_excepted : isRegistrationLocated AssetKind.ship = true := rfl

/-- 航空機 takes the registration-organ location. -/
theorem aircraft_excepted : isRegistrationLocated AssetKind.aircraft = true := rfl

/-- An ordinary asset does not take the registration-organ location. -/
theorem ordinary_not_excepted : isRegistrationLocated AssetKind.ordinary = false := rfl

end JapanTaxLaw.InheritanceTaxArt10ShipAircraftLocationException
