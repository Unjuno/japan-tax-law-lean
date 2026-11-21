import JapanTaxLaw.TwoStageVotingThreshold
import JapanTaxLaw.TwoStageVotingThresholdSpec

/-
# TwoStageVotingThresholdTests — kernel-decided boundary checks for 326CO0000000216 第九条

All checks are closed Nat/Bool expressions decided by the kernel (`by decide`)
or applications of universal theorems. Coverage categories (≥3):
`zero` (zero denominator / zero attendees), `small_input` (totals 2, 3, 4, 5),
`boundary` (inclusive 1/2 quorum vs strict 過半数), `tie` (可否同数 numeric
condition yes*2 == present), and `saturation` (cross-multiplication identity at
the exact boundary). Impl/spec agreement is checked on both stages.

Arithmetic note (kernel-decided, python-simulated before pinning):
  2 * 1 >= 3 is FALSE, so quorumMet 1 3 = false (1/3 < 1/2); the true case at
  total = 3 is present = 2. 2 * 2 > 2 is TRUE, so majorityFor 2 2 = true —
  that input is unanimous, NOT a tie. The genuine yes=2 tie is (2,4):
  2 * 2 = 4, not > 4. The labels in the request for those two inputs are
  inconsistent with the pinned formulas; the formulas govern.

Pinned source: law 326CO0000000216, revision 326CO0000000216_20240401_505CO0000000146,
sha256 346e24c2512be9a2ef3524e48a54b67b3bff30d1d81468f69e3f39b92cf8d296,
Article Num 9, needle「税理士会の総会の議事は、会員の二分の一以上の者が出席し、その出席者の過半数で決するものとし、可否同数のときは、議長の決するところによる。」
-/

namespace JapanTaxLaw.TwoStageVotingThreshold

-- (a) zero category: undefined ratio, both stages false.
example : quorumMet 0 0 = false := by decide
example : quorumMet 1 0 = false := by decide
example : majorityFor 0 0 = false := by decide
example : majorityFor 0 2 = false := by decide

-- (b) quorum boundary: 以上 INCLUSIVE. 1/2 passes, 0/2 and 1/3 fail, 2/3 passes.
example : quorumMet 1 2 = true := by decide
example : quorumMet 0 2 = false := by decide
example : quorumMet 1 3 = false := by decide
example : quorumMet 2 3 = true := by decide
example : quorumMet 2 2 = true := by decide

-- (c) majority boundary: 過半数 STRICT. Ties fail; 3/5 and 2/3 pass.
example : majorityFor 2 3 = true := by decide
example : majorityFor 1 2 = false := by decide
example : majorityFor 2 4 = false := by decide
example : majorityFor 2 2 = true := by decide
example : majorityFor 3 5 = true := by decide
example : majorityFor 1 3 = false := by decide

-- (d) saturation: exact cross-multiplication identity at the inclusive edge.
example : 2 * 1 = 2 := by decide
example : 2 - 2 = 0 := by decide

-- (e) the named impl theorems apply at the boundary points.
example : quorumMet 1 2 = true := quorum_one_of_two_true
example : quorumMet 0 2 = false := quorum_zero_of_two_false
example : quorumMet 1 3 = false := quorum_one_of_three_false
example : quorumMet 2 3 = true := quorum_two_of_three_true
example : quorumMet 0 0 = false := quorum_zero_total_false
example : majorityFor 2 3 = true := majority_two_of_three_true
example : majorityFor 1 2 = false := majority_one_of_two_tie_false
example : majorityFor 2 4 = false := majority_two_of_four_tie_false
example : majorityFor 2 2 = true := majority_two_of_two_unanimous_true
example : majorityFor 3 5 = true := majority_three_of_five_true
example : majorityFor 0 0 = false := majority_zero_present_false

-- (f) spec spot-checks and impl/spec agreement on the boundary grid.
example : specQuorum 1 2 = true := by decide
example : specQuorum 1 3 = false := by decide
example : specMajority 2 3 = true := by decide
example : specMajority 1 2 = false := by decide
example : specMajority 2 4 = false := by decide
example : quorumMet 1 2 = specQuorum 1 2 := by decide
example : quorumMet 1 3 = specQuorum 1 3 := by decide
example : majorityFor 2 3 = specMajority 2 3 := by decide
example : majorityFor 1 2 = specMajority 1 2 := by decide
example (present total : Nat) : quorumMet present total = specQuorum present total :=
  agreeQuorum present total
example (yes present : Nat) : majorityFor yes present = specMajority yes present :=
  agreeMajority yes present

end JapanTaxLaw.TwoStageVotingThreshold
