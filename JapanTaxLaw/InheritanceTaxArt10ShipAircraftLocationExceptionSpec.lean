import JapanTaxLaw.InheritanceTaxArt10ShipAircraftLocationException

/-!
# InheritanceTaxArt10ShipAircraftLocationExceptionSpec — independent spec

Law id: 325AC0000000073 (相続税法), revision from INVENTORY. Article 10(1) item1 EXCEPTION
「ただし、船舶又は航空機については、船籍又は航空機の登録をした機関の所在」。 Normative unit: NORM|424b2bac8659abc04e9d8a1ad5d253983282371dfd1da0a4afcb881ca4e8072a

The implementation uses a Bool function; the spec states the excepted set as a Prop
disjunction, representationally distinct. Axiom-free by rfl/left/right/rcases.

Not modelled: substantive location determination, general rule, legal correctness.
-/

namespace JapanTaxLaw.InheritanceTaxArt10ShipAircraftLocationException

/-- Independent spec: the asset kind is one of the excepted kinds. -/
def SpecRegistrationLocated (k : AssetKind) : Prop :=
  k = AssetKind.ship ∨ k = AssetKind.aircraft

/-- 船舶 satisfies the spec. -/
theorem spec_ship : SpecRegistrationLocated AssetKind.ship := by left; rfl

/-- 航空機 satisfies the spec. -/
theorem spec_aircraft : SpecRegistrationLocated AssetKind.aircraft := by right; rfl

/-- Agreement at 船舶. -/
theorem agree_ship :
    (isRegistrationLocated AssetKind.ship = true) ↔ SpecRegistrationLocated AssetKind.ship := by
  constructor
  · intro _h
    exact spec_ship
  · intro _h
    rfl

/-- Agreement at an ordinary asset (not excepted). -/
theorem agree_ordinary :
    (isRegistrationLocated AssetKind.ordinary = false) ↔ ¬ SpecRegistrationLocated AssetKind.ordinary := by
  constructor
  · intro _h hs
    rcases hs with h | h <;> cases h
  · intro _h
    rfl

end JapanTaxLaw.InheritanceTaxArt10ShipAircraftLocationException
