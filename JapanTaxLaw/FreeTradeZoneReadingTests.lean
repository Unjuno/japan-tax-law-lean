import JapanTaxLaw.FreeTradeZoneReadingSpec

/-
# FreeTradeZoneReadingTests — kernel-decided boundary checks
-/

namespace JapanTaxLaw.FreeTradeZoneReading

example : asListedZone 0 = 1 := by decide
example : asListedZone 1 = 1 := by decide
example : asListedZone 2 = 0 := by decide
example : asListedZone 3 = 0 := by decide
example : specAsListedZone 0 = 1 := by decide
example : specAsListedZone 1 = 1 := by decide
example : specAsListedZone 2 = 0 := by decide
example : asListedZone 0 = specAsListedZone 0 := by decide
example : asListedZone 2 = specAsListedZone 2 := by decide
example (x : Nat) : asListedZone x = specAsListedZone x := agree_as_listed_zone x

end JapanTaxLaw.FreeTradeZoneReading
