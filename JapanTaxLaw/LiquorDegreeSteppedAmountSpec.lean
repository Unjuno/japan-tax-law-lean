import JapanTaxLaw.LiquorDegreeSteppedAmount

/-
# LiquorDegreeSteppedAmountSpec — independent spec for 酒税法 第二十三条

Independently transcribed the stepped-additive structure with its own constants:
  specBase = 200000 (二十万円), specQualifying = 21 (二十一度以上),
  specFloor = 20 (二十度を超える), specPer = 10000 (一万円).
No implementation identifiers occur inside the spec* definitions. Agreement
with the implementation is established by kernel bridges below.
-/

namespace JapanTaxLaw.LiquorDegreeSteppedAmountSpec

open JapanTaxLaw.LiquorDegreeSteppedAmount

/-- 二十万円 — independent base amount. -/
def specBase : Nat := 200_000

/-- 二十一度以上 — independent inclusive qualifying degree. -/
def specQualifying : Nat := 21

/-- 二十度を超える — independent strictly-above floor degree. -/
def specFloor : Nat := 20

/-- 一万円 — independent per-degree amount. -/
def specPer : Nat := 10_000

/-- Independent stepped-additive fee (same statutory boundary, own constants). -/
def specFee (degrees : Nat) : Nat :=
  if specQualifying <= degrees then
    specBase + (degrees - specFloor) * specPer
  else
    specBase

theorem agreeBase : baseAmount = specBase := by
  unfold baseAmount specBase
  rfl

theorem agreeQualifying : qualifyingDegree = specQualifying := by
  unfold qualifyingDegree specQualifying
  rfl

theorem agreeFloor : degreeFloor = specFloor := by
  unfold degreeFloor specFloor
  rfl

theorem agreePer : perDegreeAmount = specPer := by
  unfold perDegreeAmount specPer
  rfl

theorem agreeFee (degrees : Nat) : feeFor degrees = specFee degrees := by
  unfold feeFor specFee baseAmount specBase qualifyingDegree specQualifying degreeFloor specFloor perDegreeAmount specPer
  rfl

end JapanTaxLaw.LiquorDegreeSteppedAmountSpec
