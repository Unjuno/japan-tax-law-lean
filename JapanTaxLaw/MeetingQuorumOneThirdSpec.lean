import JapanTaxLaw.MeetingQuorumOneThird

/-
# MeetingQuorumOneThirdSpec — independent spec for 412CO0000000276 第九条 (三分の一以上)

Pinned source:
  Law id: 412CO0000000276
  Revision: 412CO0000000276_20260401_508CO0000000085
  Raw snapshot: data/raw/412CO0000000276_20260401_508CO0000000085.law.json
  sha256: e7d2da2024d3909ca5b0db031f8a2bba4e9b6e4e221e9c8d94eaa74e95a9bd18
  Statutory article: 第九条 (art. 9; raw JSON Article attr.Num = "9")
  原文逐語: 「審議会は、委員及び議事に関係のある臨時委員の三分の一以上が出席しなければ、会議を開き、議決することができない。」

INDEPENDENT FORMULATION. This module restates the statutory 三分の一 = 1/3
using its OWN constant `specDivisor : Nat := 3`, transcribed independently
from the clause, and expresses 「三分の一以上」 as
`specQuorum a t := decide (specDivisor * a >= t)`.
No implementation identifier appears in any independent `spec*` definition:
the divisor value 3 and the comparison are written here from the source text,
not read from the implementation module.

The only bridges are the universal, kernel-checked theorems `agreeDivisor` and
`agreeQuorum`. After unfolding the four definitions the two bodies are
syntactically identical, so plain `rfl` closes each bridge. No proof automation
or placeholder proofs are used anywhere in this module.

Variable contract (same as the implementation): a = 出席者数 (Nat, 人),
t = 委員及び議事に関係のある臨時委員の総数 (Nat, 人); domain t > 0;
三分の一以上 = 3 * a >= t, INCLUSIVE (>=). Not modelled: the meeting/voting
procedure, the composition of 審議会, other paragraphs of 第九条, other articles.
-/

namespace JapanTaxLaw.MeetingQuorumOneThird

/-- Spec-local 三分の一 divisor 三 = 3, independently transcribed from 第九条. -/
def specDivisor : Nat := 3

/-- Independent 「三分の一以上の出席」 (INCLUSIVE >=). -/
def specQuorum (a : Nat) : Nat -> Bool := fun t => decide (specDivisor * a >= t)

/-- Universal, kernel-checked equality of the two statutory divisors. -/
theorem agreeDivisor : quorumDivisor = specDivisor := by unfold quorumDivisor specDivisor; rfl

/-- Universal, kernel-checked correspondence for every Nat input. -/
theorem agreeQuorum (a : Nat) (t : Nat) : quorumMet a t = specQuorum a t := by
  unfold quorumMet specQuorum quorumDivisor specDivisor
  rfl

-- Spec-local, kernel-decided spot-checks (independent of the implementation).
example : specQuorum 1 3 = true := by decide
example : specQuorum 0 3 = false := by decide
example : specQuorum 1 4 = false := by decide
example : specQuorum 2 4 = true := by decide
example : specQuorum 3 9 = true := by decide

end JapanTaxLaw.MeetingQuorumOneThird
