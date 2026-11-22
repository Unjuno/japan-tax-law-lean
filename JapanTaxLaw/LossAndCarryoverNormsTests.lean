import JapanTaxLaw.LossAndCarryoverNorms
import JapanTaxLaw.LossAndCarryoverNormsSpec

/-!
# LossAndCarryoverNormsTests — 損失・繰越
-/
namespace JapanTaxLaw.LossAndCarryoverNormsTests

open JapanTaxLaw.LossAndCarryoverNorms

theorem deficit_spec (i e : Nat) :
    deficitAmount i e = JapanTaxLaw.LossAndCarryoverNormsSpec.deficitSpec i e := by rfl

theorem carry_spec (c s y : Nat) :
    carryWithinYears 0 c s y = true ↔ JapanTaxLaw.LossAndCarryoverNormsSpec.carrySpec c s y := by
  simp [carryWithinYears, JapanTaxLaw.LossAndCarryoverNormsSpec.carrySpec]

theorem disaster_spec (y d : Nat) :
    disasterLossWindow y d = true ↔ JapanTaxLaw.LossAndCarryoverNormsSpec.disasterSpec y d := by
  simp [disasterLossWindow, JapanTaxLaw.LossAndCarryoverNormsSpec.disasterSpec]

example (i e : Nat) (h : e <= i) : deficitAmount i e = 0 := deficit_zero_when_covered i e h
example (s y : Nat) : carryWithinYears 0 s s y = true := carry_at_start s y
example (c s y : Nat) (h : s + y < c) : carryWithinYears 0 c s y = false := carry_outside c s y h
example (d : Nat) : disasterLossWindow d d = true := disaster_at_year d
example (y d : Nat) (h : d + 3 < y) : disasterLossWindow y d = false := disaster_after_window y d h
example : lossDeclared = true := loss_is_declaration

end JapanTaxLaw.LossAndCarryoverNormsTests
