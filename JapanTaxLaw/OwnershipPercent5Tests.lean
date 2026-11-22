import JapanTaxLaw.OwnershipPercent5
import JapanTaxLaw.OwnershipPercent5Spec

/-
# OwnershipPercent5Tests — kernel-decided checks for 租税特別措置法施行令 第一条の八

Pinned source: law 329CO0000000155, revision 329CO0000000155_20260401_508CO0000000085,
  data/raw/329CO0000000155_20260401_508CO0000000085.law.json,
  sha256 7f76960b6510a6bd086c236c7d7facf5e47cb276f24a3f4a705c0c0aa8e15d01.
Every closed check below is a Nat/Bool expression discharged by `by decide`.
Coverage: zero(0), small positive(1), just-below(4), at(5), just-above(6),
large(100), plus impl/spec agreement at concrete points and for every Nat input.
-/

namespace JapanTaxLaw.OwnershipPercent5

-- (a) zero and small positive inputs are below 五パーセント.
example : meetsOwnershipThreshold 0 = false := by decide
example : meetsOwnershipThreshold 1 = false := by decide

-- (b) just below the inclusive boundary: 4 % does not meet 五パーセント以上.
example : meetsOwnershipThreshold 4 = false := by decide

-- (c) inclusive boundary: 5 % meets 五パーセント以上.
example : meetsOwnershipThreshold 5 = true := by decide

-- (d) just above and large: 6 % / 100 % meet 五パーセント以上.
example : meetsOwnershipThreshold 6 = true := by decide
example : meetsOwnershipThreshold 100 = true := by decide

-- (e) the statutory percentage literal.
example : ownershipThresholdPercent = 5 := by decide

-- (f) independent spec, kernel-decided at the same boundary points.
example : specThreshold = 5 := by decide
example : specMeets 0 = false := by decide
example : specMeets 4 = false := by decide
example : specMeets 5 = true := by decide
example : specMeets 6 = true := by decide

-- (g) impl/spec agreement at concrete points (theorems used as proofs).
example : meetsOwnershipThreshold 0 = specMeets 0 := agreeMeets 0
example : meetsOwnershipThreshold 4 = specMeets 4 := agreeMeets 4
example : meetsOwnershipThreshold 5 = specMeets 5 := agreeMeets 5
example : meetsOwnershipThreshold 6 = specMeets 6 := agreeMeets 6
example : ownershipThresholdPercent = specThreshold := agreeThreshold

-- (h) impl/spec agreement for every Nat input.
example (percent : Nat) : meetsOwnershipThreshold percent = specMeets percent := agreeMeets percent

end JapanTaxLaw.OwnershipPercent5
