import JapanTaxLaw.QuorumOneThird
import JapanTaxLaw.QuorumOneThirdSpec

/-
# QuorumOneThirdTests — kernel-decided boundary checks for 412CO0000000277 第七条

All checks are closed Nat/Bool expressions decided by the kernel (`by decide`)
or applications of universal theorems. Coverage: zero denominator, the
三分の一 (= 1/3) threshold neighbourhood at total = 3, 2, 4 and 7, small
positive inputs, cross-multiplication identities, and impl/spec agreement.

Note on (1,4): 3 * 1 = 3 < 4, so 1 of 4 is BELOW 1/3 and the quorum is false;
the inclusive >= threshold at total = 4 is first met at present = 2 (6 >= 4).

Pinned source: law 412CO0000000277, revision 412CO0000000277_20160401_428CO0000000168,
sha256 c473d24ee2e16ec16f15f5ff52b870890a6ae70648672b3a47c0c26f75cc7709,
Article Num 7, needle「審査会は、委員の三分の一以上が出席しなければ、会議を開き、議決することができない。」
-/

namespace JapanTaxLaw.QuorumOneThird

-- (a) zero total: the ratio is undefined, so the quorum test is false.
example : quorumMet 0 0 = false := by decide
example : quorumMet 1 0 = false := by decide

-- (b) 三分の一 boundary at total = 3 (以上 is inclusive).
example : quorumMet 1 3 = true := by decide
example : quorumMet 0 3 = false := by decide

-- (c) smaller totals and small positive inputs.
example : quorumMet 1 2 = true := by decide
example : quorumMet 1 5 = false := by decide

-- (d) total = 4: 1/4 < 1/3 (false); 2/4 >= 1/3 (true).
example : quorumMet 1 4 = false := by decide
example : quorumMet 2 4 = true := by decide

-- (e) seven commissioners: 2/7 < 1/3 (6 < 7); 3/7 >= 1/3 (9 >= 7).
example : quorumMet 2 7 = false := by decide
example : quorumMet 3 7 = true := by decide

-- (f) exact cross-multiplication identities (saturation at the boundary).
example : 3 * 1 = 3 := by decide
example : 3 - 3 = 0 := by decide

-- (g) the named impl theorems apply at the boundary points.
example : quorumMet 1 3 = true := one_third_exact_true
example : quorumMet 1 4 = false := one_in_four_false
example : quorumMet 2 4 = true := two_in_four_true
example : quorumMet 0 3 = false := zero_present_false
example : quorumMet 1 2 = true := one_in_two_true
example : quorumMet 2 7 = false := two_in_seven_false
example : quorumMet 0 0 = false := zero_total_false

-- (h) spec spot-checks and impl/spec agreement on the boundary grid.
example : specQuorum 0 0 = false := by decide
example : specQuorum 1 3 = true := by decide
example : specQuorum 2 7 = false := by decide
example : quorumMet 1 3 = specQuorum 1 3 := by decide
example : quorumMet 2 7 = specQuorum 2 7 := by decide
example : quorumMet 2 7 = false := by decide
example (present total : Nat) : quorumMet present total = specQuorum present total :=
  agreeQuorum present total

end JapanTaxLaw.QuorumOneThird
