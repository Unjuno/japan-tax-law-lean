import JapanTaxLaw.PopulationInterval15M75M
import JapanTaxLaw.PopulationInterval15M75MSpec

/-
# PopulationInterval15M75MTests — kernel-decided boundary checks for 航空機燃料譲与税法施行規則 第四条

All checks are closed Nat/Bool expressions decided by the kernel (`by decide`)
or applications of the universal theorems. Coverage: zero, small positive
inputs, the 千五百万人 / 七千五百万人 boundaries (both sides), identity /
saturation scaffolding, and impl/spec agreement on the boundary grid.

Pinned source: law 347M50000008026, revision 347M50000008026_20250905_507M60000008091,
sha256 7304e9a98c078d84b5ca2468a5e9932313ffe49e0bf90b40a75371822418b75c,
Article Num 4, needle「千五百万人を超え七千五百万人以下の人数」.
-/

namespace JapanTaxLaw.PopulationInterval15M75M

-- (a) zero persons is outside the interval.
example : inPopulationInterval 0 = false := by decide
example : specInInterval 0 = false := by decide

-- (b) small positive inputs (all far below the 千五百万人 lower bound).
example : inPopulationInterval 1 = false := by decide
example : inPopulationInterval 2 = false := by decide
example : inPopulationInterval 13 = false := by decide

-- (c) lower boundary: 千五百万人 = 15,000,000 is EXCLUDED (超え = strict),
--     15,000,001 is the first included value.
example : inPopulationInterval 15_000_000 = false := by decide
example : inPopulationInterval 15_000_001 = true := by decide

-- (d) upper boundary: 七千五百万人 = 75,000,000 is INCLUDED (以下 = inclusive),
--     75,000,001 is excluded.
example : inPopulationInterval 75_000_000 = true := by decide
example : inPopulationInterval 75_000_001 = false := by decide

-- (e) identity / saturation scaffolding on the statutory constants.
example : popLow = 15_000_000 := by decide
example : popHigh = 75_000_000 := by decide
example : 15_000_000 - 15_000_000 = 0 := by decide

-- (f) the named impl theorems apply at the boundary points.
example : inPopulationInterval 15_000_000 = false := at_lower_false
example : inPopulationInterval 15_000_001 = true := above_lower_true
example : inPopulationInterval 75_000_000 = true := at_upper_true
example : inPopulationInterval 75_000_001 = false := above_upper_false
example : inPopulationInterval 0 = false := zero_false

-- (g) impl/spec agreement on the boundary grid (kernel-decided Bool).
example : inPopulationInterval 0 = specInInterval 0 := by decide
example : inPopulationInterval 1 = specInInterval 1 := by decide
example : inPopulationInterval 15_000_000 = specInInterval 15_000_000 := by decide
example : inPopulationInterval 15_000_001 = specInInterval 15_000_001 := by decide
example : inPopulationInterval 75_000_000 = specInInterval 75_000_000 := by decide
example : inPopulationInterval 75_000_001 = specInInterval 75_000_001 := by decide
example (x : Nat) : inPopulationInterval x = specInInterval x := agreeInterval x

end JapanTaxLaw.PopulationInterval15M75M
