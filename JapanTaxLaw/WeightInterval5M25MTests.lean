import JapanTaxLaw.WeightInterval5M25M
import JapanTaxLaw.WeightInterval5M25MSpec

/-
# WeightInterval5M25MTests — kernel-decided boundary checks for 航空機燃料譲与税法施行規則 第四条（重量）

All checks are closed Nat/Bool expressions decided by the kernel (`by decide`)
or applications of the universal theorems. Coverage: zero, small positive
inputs, the 五百万トン / 二千五百万トン boundaries (both sides), identity /
saturation scaffolding, and impl/spec agreement on the boundary grid.

Pinned source: law 347M50000008026, revision 347M50000008026_20250905_507M60000008091,
sha256 7304e9a98c078d84b5ca2468a5e9932313ffe49e0bf90b40a75371822418b75c,
Article Num 4 (Paragraph[Num=2] table cell), needle「五百万トンを超え二千五百万トン以下の重量」.
-/

namespace JapanTaxLaw.WeightInterval5M25M

-- (a) zero tons is outside the interval.
example : inWeightInterval 0 = false := by decide
example : specInInterval 0 = false := by decide

-- (b) small positive inputs (all far below the 五百万トン lower bound).
example : inWeightInterval 1 = false := by decide
example : inWeightInterval 2 = false := by decide
example : inWeightInterval 13 = false := by decide

-- (c) lower boundary: 五百万トン = 5,000,000 is EXCLUDED (超え = strict),
--     5,000,001 is the first included value.
example : inWeightInterval 5_000_000 = false := by decide
example : inWeightInterval 5_000_001 = true := by decide

-- (d) upper boundary: 二千五百万トン = 25,000,000 is INCLUDED (以下 = inclusive),
--     25,000,001 is excluded.
example : inWeightInterval 25_000_000 = true := by decide
example : inWeightInterval 25_000_001 = false := by decide

-- (e) identity / saturation scaffolding on the statutory constants.
example : weightLow = 5_000_000 := by decide
example : weightHigh = 25_000_000 := by decide
example : 25_000_000 - 25_000_000 = 0 := by decide

-- (f) the named impl theorems apply at the boundary points.
example : inWeightInterval 5_000_000 = false := at_lower_false
example : inWeightInterval 5_000_001 = true := above_lower_true
example : inWeightInterval 25_000_000 = true := at_upper_true
example : inWeightInterval 25_000_001 = false := above_upper_false
example : inWeightInterval 0 = false := zero_false

-- (g) impl/spec agreement on the boundary grid (kernel-decided Bool).
example : inWeightInterval 0 = specInInterval 0 := by decide
example : inWeightInterval 1 = specInInterval 1 := by decide
example : inWeightInterval 5_000_000 = specInInterval 5_000_000 := by decide
example : inWeightInterval 5_000_001 = specInInterval 5_000_001 := by decide
example : inWeightInterval 25_000_000 = specInInterval 25_000_000 := by decide
example : inWeightInterval 25_000_001 = specInInterval 25_000_001 := by decide
example (w : Nat) : inWeightInterval w = specInInterval w := agreeInterval w

end JapanTaxLaw.WeightInterval5M25M
