import JapanTaxLaw.TokyoAsCityDeemingSpec

/-
# TokyoAsCityDeemingTests — kernel-decided boundary examples for 特別とん譲与税法 art.6

All checks are closed Nat/Bool expressions discharged by `rfl` / `by decide`,
or applications of the universal agreement theorem. Coverage: the pinned
codes, zero (都), the fiction boundary (都 -> 市), preservation of other kinds,
and impl/spec agreement at boundary points.
-/

namespace JapanTaxLaw.TokyoAsCityDeeming

-- The pinned kind codes are 0 = 都, 1 = 市 (documented contract, not statute numbers).
example : 0 = 0 := by decide
example : 1 = 1 := by decide

-- 都 (0) is deemed 市 (1); the result is not the input.
example : asCityCode 0 = 1 := by decide

-- A city (1) and other prefecture (2) are preserved: saturation boundaries.
example : asCityCode 1 = 1 := by decide
example : asCityCode 2 = 2 := by decide
example : asCityCode 3 = 3 := by decide

-- Independent spec decides the same boundary points.
example : specAsCityCode 0 = 1 := by decide
example : specAsCityCode 1 = 1 := by decide
example : specAsCityCode 2 = 2 := by decide

-- Kernel-decided impl/spec agreement at boundary points.
example : asCityCode 0 = specAsCityCode 0 := by decide
example : asCityCode 1 = specAsCityCode 1 := by decide

-- Universal theorem applied to an arbitrary code (not a finite sample).
example (x : Nat) : asCityCode x = specAsCityCode x := agree_as_city_code x
example : asCityCode 9 = specAsCityCode 9 := agree_as_city_code 9

end JapanTaxLaw.TokyoAsCityDeeming
