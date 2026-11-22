import JapanTaxLaw.ProductionVolume6KL
import JapanTaxLaw.ProductionVolume6KLSpec

/-
# ProductionVolume6KLTests — kernel-decided checks for 酒税法施行規則 第十二条の二（六キロリットル以上）

All checks are closed Nat expressions discharged by `rfl` / `by decide`, or
theorem-as-proof applications. Coverage: zero, small positive input, both sides
of the 六キロリットル (6 kL) threshold, a large input, and impl/spec agreement.
Boundary categories: zero, small_input, threshold_below (5), threshold_at (6),
threshold_above (7).
-/

namespace JapanTaxLaw.ProductionVolume6KLTests

open JapanTaxLaw.ProductionVolume6KL

-- (a) pinned statutory value: 六キロリットル = 6.
example : volumeFloorKL = 6 := rfl
example : specFloor = 6 := rfl

-- (b) zero projected volume: below the floor.
example : meetsVolumeFloor 0 = false := by decide
example : specMeets 0 = false := by decide

-- (c) small positive input (1): below the floor.
example : meetsVolumeFloor 1 = false := by decide

-- (d) just below the floor (5 < 6): not met.
example : meetsVolumeFloor 5 = false := by decide
example : specMeets 5 = false := by decide

-- (e) exactly at the threshold (6 kL): 以上 is inclusive, so met.
example : meetsVolumeFloor 6 = true := by decide
example : specMeets 6 = true := by decide

-- (f) just above the threshold (7 kL): met.
example : meetsVolumeFloor 7 = true := by decide
example : specMeets 7 = true := by decide

-- (g) well above the threshold (20 kL): met.
example : meetsVolumeFloor 20 = true := by decide
example : specMeets 20 = true := by decide

-- (h) kernel-decided impl/spec agreement at every boundary point.
example : meetsVolumeFloor 0 = specMeets 0 := by decide
example : meetsVolumeFloor 5 = specMeets 5 := by decide
example : meetsVolumeFloor 6 = specMeets 6 := by decide
example : meetsVolumeFloor 7 = specMeets 7 := by decide
example : meetsVolumeFloor 20 = specMeets 20 := by decide

-- (i) universal kernel-checked bridge theorems (theorem-as-proof).
example : volumeFloorKL = specFloor := agreeFloor
example (kl : Nat) : meetsVolumeFloor kl = specMeets kl := agreeMeets kl

end JapanTaxLaw.ProductionVolume6KLTests
