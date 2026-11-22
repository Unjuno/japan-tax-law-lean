import JapanTaxLaw.AircraftScope

/-!
# AircraftScope tests — 航空機の範囲 smoke checks
Decidable smoke tests, pinned to law 347CO0000000057 / revision 347CO0000000057_20250401_507CO0000000006.
発動機付滑空機(0)→true、その他(1,2)→false。
-/

namespace JapanTaxLaw.AircraftScope

example : isDesignatedAircraft 0 = true := by decide
example : isDesignatedAircraft 1 = false := by decide
example : isDesignatedAircraft 2 = false := by decide

end JapanTaxLaw.AircraftScope
