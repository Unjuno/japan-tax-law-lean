import JapanTaxLaw.RealEstateAcquisitionAfterEnforcement

/-! # spec — 施行日以後の適用判定 (law 325AC0000000226 / art.15)
「施行日以后」を境界包含の比較 `acquisitionDay >= enforcementDay` として再記述する。 -/

namespace JapanTaxLaw.RealEstateAcquisitionAfterEnforcement

def specApplies (acquisitionDay enforcementDay : Nat) : Bool :=
  enforcementDay <= acquisitionDay

def agreeRealEstateAcquisitionAfterEnforcement : Bool :=
  [(0,0),(99,100),(100,100),(101,100),(1000,500)].all fun de =>
    applies de.1 de.2 == specApplies de.1 de.2

example : agreeRealEstateAcquisitionAfterEnforcement = true := by decide

end JapanTaxLaw.RealEstateAcquisitionAfterEnforcement
