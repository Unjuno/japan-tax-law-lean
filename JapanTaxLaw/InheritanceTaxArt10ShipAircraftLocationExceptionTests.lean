import JapanTaxLaw.InheritanceTaxArt10ShipAircraftLocationExceptionSpec

/-!
# InheritanceTaxArt10ShipAircraftLocationExceptionTests — kernel-checked checks

Verifies EXCEPTION 「ただし、船舶又は航空機については、船籍又は航空機の登録をした機関の所在」: ships/aircraft use registration-organ location; others not.
-/

namespace JapanTaxLaw.InheritanceTaxArt10ShipAircraftLocationException

example : isRegistrationLocated AssetKind.ship = true := ship_excepted
example : isRegistrationLocated AssetKind.aircraft = true := aircraft_excepted
example : isRegistrationLocated AssetKind.ordinary = false := ordinary_not_excepted
example : SpecRegistrationLocated AssetKind.ship := spec_ship
example : SpecRegistrationLocated AssetKind.aircraft := spec_aircraft
example : (isRegistrationLocated AssetKind.ship = true) ↔ SpecRegistrationLocated AssetKind.ship := agree_ship
example : (isRegistrationLocated AssetKind.ordinary = false) ↔ ¬ SpecRegistrationLocated AssetKind.ordinary := agree_ordinary

end JapanTaxLaw.InheritanceTaxArt10ShipAircraftLocationException
