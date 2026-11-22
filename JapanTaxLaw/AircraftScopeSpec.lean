import JapanTaxLaw.AircraftScope

/-!
# AircraftScope spec — 発動機付滑空機 の独立定式
Sources (pinned): law 347CO0000000057, revision 347CO0000000057_20250401_507CO0000000006.
Independent restatement: 指定航空機 = {発動機付滑空機(0)}、その他(1) 対象外。
-/

namespace JapanTaxLaw.AircraftScope

def specAircraft (m : Nat) : Bool := m == 0

example : specAircraft 0 = true := by decide
example : specAircraft 1 = false := by decide

def agreeAircraftScope : Bool :=
  [0, 1, 2].all fun m => isDesignatedAircraft m == specAircraft m

example : agreeAircraftScope = true := by decide

end JapanTaxLaw.AircraftScope
