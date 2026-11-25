import JapanTaxLaw.TwoOrMorePortMunicipalitiesSpec

/-
# TwoOrMorePortMunicipalitiesTests — kernel-decided boundary checks for 二以上

Closed Nat/Bool expressions discharged by `by decide`, plus applications of
the universal agreement theorem. Coverage: zero, the strict lower boundary
(one vs two), just above the boundary, and impl/spec agreement.
-/

namespace JapanTaxLaw.TwoOrMorePortMunicipalities

-- Zero municipalities: the condition is false.
example : atLeastTwo 0 = false := by decide

-- One municipality is below 「二以上」; two is exactly at the threshold.
example : atLeastTwo 1 = false := by decide
example : atLeastTwo 2 = true := by decide
example : atLeastTwo 3 = true := by decide

-- Independent spec at the same boundary points.
example : specAtLeastTwo 1 = false := by decide
example : specAtLeastTwo 2 = true := by decide
example : specAtLeastTwo 3 = true := by decide

-- Pinned statutory value in both modules.
example : minimumPorts = 2 := rfl
example : specMinimumPorts = 2 := rfl

-- Kernel-decided agreement at the boundary.
example : atLeastTwo 1 = specAtLeastTwo 1 := by decide
example : atLeastTwo 2 = specAtLeastTwo 2 := by decide

-- Universal theorem applied to arbitrary counts (not a finite sample).
example (x : Nat) : atLeastTwo x = specAtLeastTwo x := agree_at_least_two x
example : atLeastTwo 11 = specAtLeastTwo 11 := agree_at_least_two 11

end JapanTaxLaw.TwoOrMorePortMunicipalities
