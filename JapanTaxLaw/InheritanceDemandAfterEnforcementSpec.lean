import JapanTaxLaw.InheritanceDemandAfterEnforcement

/-! # spec — 施行日以後の適用判定 (law 325AC0000000073 / art.18)
「施行日以后」を境界包含の比較として独立に再記述する。 -/

namespace JapanTaxLaw.InheritanceDemandAfterEnforcement

def specApplies (demandDay enforcementDay : Nat) : Bool :=
  enforcementDay <= demandDay

def agreeInheritanceDemandAfterEnforcement : Bool :=
  [(0,0),(99,100),(100,100),(101,100),(365,200)].all fun de =>
    applies de.1 de.2 == specApplies de.1 de.2

example : agreeInheritanceDemandAfterEnforcement = true := by decide

end JapanTaxLaw.InheritanceDemandAfterEnforcement
