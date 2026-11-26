import JapanTaxLaw.RailPassengerVolume10k150k

/-! Independent spec for RailPassengerVolume10k150k: `¬ x < 10000 ∧ ¬ 150000 <= x`. -/

namespace JapanTaxLaw.RailPassengerVolume10k150kSpec

def specInBand (x : Nat) : Bool := decide (¬ x < 10000 ∧ ¬ 150000 <= x)
def agree (x : Nat) : Prop := specInBand x = JapanTaxLaw.RailPassengerVolume10k150k.inBand x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specInBand JapanTaxLaw.RailPassengerVolume10k150k.inBand
  unfold JapanTaxLaw.RailPassengerVolume10k150k.lowerBound JapanTaxLaw.RailPassengerVolume10k150k.upperBound
  simp

end JapanTaxLaw.RailPassengerVolume10k150kSpec
