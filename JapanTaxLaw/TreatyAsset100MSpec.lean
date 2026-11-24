import JapanTaxLaw.TreatyAsset100M

/-! Independent spec for TreatyAsset100M: strict `¬ x <= 100000000` form. -/

namespace JapanTaxLaw.TreatyAsset100MSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x <= 100000000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.TreatyAsset100M.exceedsTreatyAsset100M x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.TreatyAsset100M.exceedsTreatyAsset100M
  unfold JapanTaxLaw.TreatyAsset100M.treatyAssetFloor100M
  simp

end JapanTaxLaw.TreatyAsset100MSpec
