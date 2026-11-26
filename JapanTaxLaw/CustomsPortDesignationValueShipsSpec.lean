import JapanTaxLaw.CustomsPortDesignationValueShips

/-! Independent spec for CustomsPortDesignationValueShips: `¬ value <= 50000000 ∧ ¬ ships <= 11`. -/

namespace JapanTaxLaw.CustomsPortDesignationValueShipsSpec

def specBoth (value ships : Nat) : Bool := decide (¬ value <= 50000000 ∧ ¬ ships <= 11)
def agree (value ships : Nat) : Prop :=
  specBoth value ships = JapanTaxLaw.CustomsPortDesignationValueShips.bothExceeded value ships

theorem agree_thm (value ships : Nat) : agree value ships := by
  unfold agree specBoth JapanTaxLaw.CustomsPortDesignationValueShips.bothExceeded
  unfold JapanTaxLaw.CustomsPortDesignationValueShips.valueFloor JapanTaxLaw.CustomsPortDesignationValueShips.shipFloor
  simp

end JapanTaxLaw.CustomsPortDesignationValueShipsSpec
