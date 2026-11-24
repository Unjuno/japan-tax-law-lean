import JapanTaxLaw.Vessel500Ton

/-! Independent spec for Vessel500Ton: strict `¬ x < 500` form. -/

namespace JapanTaxLaw.Vessel500TonSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x < 500)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.Vessel500Ton.hasVessel500Ton x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.Vessel500Ton.hasVessel500Ton
  unfold JapanTaxLaw.Vessel500Ton.vesselFloor500
  simp

end JapanTaxLaw.Vessel500TonSpec
