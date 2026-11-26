import JapanTaxLaw.StationDailyUsers100k

/-! Independent spec for StationDailyUsers100k: `¬ x < 100000`. -/

namespace JapanTaxLaw.StationDailyUsers100kSpec

def specQualified (x : Nat) : Bool := decide (¬ x < 100000)
def agree (x : Nat) : Prop := specQualified x = JapanTaxLaw.StationDailyUsers100k.qualified x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specQualified JapanTaxLaw.StationDailyUsers100k.qualified JapanTaxLaw.StationDailyUsers100k.limit
  simp

end JapanTaxLaw.StationDailyUsers100kSpec
