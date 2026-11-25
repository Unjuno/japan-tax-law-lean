import JapanTaxLaw.OneSenFractionTruncationSpec

/-
# OneSenFractionTruncationTests — kernel-decided checks for 一銭未満端数控除

Closed Nat expressions discharged by `rfl` / `by decide`, plus applications of
the universal agreement theorem. Coverage: zero, small amounts, both fraction
flags, and impl/spec agreement.
-/

namespace JapanTaxLaw.OneSenFractionTruncation

-- Zero and small whole-銭 amounts are preserved when a fraction is present.
example : floorToSen 0 true = 0 := by decide
example : floorToSen 1 true = 1 := by decide
example : floorToSen 2 true = 2 := by decide

-- No fraction: the amount is unchanged.
example : floorToSen 1 false = 1 := by decide
example : floorToSen 3 false = 3 := by decide

-- Independent spec at the same points.
example : specFloorToSen 0 true = 0 := by decide
example : specFloorToSen 2 true = 2 := by decide

-- Kernel-decided agreement at boundary points.
example : floorToSen 0 true = specFloorToSen 0 true := by decide
example : floorToSen 1 false = specFloorToSen 1 false := by decide

-- Universal theorem applied to arbitrary inputs (not a finite sample).
example (s : Nat) (f : Bool) : floorToSen s f = specFloorToSen s f := agree_floor_to_sen s f
example : floorToSen 11 false = specFloorToSen 11 false := agree_floor_to_sen 11 false

end JapanTaxLaw.OneSenFractionTruncation
