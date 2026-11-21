import JapanTaxLaw.NickelContentThreshold
import JapanTaxLaw.NickelContentThresholdSpec

/-
# NickelContentThresholdTests — kernel-decided boundary checks for 508CO0000000254 第一条

All checks are closed Nat/Bool expressions decided by the kernel (`by decide`)
or applications of universal theorems. Coverage: zero denominator, the 十パーセント
(= 10/100) threshold neighbourhood at total=100 and total=10, small inputs,
cross-multiplication identities, and impl/spec agreement.

Pinned source: law 508CO0000000254, revision 508CO0000000254_20260808_000000000000000,
sha256 aed868d547988eef85a4fe851b8e46bb92ea4b237502c20e76a702a1232e72b0,
Article Num 1, needle「バイメタル（張合せ加工を行ったもので、ニッケルの含有量が全重量の十パーセントを超えるものに限る。）」.
-/

namespace JapanTaxLaw.NickelContentThreshold

-- (a) zero total: the ratio is undefined, so the strict test is false.
example : exceedsNickelThreshold 0 0 = false := by decide
example : exceedsNickelThreshold 1 0 = false := by decide

-- (b) 十パーセント boundary at total = 100.
example : exceedsNickelThreshold 11 100 = true := by decide   -- 11% > 10%
example : exceedsNickelThreshold 10 100 = false := by decide  -- exactly 10%
example : exceedsNickelThreshold 9 100 = false := by decide   -- 9% < 10%

-- (c) boundary at total = 10, plus small positive inputs.
example : exceedsNickelThreshold 1 10 = false := by decide    -- 10% exactly
example : exceedsNickelThreshold 2 10 = true := by decide     -- 20%
example : exceedsNickelThreshold 1 9 = true := by decide      -- 1/9 > 10%

-- (d) exact cross-multiplication identities (saturation at the boundary).
example : 10 * 11 - 10 * 10 = 10 := by decide
example : 100 * 11 - 100 * 10 = 100 := by decide

-- (e) the named impl theorems apply at the boundary points.
example : exceedsNickelThreshold 11 100 = true := eleven_percent_true
example : exceedsNickelThreshold 10 100 = false := exactly_ten_percent_false
example : exceedsNickelThreshold 9 100 = false := nine_percent_false
example : exceedsNickelThreshold 1 10 = false := one_in_ten_false
example : exceedsNickelThreshold 2 10 = true := two_in_ten_true
example : exceedsNickelThreshold 0 0 = false := zero_total_false

-- (f) impl/spec agreement on the boundary grid (kernel-decided Bool).
example : exceedsNickelThreshold 0 0 = specExceeds 0 0 := by decide
example : exceedsNickelThreshold 11 100 = specExceeds 11 100 := by decide
example : exceedsNickelThreshold 10 100 = specExceeds 10 100 := by decide
example : exceedsNickelThreshold 9 100 = specExceeds 9 100 := by decide
example : exceedsNickelThreshold 1 10 = specExceeds 1 10 := by decide
example : exceedsNickelThreshold 2 10 = specExceeds 2 10 := by decide
example (nickel total : Nat) : exceedsNickelThreshold nickel total = specExceeds nickel total :=
  agreeExceeds nickel total

end JapanTaxLaw.NickelContentThreshold
