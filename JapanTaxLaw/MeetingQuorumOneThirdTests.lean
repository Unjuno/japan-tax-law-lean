import JapanTaxLaw.MeetingQuorumOneThird
import JapanTaxLaw.MeetingQuorumOneThirdSpec

/-
# MeetingQuorumOneThirdTests — kernel-decided boundary checks for 412CO0000000276 第九条

Every check below is a closed Nat/Bool proposition decided by the kernel
(`by decide`) or an application of a universal theorem. The statutory divisor
is 3, so the boundary grid exercises L-1 = 2, L = 3 and L+1 = 4, together with
zero, small positive inputs and an exact larger multiple (3, 9).

Note on (1,4): 3 * 1 = 3 < 4, so 1 of 4 is BELOW 1/3 and the quorum is false;
the INCLUSIVE boundary at t = 4 is first met at a = 2 (3 * 2 = 6 >= 4).

Pinned source: law 412CO0000000276, revision 412CO0000000276_20260401_508CO0000000085,
sha256 e7d2da2024d3909ca5b0db031f8a2bba4e9b6e4e221e9c8d94eaa74e95a9bd18,
Article Num 9, needle「審議会は、委員及び議事に関係のある臨時委員の三分の一以上が出席しなければ、会議を開き、議決することができない。」
-/

namespace JapanTaxLaw.MeetingQuorumOneThird

-- Zero attendance, total = 3: the meeting cannot be opened.
example : quorumMet 0 3 = false := by decide

-- Exactly 1/3 of 3 (INCLUSIVE boundary).
example : quorumMet 1 3 = true := by decide

-- Below 1/3: 1 of 4.
example : quorumMet 1 4 = false := by decide

-- Above 1/3: 2 of 4.
example : quorumMet 2 4 = true := by decide

-- Exactly 1/3 again on a larger multiple: 3 of 9.
example : quorumMet 3 9 = true := by decide

-- The same grid on the independent spec.
example : specQuorum 0 3 = false := by decide
example : specQuorum 1 3 = true := by decide
example : specQuorum 1 4 = false := by decide
example : specQuorum 2 4 = true := by decide
example : specQuorum 3 9 = true := by decide

-- Impl/spec agreement at the boundary points.
example : quorumMet 0 3 = specQuorum 0 3 := by decide
example : quorumMet 1 3 = specQuorum 1 3 := by decide
example : quorumMet 1 4 = specQuorum 1 4 := by decide
example : quorumMet 2 4 = specQuorum 2 4 := by decide
example : quorumMet 3 9 = specQuorum 3 9 := by decide

-- Divisor value and universal agreement (theorem-as-proof).
example : quorumDivisor = 3 := quorum_divisor_three
example : quorumDivisor = specDivisor := agreeDivisor
example : specDivisor = 3 := by decide
example (a : Nat) (t : Nat) : quorumMet a t = specQuorum a t := agreeQuorum a t

-- The named implementation theorems apply at every boundary point.
example : quorumMet 1 3 = true := quorum_one_of_three_true
example : quorumMet 0 3 = false := quorum_zero_of_three_false
example : quorumMet 1 4 = false := quorum_one_of_four_false
example : quorumMet 2 4 = true := quorum_two_of_four_true
example : quorumMet 3 9 = true := quorum_three_of_nine_true

end JapanTaxLaw.MeetingQuorumOneThird
