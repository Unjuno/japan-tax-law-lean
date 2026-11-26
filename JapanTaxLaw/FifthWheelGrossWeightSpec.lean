import JapanTaxLaw.FifthWheelGrossWeight

/-! Independent spec: express the deductible portion with `min` instead of an
`if`, i.e. `recorded - min recorded fifthWheel + towing`. This is a different
surface form whose equality with saturating subtraction is proved by omega.
No `Classical.choice` is introduced (the conditional formulation did). -/
namespace JapanTaxLaw.FifthWheelGrossWeight

def specGrossWeight (recorded fifthWheel towing : Nat) : Nat :=
  (recorded - min recorded fifthWheel) + towing

theorem agreeGrossWeight (recorded fifthWheel towing : Nat) :
    specGrossWeight recorded fifthWheel towing = grossWeight recorded fifthWheel towing := by
  unfold specGrossWeight grossWeight
  omega

end JapanTaxLaw.FifthWheelGrossWeight
